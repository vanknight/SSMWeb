package com.web.dao;

import com.web.bean.pojo.ProductReview;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/12/19 17:07
 * @description:
 */
public interface ProductReviewMapper {

    List<ProductReview> findAll();
    List<ProductReview> findByPid(String pid);
    int insertProductReview(ProductReview review);
    int updateByPid(ProductReview review);
    int deleteProductReview(Long id);

}
