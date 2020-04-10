package com.web.dao;

import com.web.bean.pojo.ProductDetails;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/12/20 12:37
 * @description:
 */
public interface ProductDetailsMapper {

    List<ProductDetails> findAll();

    ProductDetails findByPid(@Param("pid") String pid);

    int updateByPid(ProductDetails productDetails);

    int insertProductDetails(ProductDetails productDetails);

    int deleteProductDetailsByPid(@Param("pid") String pid);

    ProductDetails findById(Long id);

    int updateById(ProductDetails productDetails);

    int deleteProductDetailsById(Long id);

}
