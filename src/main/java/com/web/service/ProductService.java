package com.web.service;

import com.web.bean.pojo.OrderItem;
import com.web.bean.pojo.Product;
import com.web.bean.pojo.ProductDetails;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/16 15:33
 * @description:
 */
public interface ProductService {

    Product getProductByPid(String pid);

    List<Product> findAll();

    List<Product> findSearch(String search, int start, int size);

    List<Product> findAllByAdmin();

    List<Product> getNewProductList(int start, int size);

    List<Product> getHotProductList(int start, int size);

    List<Product> getProductByCid(String cid, int pageNum, int pageSize);

    List<Product> getProductByCid(String cid, Integer size);

    boolean updateByPidNoRedis(Product product);

    Product findByPid(String pid);

    Product findByPidAdmin(String pid);

    boolean insertProduct(Product product);

    void clearProductRedis();

    boolean deleteProductByState(String pid);

    List<Product> findAll(int pageNum, int pageSize);

    boolean updateProductPStock(List<OrderItem> list);

    boolean updateProductPStock(OrderItem orderItem);

    boolean updateDetailsByPidNoRedis(ProductDetails productDetails);

    boolean checkProductPStock(List<OrderItem> list);

    boolean updateRating(String pid, Double rating);

    List<ProductDetails> findDetailsAllByAdmin();

    ProductDetails findDetailsByIdAdmin(Long id);

    ProductDetails findDetailsByPidAdmin(String id);

    boolean deleteProductDetailsById(Long id);

    boolean updateDetailsByIdNoRedis(ProductDetails productDetails);

    boolean insertProductDetails(ProductDetails productDetails);
}
