package com.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.web.bean.pojo.CartItem;
import com.web.bean.pojo.OrderItem;
import com.web.dao.CartItemMapper;
import com.web.dao.ProductMapper;
import com.web.service.CartItemService;
import com.web.service.RedisService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/25 16:00
 * @description:
 */
@Service("cartItemService")
public class CartItemServiceImpl implements CartItemService {

    @Autowired
    private CartItemMapper cartItemMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private RedisService redisService;

    @Autowired
    private DataSourceTransactionManager transactionManager;

    private int cacheTime = 10;

    @Override
    public List<CartItem> findByUid(Long uid) {
        return cartItemMapper.findByUid(uid);
    }

    @Override
    public List<CartItem> findAll() {
        return cartItemMapper.findAll();
    }

    @Override
    public List<CartItem> findByUid(Integer pageNum, Integer pageSize, Long uid) {
        PageHelper.startPage(pageNum, pageSize);
        return cartItemMapper.findByUid(uid);
    }

    @Override
    public boolean addCartItem(Long uid, String pid, Long count) {

        CartItem cartItem = cartItemMapper.findByUidAndPid(uid, pid);
        if (cartItem == null) {
            Double subtotal = productMapper.findByPid(pid).getShopPrice() * count;
            return cartItemMapper.insertCartItem(pid, count, subtotal, uid) > 0;
        } else {
            Long count_ = count + cartItem.getCount();
            Double subtotal = productMapper.findByPid(pid).getShopPrice() * count_;
            return cartItemMapper.updateByUidAndPid(pid, count_, subtotal, uid) > 0;
        }
    }

    @Override
    public boolean updateCartItem(Long uid, String pid, Long count, double subtotal) {
        return cartItemMapper.updateByUidAndPid(pid, count, subtotal, uid) > 0;
    }

    @Override
    public boolean deleteCartItem(Long uid, String pid) {
        return cartItemMapper.deleteCartItem(uid, pid) > 0;

    }

    @Override
    public boolean clearCartItem(Long uid) {
        return cartItemMapper.deleteCartItemByUid(uid) > 0;

    }

    @Override
    public List<CartItem> findAllRedis() {
        String key = "cartItem_findAll";
        try {
            if (redisService.exists(key)) {
                return redisService.getListObject(key, CartItem.class);
            } else {
                List<CartItem> list = cartItemMapper.findAll();
                redisService.setListObject(key, list, cacheTime);
                return list;
            }
        } catch (Exception e) {
            return cartItemMapper.findAll();
        }
    }

    @Override
    public CartItem findByUidAndPid(Long uid, String pid) {
        return cartItemMapper.findByUidAndPid(uid, pid);
    }

    @Override
    public CartItem findByUidAndPidNoObj(Long uid, String pid) {
        return cartItemMapper.findByUidAndPidNoObj(uid, pid);
    }

    @Override
    @Async
    public void deleteCartItemByOrderItems(Long uid, List<OrderItem> list) {
        for (OrderItem oi : list) {
            cartItemMapper.deleteCartItem(uid, oi.getPid());
        }
    }

    @Override
    public boolean deleteCartItem(Long uid) {
        return cartItemMapper.deleteCartItemByUid(uid) > 0;
    }


}
