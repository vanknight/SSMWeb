package com.web.dao;

import com.web.bean.pojo.OrderItem;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/6 11:36
 * @description:
 */
public interface OrderItemMapper {

    List<OrderItem> findByOid(@Param("oid") String oid);

    List<OrderItem> findAll();

    int insertOrderItems(List<OrderItem> orderItems);

    int insertOrderItem(OrderItem orderItems);

    int deleteByOid(@Param("oid") String oid);

    OrderItem findByOiid(String oiid);

    int updateState(OrderItem orderItem);

    OrderItem findByOiidAndUid(@Param("itemId")String itemId,@Param("uid")Long uid);
}
