package com.web.dao;

import com.web.bean.pojo.WishProduct;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/19 16:13
 * @description:
 */
public interface WishProductMapper {

    List<WishProduct> findAll();

    List<WishProduct> findByUid(@Param("uid") Long uid);

    int insertWishProduct(WishProduct wishProduct);

    int deleteWishProduct(@Param("uid") Long uid, @Param("pid") String pid);

    int deleteWishProductByWid(@Param("wid") String wid);

    WishProduct findByUidAndPid(@Param("uid") Long uid, @Param("pid") String pid);

    int deleteWishProductByUid(@Param("uid") Long uid);
}
