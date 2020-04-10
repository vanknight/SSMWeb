package com.web.service;

import com.web.bean.pojo.Orders;
import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/6 13:06
 * @description:
 */
public interface OrdersService {

    Orders findByOid(String oid);

    List<Orders> findAll();

    boolean insertOrders(Orders orders);

    boolean deleteByOid(String oid);

    boolean updateByOid(Orders orders);

    List<Orders> findByUid(Long uid);

    List<Orders> findByUid(Long uid, Integer pageNum, Integer pageSize);

    boolean deleteByUid(Long uid);
}
