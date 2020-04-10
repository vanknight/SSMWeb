package com.web.service;

import com.web.bean.pojo.OrderItem;
import com.web.bean.pojo.ProductReview;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/6 13:06
 * @description:
 */
public interface OrderItemService {

    List<OrderItem> findByOid(String oid);

    OrderItem findByOiid(String oiid);

    public List<OrderItem> findAll();

    boolean insertOrderItems(List<OrderItem> orderItems);

    boolean insertProductReview(ProductReview review);

    boolean updateState(String itemId,Long state);

    boolean updateItemsState(List<OrderItem> list, Long state);

    OrderItem findByOiidAndUid(String itemId, Long uid);
}