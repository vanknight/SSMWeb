package com.web.service.impl;

import com.alipay.api.domain.ItemInfo;
import com.web.bean.pojo.OrderItem;
import com.web.bean.pojo.ProductReview;
import com.web.dao.OrderItemMapper;
import com.web.dao.ProductReviewMapper;
import com.web.service.OrderItemService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/6 13:11
 * @description:
 */
@Service("orderItemService")
public class OrderItemServiceImpl implements OrderItemService {

    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private ProductReviewMapper productReviewMapper;

    @Override
    public List<OrderItem> findByOid(String oid) {
        return orderItemMapper.findByOid(oid);
    }

    @Override
    public OrderItem findByOiid(String oiid) {
        return orderItemMapper.findByOiid(oiid);
    }

    @Override
    public List<OrderItem> findAll() {
        return orderItemMapper.findAll();
    }

    @Override
    public boolean insertOrderItems(List<OrderItem> orderItems) {
        return orderItemMapper.insertOrderItems(orderItems) > 0;
    }

    @Override
    public boolean insertProductReview(ProductReview review) {
        return productReviewMapper.insertProductReview(review) > 0;
    }

    @Override
    public boolean updateState(String itemId,Long state) {
        OrderItem orderItem = new OrderItem();
        orderItem.setState(state);
        orderItem.setItemId(itemId);
        return orderItemMapper.updateState(orderItem) > 0;
    }

    @Override
    public boolean updateItemsState(List<OrderItem> list, Long state) {
        for (int i = 0;i<list.size();i++){
            OrderItem orderItem = list.get(i);
            boolean mark = updateState(orderItem.getItemId(),state);
            if(!mark){
                return false;
            }
        }
        return true;

    }

    @Override
    public OrderItem findByOiidAndUid(String itemId, Long uid) {
        return orderItemMapper.findByOiidAndUid(itemId,uid);
    }
}
