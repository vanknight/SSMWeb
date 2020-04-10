package com.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.web.bean.pojo.OrderItem;
import com.web.bean.pojo.Product;
import com.web.bean.pojo.ProductDetails;
import com.web.dao.ProductDetailsMapper;
import com.web.dao.ProductMapper;
import com.web.service.ProductService;
import com.web.service.RedisService;
import com.web.util.Constants;

import java.util.List;

import com.web.util.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/10 14:53
 * @description:
 */
@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private RedisService redisService;
    @Autowired
    private ProductDetailsMapper productDetailsMapper;
    @Autowired
    private DataSourceTransactionManager transactionManager;

    private int cacheTime = 30;

    @Override
    public Product getProductByPid(String pid) {
        return productMapper.findByPid(pid);
    }

    @Override
    public List<Product> findAll() {
        String key = "product_findAll";
        try {
            if (redisService.exists(key)) {
                return redisService.getListObject(key, Product.class);
            } else {
                List<Product> list = productMapper.findAll();
                redisService.setListObject(key, list, cacheTime);
                return list;
            }
        } catch (Exception e) {
            return productMapper.findAll();
        }
    }

    @Override
    public List<Product> findSearch(String search, int start, int size) {
        PageHelper.startPage(start, size);
        return productMapper.findSearch("%" + search + "%");
    }

    @Override
    public List<Product> findAllByAdmin() {
        return productMapper.findAllByAdmin();
    }

    @Override
    public List<Product> getNewProductList(int start, int size) {
        String key = "product_findNew_" + start + "_" + size;
        try {
            if (redisService.exists(key)) {
                return redisService.getListObject(key, Product.class);
            } else {
                List<Product> list = productMapper.findNew(start, size);
                redisService.setListObject(key, list, cacheTime);
                return list;
            }

        } catch (Exception e) {
            return productMapper.findNew(start, size);
        }
    }

    @Override
    public List<Product> getHotProductList(int start, int size) {
        String key = "product_findHot_" + start + "_" + size;
        try {
            if (redisService.exists(key)) {
                return redisService.getListObject(key, Product.class);
            } else {
                List<Product> list = productMapper.findHot(start, size);
                redisService.setListObject(key, list, cacheTime);
                return list;
            }
        } catch (Exception e) {
            return productMapper.findHot(start, size);
        }
    }

    @Override
    public List<Product> getProductByCid(String cid, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return productMapper.findByCid(cid);
    }

    @Override
    public List<Product> getProductByCid(String cid, Integer size) {
        return productMapper.findByCidLimit(cid, size);
    }

    @Override
    public boolean updateByPidNoRedis(Product product) {
        if (findByPidAdmin(product.getPid()) == null) {
            if (product.getPid() == null || product.getPid().equals("")) {
                product.setPid(RandomUtils.getUUID32());
            }
            return insertProduct(product);
        } else {
            if (product.getPid() == null || product.getPid().equals("")) {
                product.setPid(RandomUtils.getUUID32());
            }
            return productMapper.updateByPid(product) > 0;
        }
    }

    @Override
    public Product findByPid(String pid) {
        return productMapper.findByPid(pid);
    }

    @Override
    public Product findByPidAdmin(String pid) {
        return productMapper.findByPidAdmin(pid);
    }

    @Override
    public boolean insertProduct(Product product) {
        return productMapper.insertProduct(product) > 0;
    }

    @Override
    public void clearProductRedis() {
        String key = "product_findAll";
        redisService.del(key);
    }

    @Override
    public boolean deleteProductByState(String pid) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = transactionManager.getTransaction(def);
        try {
            productMapper.updateByPidToState(pid, Constants.PRO_DOWN);
        } catch (Exception ex) {
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);
        return true;

    }

    @Override
    public List<Product> findAll(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Product> list = productMapper.findAll();
        return list;
    }

    @Override
    public boolean updateProductPStock(List<OrderItem> list) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = transactionManager.getTransaction(def);
        try {

            for (int i = 0; i < list.size(); i++) {
                OrderItem orderItem = list.get(i);
                boolean mark = updateProductPStock(orderItem);
                if (!mark) {
                    transactionManager.rollback(status);
                    return false;
                }
            }

        } catch (Exception ex) {
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);
        return true;
    }

    @Override
    public boolean updateProductPStock(OrderItem orderItem) {
        Product product = productMapper.findByPid(orderItem.getPid());
        if (product == null) {
            return false;
        }
        Long stock = product.getStock() - orderItem.getCount();
        if (stock > 0) {
            product.setStock(stock);
            return productMapper.updateByPid(product) > 0;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateDetailsByPidNoRedis(ProductDetails productDetails) {
        return productDetailsMapper.updateByPid(productDetails) > 0;
    }

    @Override
    public boolean checkProductPStock(List<OrderItem> list) {
        for (int i = 0; i < list.size(); i++) {
            OrderItem orderItem = list.get(i);
            Product product = productMapper.findByPid(orderItem.getPid());
            if (product == null) {
                return false;
            }
            Long stock = product.getStock() - orderItem.getCount();
            if (stock <= 0) {
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean updateRating(String pid, Double rating) {
        return productMapper.updateByPidToRating(pid, rating) > 0;
    }

    @Override
    public List<ProductDetails> findDetailsAllByAdmin() {
        return productDetailsMapper.findAll();
    }

    @Override
    public ProductDetails findDetailsByIdAdmin(Long id) {
        return productDetailsMapper.findById(id);
    }
    @Override
    public ProductDetails findDetailsByPidAdmin(String pid) {
        return productDetailsMapper.findByPid(pid);
    }

    @Override
    public boolean deleteProductDetailsById(Long id) {
        return productDetailsMapper.deleteProductDetailsById(id) > 0;
    }

    @Override
    public boolean updateDetailsByIdNoRedis(ProductDetails productDetails) {
        ProductDetails productDetails1 = findDetailsByPidAdmin(productDetails.getPid());
        if (productDetails1 == null) {
            if (productDetails.getPid() == null || productDetails.getPid().equals("")) {
                return false;
            }
            return insertProductDetails(productDetails);
        } else {
            productDetails.setId(productDetails1.getId());
            return productDetailsMapper.updateById(productDetails) > 0;
        }
    }

    @Override
    public boolean insertProductDetails(ProductDetails productDetails) {
        return productDetailsMapper.insertProductDetails(productDetails) > 0;
    }


}
