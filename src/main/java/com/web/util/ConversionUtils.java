package com.web.util;


import com.alipay.api.domain.GoodsDetail;
import com.web.bean.pojo.CartItem;
import com.web.bean.pojo.OrderItem;
import com.web.bean.pojo.Product;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/5 17:48
 * @description:
 */
public class ConversionUtils {


    public static GoodsDetail cartItemToGoodsDetail(CartItem cartItem) {

        Product product = cartItem.getProduct();
        GoodsDetail goodsDetail = new GoodsDetail();
        if (product.getName() != null && !product.getName().equals("")) {
            goodsDetail.setGoodsName(product.getName());
        }

        if (product.getPid() != null && !product.getPid().equals("")) {
            goodsDetail.setGoodsId(product.getPid());
        }

        if (product.getShopPrice() != null) {
            goodsDetail.setPrice(String.valueOf(
                product.getShopPrice()
            ));
        }

        if (cartItem.getCount() != null && cartItem.getCount() > 0) {
            goodsDetail.setQuantity(cartItem.getCount());
        }

        if (product.getDesc() != null && !product.getDesc().equals("")) {
            goodsDetail.setBody(product.getDesc());
        }

        return goodsDetail;

    }

    public static GoodsDetail orderItemToGoodsDetail(OrderItem orderItem) {

        Product product = orderItem.getProduct();

        GoodsDetail goodsDetail = new GoodsDetail();
        if (product.getName() != null && !product.getName().equals("")) {
            goodsDetail.setGoodsName(product.getName());
        }

        if (product.getPid() != null && !product.getPid().equals("")) {
            goodsDetail.setGoodsId(product.getPid());
        }

        if (product.getShopPrice() != null) {
            goodsDetail.setPrice(String.valueOf(
                product.getShopPrice()
            ));
        }

        if (orderItem.getCount() != null && orderItem.getCount() > 0) {
            goodsDetail.setQuantity(orderItem.getCount());
        }

        if (product.getDesc() != null && !product.getDesc().equals("")) {
            goodsDetail.setBody(product.getDesc());
        }
        return goodsDetail;

    }


    public static OrderItem cartItemToOrderItem(CartItem cartItem, String oid) {

        Product product = cartItem.getProduct();
        OrderItem orderItem = new OrderItem();
        if (product != null) {
            orderItem.setProduct(product);
            if (product.getPid() != null && !product.getPid().equals("")) {
                orderItem.setPid(product.getPid());
            }else{
                return null;
            }

            if (cartItem.getCount() != null && cartItem.getCount() > 0) {
                if (cartItem.getCount() <= cartItem.getProduct().getStock()) {
                    orderItem.setCount(cartItem.getCount());
                } else {
                    orderItem.setCount(null);
                }

            }else{
                return null;
            }

            if (cartItem.getSubtotal() != null && cartItem.getSubtotal() > 0) {
                orderItem.setSubtotal(cartItem.getSubtotal());
            }else{
                return null;
            }
        }else{
            return null;
        }
        orderItem.setItemId(RandomUtils.getUUID32());
        orderItem.setOid(oid);
        return orderItem;
    }


}
