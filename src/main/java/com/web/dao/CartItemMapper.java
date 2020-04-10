package com.web.dao;

import com.web.bean.pojo.CartItem;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/25 16:00
 * @description:
 */
public interface CartItemMapper {

    List<CartItem> findByUid(@Param("uid") Long uid);

    List<CartItem> findAll();

    CartItem findByUidAndPid(@Param("uid") Long uid, @Param("pid") String pid);

    CartItem findByUidAndPidNoObj(@Param("uid") Long uid, @Param("pid") String pid);

    int insertCartItem(@Param("pid") String pid, @Param("count") Long count,
        @Param("subtotal") Double subtotal, @Param("uid") Long uid);

    int updateByUidAndPid(@Param("pid") String pid, @Param("count") Long count,
        @Param("subtotal") Double subtotal, @Param("uid") Long uid);

    int deleteCartItem(@Param("uid") Long uid, @Param("pid") String pid);

    int deleteCartItemByUid(@Param("uid") Long uid);

    int clear();

}
