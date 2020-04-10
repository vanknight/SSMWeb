package com.web.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayResponse;
import com.alipay.api.domain.GoodsDetail;
import com.alipay.api.response.AlipayTradeFastpayRefundQueryResponse;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.pagehelper.PageInfo;
import com.web.annotation.Authorization;
import com.web.annotation.CurrentUser;
import com.web.bean.extend.AlipayTradeQueryExtend;
import com.web.bean.extend.AlipayTradeRefundQueryExtend;
import com.web.bean.pojo.*;
import com.web.bean.temp.Logistics;
import com.web.bean.temp.ShopPayModel;
import com.web.config.AlipayConfiguration;
import com.web.dao.ProductMapper;
import com.web.service.*;
import com.web.util.Constants;
import com.web.util.ConversionUtils;
import com.web.util.JsonUtils;
import com.web.util.RandomUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/27 12:57
 * @description:
 */
@Controller
@RequestMapping("/order")
public class OrdersController {
    private Logger log = Logger.getLogger(getClass());

    @Autowired
    private CartItemService cartItemService;
    @Autowired
    private AlipayService alipayService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private OrderItemService orderItemService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ExpressService expressService;
    @Autowired
    private KdApiService kdApiService;


    @Autowired
    private JsonUtils jsonUtils;

