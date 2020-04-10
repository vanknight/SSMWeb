package com.web.service;

import com.web.bean.pojo.CartItem;
import com.web.bean.pojo.OrderItem;
import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/25 16:00
 * @description:
 */
public interface CartItemService {

    public List<CartItem> findByUid(Long uid);

    public List<CartItem> findAll();

    public List<CartItem> findByUid(Integer pageNum, Integer pageSize, Long uid);

    public boolean addCartItem(Long uid, String pid, Long count);

    public boolean updateCartItem(Long uid, String pid, Long count, double subtotal);

    public boolean deleteCartItem(Long uid, String pid);

    public boolean clearCartItem(Long uid);

    public List<CartItem> findAllRedis();

    CartItem findByUidAndPid(Long uid, String pid);
    CartItem findByUidAndPidNoObj(Long uid, String pid);

    void deleteCartItemByOrderItems(Long uid, List<OrderItem> list);

    boolean deleteCartItem(Long uid);

}
