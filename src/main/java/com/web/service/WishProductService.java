package com.web.service;

import com.web.bean.pojo.WishProduct;
import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/19 16:24
 * @description:
 */
public interface WishProductService {

    List<WishProduct> findAll();

    List<WishProduct> findByUid(Long uid);

    boolean insertWishProduct(WishProduct wishProduct);

    boolean deleteWishProduct(Long uid, String pid);

    boolean deleteWishProductByWid(String wid);

    List<WishProduct> findByUid(Long uid, Integer pageNum, Integer pageSize);

    WishProduct findByUidAndPid(Long uid, String pid);

    boolean deleteWishProductByUid(Long uid);
}
