package com.web.dao;

import com.web.bean.pojo.Orders;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/6 11:36
 * @description:
 */
public interface OrdersMapper {

    Orders findByOid(@Param("oid") String oid);

    List<Orders> findAll();

    int insertOrders(Orders orders);

    int deleteByOid(@Param("oid") String oid);

    int updateByOid(Orders orders);

    List<Orders> findByUid(@Param("uid") Long uid);
}