    @Authorization
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView orderByUID(
        @CurrentUser User user,
        @RequestParam(value = "pid", required = false) String[] pids
    ) throws UnsupportedEncodingException {

        ModelAndView mv = new ModelAndView();

        if (user != null) {
            if (pids == null || pids.length < 1) {
                String msg = new String("没有选择商品".getBytes("utf-8"), "ISO-8859-1");
                mv.setViewName("redirect:/view/shop-msg/" + msg + ".do");
                return mv;
            }
            Orders orders = new Orders();
            orders.setOid(RandomUtils.getUUID32());
            orders.setUid(user.getUid());
            List<OrderItem> orderItems = new ArrayList<>();
            Double allTotal = 0.0;
            for (int i = 0; i < pids.length; i++) {
                CartItem cartItem = cartItemService.findByUidAndPid(user.getUid(), pids[i]);
                OrderItem orderItem = ConversionUtils
                    .cartItemToOrderItem(cartItem, orders.getOid());

                if (orderItem != null && orderItem.getCount() != null) {
                    orderItem.setState(0L);
                    allTotal += orderItem.getSubtotal();
                    orderItems.add(orderItem);
                } else {
                    String msg = new String("有商品库存不够".getBytes("utf-8"), "ISO-8859-1");
                    mv.setViewName("redirect:/view/shop-msg/" + msg + ".do");
                    return mv;
                }
            }
            log.debug("订单项获取成功");
            orders.setList(orderItems);
            orders.setOrderTime(new Date());
            orders.setTotal(allTotal);
            orders.setState(Constants.UN_PAY);
            boolean mark = ordersService.insertOrders(orders);
            if (mark) {
                log.debug("订单创建成功");
                cartItemService.deleteCartItemByOrderItems(user.getUid(), orders.getList());
                log.debug("购物车项删除成功");
                mv.setViewName("redirect:/order/check/" + orders.getOid() + ".do");
            } else {
                log.debug("创建订单失败");
                String msg = new String("创建订单失败".getBytes("utf-8"), "ISO-8859-1");
                mv.setViewName("redirect:/view/shop-msg/" + msg + ".do");
                return mv;
            }
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "验证失效，请重新登陆");
        }
        return mv;
    }


    @Authorization
    @RequestMapping(value = "/check/{oid}", produces = "text/html;charset=UTF-8",
        method = RequestMethod.GET)
    public ModelAndView payUI(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws AlipayApiException, IOException {

        ModelAndView mv = new ModelAndView("user/shop-checkout");
        if (user != null) {
            Orders orders = ordersService.findByOid(oid);
            if (orders != null) {
                user.setPassword(null);
                mv.addObject("status", Constants.SUCCESS);
                mv.addObject("data", orders);
                mv.addObject("user", user);
            } else {
                mv.addObject("status", Constants.ERROR);
                mv.addObject("msg", "没有该订单");
            }
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "未登录，无法获取订单");
        }
        return mv;
    }


    @Authorization
    @RequestMapping(value = "/pay/{oid}", produces = "text/html;charset=UTF-8",
        method = RequestMethod.POST)
    public void orderToPay(
        @CurrentUser User user,
        @ModelAttribute("payModel") ShopPayModel shopPayModel,
        HttpServletRequest request,
        HttpServletResponse response,
        @PathVariable("oid") String oid
    ) throws AlipayApiException, IOException {
        request.setCharacterEncoding("utf-8");
        if (user != null && shopPayModel != null) {

            Orders orders = ordersService.findByOid(oid);
            List<GoodsDetail> goodsDetails = new ArrayList<>();

            for (OrderItem oi : orders.getList()) {
                GoodsDetail goodsDetail = ConversionUtils.orderItemToGoodsDetail(oi);
                goodsDetails.add(goodsDetail);
            }
            orders.setName(shopPayModel.getName());
            orders.setTelephone(shopPayModel.getTelephone());
            orders.setAddress(shopPayModel.getAddress().trim());
            orders.setOrderTime(new Date());

            boolean mark = ordersService.updateByOid(orders);
            if (mark) {
//                boolean mark_ = productService.updateProductPStock(orders.getList());
                boolean mark_ = productService.checkProductPStock(orders.getList());
                if (mark_) {
                    String returnURL = request.getScheme() + "://" + request.getServerName() + ":" +
                        request.getServerPort() + request.getContextPath() + "/order/returnUrl.do";

                    String notifyURL = request.getScheme() + "://" + request.getServerName() + ":" +
                        request.getServerPort() + request.getContextPath() + "/order/notifyUrl.do";

                    AlipayResponse alipayResponse = alipayService
                        .shopTradePay(orders, goodsDetails, returnURL, notifyURL);

                    String form = alipayResponse.getBody();
                    response.setContentType("text/html;charset=UTF-8");
                    response.getWriter().write(form);//直接将完整的表单html输出到页面
                    response.getWriter().flush();
                    response.getWriter().close();
                } else {
                    response.sendRedirect(request.getContextPath() + "/view/shop-msg/有商品库存不够.do");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/view/shop-msg/订单更改失败,请稍后重试.do");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/view/shop-msg/验证失效,无法提交订单.do");
        }
    }


    @Authorization
    @RequestMapping(value = "/refund/{oid}", produces = "text/html;charset=UTF-8",
        method = RequestMethod.POST)
    public ResponseEntity orderToRefund(
        @CurrentUser User user,
        @PathVariable("oid") String oid,
        @RequestParam("reason") String reason
    ) throws AlipayApiException, IOException {
        Map<String, Object> map = new LinkedHashMap<>(2);

        if (user != null) {
            Orders orders = ordersService.findByOid(oid);
            AlipayTradeRefundResponse alipayResponse = alipayService
                .shopTradeRefund(orders, reason);

            if (alipayResponse != null) {
                String code = alipayResponse.getCode();
                if (code.equals("10000")) {
                    orders.setState(Constants.REFUNDED);
                    orders.setOrderTime(new Date());
                    ordersService.updateByOid(orders);
                    map.put("status", Constants.SUCCESS);
                    map.put("msg", "退款成功");
                } else {
                    String msg = alipayResponse.getSubMsg();
                    map.put("status", Constants.ERROR);
                    map.put("msg", msg);
                }
            } else {
                map.put("status", Constants.ERROR);
                map.put("msg", "退款失败");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "验证失效，请重新登陆");
        }

        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }


    @Authorization
    @RequestMapping(value = "/query/{oid}", produces = "text/html;charset=UTF-8",
        method = RequestMethod.GET)
    public ModelAndView orderToQuery(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws AlipayApiException, IOException {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("order/shop-order-content");
        if (user != null) {
            AlipayTradeQueryResponse alipayResponse = alipayService.shopTradeQuery(oid);
            //请求
            if (alipayResponse != null) {
                String code = alipayResponse.getCode();
                if (code.equals("10000")) {
                    AlipayTradeQueryExtend tradeQueryExtend = new AlipayTradeQueryExtend(
                        alipayResponse);
                    modelAndView.addObject("status", Constants.SUCCESS);
                    modelAndView.addObject("data", tradeQueryExtend);
                } else {
                    String msg = alipayResponse.getSubMsg();
                    modelAndView.addObject("status", Constants.ERROR);
                    modelAndView.addObject("msg", msg);
                }
            } else {
                modelAndView.addObject("status", Constants.ERROR);
                modelAndView.addObject("msg", "查询失败");
            }
        } else {

            modelAndView.addObject("status", Constants.ERROR);
            modelAndView.addObject("msg", "验证失效，请重新登陆");
        }
        return modelAndView;
    }

    @Authorization
    @RequestMapping(value = "/refund-query/{oid}", produces = "text/html;charset=UTF-8",
        method = RequestMethod.GET)
    public ModelAndView orderToRefundQuery(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws AlipayApiException, IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("order/shop-order-refund-content");
        if (user != null) {
            AlipayTradeFastpayRefundQueryResponse alipayResponse = alipayService
                .shopTradeRefundQuery(oid);

            //请求
            if (alipayResponse != null) {
                String code = alipayResponse.getCode();
                if (code.equals("10000")) {
                    AlipayTradeRefundQueryExtend tradeRefundQueryExtend = new AlipayTradeRefundQueryExtend(
                        alipayResponse);
                    modelAndView.addObject("status", Constants.SUCCESS);
                    modelAndView.addObject("data", tradeRefundQueryExtend);
                } else {
                    String msg = alipayResponse.getSubMsg();
                    modelAndView.addObject("status", Constants.ERROR);
                    modelAndView.addObject("msg", msg);
                }
            } else {
                modelAndView.addObject("status", Constants.ERROR);
                modelAndView.addObject("msg", "查询失败");
            }

        } else {
            modelAndView.addObject("status", Constants.ERROR);
            modelAndView.addObject("msg", "验证失效，请重新登陆");
        }

        return modelAndView;
    }

    @Authorization
    @RequestMapping(value = "/express-query/{oid}", produces = "text/html;charset=UTF-8",
        method = RequestMethod.GET)
    public ModelAndView orderToExpressQuery(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("order/shop-order-express-content");
        if (user != null) {
            Express express = expressService.findByOid(oid);

            //请求
            if (express != null) {
                Logistics logistics = kdApiService
                    .getOrderTracesByJson(express.getShipperCode(), express.getLogisticCode());
                if (logistics.getState() != null) {
                    modelAndView.addObject("status", Constants.SUCCESS);
                    modelAndView.addObject("data", logistics);
                } else {
                    modelAndView.addObject("status", Constants.ERROR);
                    modelAndView.addObject("msg", "未查询到快递信息");
                }
            } else {
                modelAndView.addObject("status", Constants.ERROR);
                modelAndView.addObject("msg", "暂无快递信息");
            }

        } else {
            modelAndView.addObject("status", Constants.ERROR);
            modelAndView.addObject("msg", "验证失效，请重新登陆");
        }

        return modelAndView;
    }

    @Authorization
    @RequestMapping(value = "/{oid}", produces = "text/html;charset=UTF-8",
        method = RequestMethod.GET)
    public ModelAndView getOrder(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws AlipayApiException, IOException {
        ModelAndView mv = new ModelAndView("order/shop-order");
        if (user != null) {
            Orders orders = ordersService.findByOid(oid);
            if (orders != null) {
                mv.addObject("status", Constants.SUCCESS);
                mv.addObject("data", orders);
            } else {
                mv.addObject("status", Constants.ERROR);
                mv.addObject("msg", "没有该订单");
            }
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "验证失效，请重新登陆");
        }
        return mv;
    }

    @Authorization
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public ModelAndView getOrders(
        @CurrentUser User user,
        @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
        @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize
    ) throws AlipayApiException, IOException {
        ModelAndView mv = new ModelAndView("order/shop-order-list");
        if (user != null) {
            List<Orders> list = ordersService.findByUid(user.getUid(), pageNum, pageSize);
            if (list == null || list.size() < 1) {
                mv.addObject("status", Constants.ERROR);
                mv.addObject("msg", "没有订单");
            } else {
                PageInfo<Orders> pageInfo = new PageInfo<>(list);
                mv.addObject("status", Constants.SUCCESS);
                mv.addObject("data", pageInfo);
            }
        } else {
            mv.addObject("status", Constants.ERROR);
            mv.addObject("msg", "验证失效，请重新登陆");
        }
        return mv;
    }

    @RequestMapping("/returnUrl")
    public ModelAndView returnUrl(HttpServletRequest request, HttpServletResponse response)
        throws UnsupportedEncodingException, AlipayApiException {
        ModelAndView mv = new ModelAndView();

        //获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                    : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), AlipayConfiguration.charset);
            params.put(name, valueStr);
        }

        boolean verifyResult = alipayService.rsaCheckV1(params);
        if (verifyResult) {
            //商户订单号
            String orderID = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),
                AlipayConfiguration.charset);

            //支付宝交易号
            String alipayOrderID = new String(
                request.getParameter("trade_no").getBytes("ISO-8859-1"),
                AlipayConfiguration.charset);

            //付款金额
            String allTotal = new String(
                request.getParameter("total_amount").getBytes("ISO-8859-1"),
                AlipayConfiguration.charset);

            Orders orders = ordersService.findByOid(orderID);
            orders.setOid(orderID);
            orders.setTotal(Double.valueOf(allTotal));
            //支付确认
            orders.setState(Constants.ALREADY_PAY);
            orders.setOrderTime(new Date());

            boolean mark = ordersService.updateByOid(orders);
            boolean mark2 = orderItemService.updateItemsState(orders.getList(), 1L);

            if (mark && mark2) {
                //修改库存
                boolean mark_ = productService.updateProductPStock(orders.getList());
                if (mark_) {
                    log.debug("订单支付成功，减少库存成功");
                    String msg = new String("订单支付成功".getBytes("utf-8"), "ISO-8859-1");
                    mv.setViewName("redirect:/view/shop-msg/" + msg + ".do");
                } else {
                    log.debug("订单支付成功，减少库存失败");
                    String msg = new String("库存修改失败,请联系管理员".getBytes("utf-8"), "ISO-8859-1");
                    mv.setViewName("redirect:/view/shop-msg/" + msg + ".do");
                }
            } else {

                String msg = new String("服务出错，请联系管理员".getBytes("utf-8"), "ISO-8859-1");
                mv.setViewName("redirect:/view/shop-msg/" + msg + ".do");
            }


        } else {
            String msg = new String("订单验证失败".getBytes("utf-8"), "ISO-8859-1");
            mv.setViewName("redirect:/view/shop-msg/" + msg + ".do");
        }
        return mv;
    }

    @RequestMapping("/notifyUrl")
    public ModelAndView notifyUrl(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("base/shop-index");
        Map map = request.getParameterMap();

        Set set = map.keySet();
        for (Object s : set) {
            System.out.println(map.get(s).toString());
        }

        return mv;
    }


    @Authorization
    @RequestMapping(value = "/del/{oid}", method = {
        RequestMethod.GET}, produces = "text/json;charset=UTF-8")
    public ModelAndView deleteOrder(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws IOException, ServletException {
        Map<String, Object> map = new LinkedHashMap<>(2);
        Orders orders = ordersService.findByOid(oid);
        ModelAndView mv = new ModelAndView();


        if (user != null && user.getUid().equals(orders.getUid())) {
            map.put("status", Constants.SUCCESS);
            boolean mark = ordersService.deleteByOid(oid);
            if (mark) {
                String msg = new String("删除成功".getBytes("utf-8"), "ISO-8859-1");
                mv.setViewName("redirect:/view/shop-msg/" + msg + ".do");
            } else {
                String msg = new String("删除失败".getBytes("utf-8"), "ISO-8859-1");
                mv.setViewName("redirect:/view/shop-msg/" + msg + ".do");
            }
        } else {
            String msg = new String("权限不够或未登陆".getBytes("utf-8"), "ISO-8859-1");
            mv.setViewName("redirect:/view/shop-msg/" + msg + ".do");
        }
        return mv;
    }


    @Authorization
    @RequestMapping(value = "/receipt/{oid}", method = RequestMethod.POST)
    public ResponseEntity reviewByItemId(
        @CurrentUser User user,
        @PathVariable("oid") String oid
    ) throws JsonProcessingException {
        Map<String, Object> map = new LinkedHashMap<String, Object>(2);
        Orders orders = ordersService.findByOid(oid);
        if(user != null) {
            if (orders != null && orders.getState().equals(1) &&
                orders.getUid().equals(user.getUid())) {
                orders.setState(Constants.RECEIPTED);
                boolean mark = ordersService.updateByOid(orders);
                if(mark){
                    map.put("status", Constants.SUCCESS);
                    map.put("msg", "确认收货成功");
                }else{
                    map.put("status", Constants.ERROR);
                    map.put("msg", "确认收货失败");
                }
            }
        }else{
            map.put("status", Constants.ERROR);
            map.put("msg", "没有登陆");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Authorization
    @RequestMapping(value = "/item/review/{itemId}", method = RequestMethod.POST)
    public ResponseEntity reviewByItemId(
        @CurrentUser User user,
        @PathVariable("itemId") String itemId,
        @RequestParam("content") String content,
        @RequestParam("rating") Double rating,
        @RequestParam(value = "images", required = false) List<MultipartFile> files
    ) throws JsonProcessingException {

        Map<String, Object> map = new LinkedHashMap<String, Object>(2);
        if (user != null) {
            OrderItem orderItem = orderItemService.findByOiidAndUid(itemId,user.getUid());
            //0不可评论 1可评论 2已评论 3审核中
            if (orderItem != null && orderItem.getState() != null &&
                orderItem.getState().equals(1L)) {
                ProductReview review = new ProductReview();
//            review.setImages();
                review.setContent(content);
                review.setRating(rating);
                review.setUid(user.getUid());
                review.setPid(orderItem.getPid());
                review.setTime(new Date());
                boolean mark = orderItemService.insertProductReview(review);
                if (mark) {
                    orderItemService.updateState(itemId, 2L);
                    changeProductRating(orderItem.getPid());
                    map.put("status", Constants.SUCCESS);
                    map.put("msg", "评论成功");
                } else {
                    map.put("status", Constants.SUCCESS);
                    map.put("msg", "评论失败");
                }
            } else {
                map.put("status", Constants.ERROR);
                map.put("msg", "不可评论");
            }
        } else {
            map.put("status", Constants.ERROR);
            map.put("msg", "不可评论");
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

    @Async
    public void changeProductRating(String pid) {
        Product product = productService.findByPid(pid);
        List<ProductReview> list = product.getListReview();
        Double rating = 5.0;
        for (ProductReview pr : list) {
            rating += pr.getRating();
        }
        rating = rating / (list.size()+1.0);
        productService.updateRating(pid, rating);

    }

}
