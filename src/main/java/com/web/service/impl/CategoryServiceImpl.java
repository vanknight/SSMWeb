package com.web.service.impl;

import com.web.bean.pojo.Category;
import com.web.dao.CategoryMapper;
import com.web.service.CategoryService;
import com.web.service.RedisService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/11 15:27
 * @description:
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private RedisService redisService;
    @Autowired
    private DataSourceTransactionManager transactionManager;

    private int cacheTime = 30;

    @Override
    public List<Category> findAll() {
        String key = "category_findAll";
        try {
            if (redisService.exists(key)) {
                return redisService.getListObject(key, Category.class);
            } else {
                List<Category> list = categoryMapper.findAll();
                redisService.setListObject(key, list, cacheTime);
                return list;
            }
        } catch (Exception e) {
            return categoryMapper.findAll();
        }
    }


    @Override
    public Category findByCid(String cid) {
        String key = "category_findByCid_" + cid;
        try {
            if (redisService.exists(key)) {
                return redisService.getObject(key, Category.class);
            } else {
                Category category = categoryMapper.findByCid(cid);
                redisService.setObject(key, category, cacheTime);
                return category;
            }
        } catch (Exception e) {
            return categoryMapper.findByCid(cid);
        }
    }

    @Override
    public List<Category> findAllNoRedis() {
        return categoryMapper.findAll();
    }

    @Override
    public Category findByCidNoRedis(String cid) {
        return categoryMapper.findByCid(cid);
    }

    @Override
    public boolean updateCategoryNoRedis(Category category) {
        if (findByCid(category.getCid()) == null) {
            return categoryMapper.insertCategory(category) > 0;
        }
        return categoryMapper.updateByCid(category) > 0;

    }

    @Override
    public boolean insertCategoryNoRedis(Category category) {
        return categoryMapper.insertCategory(category) > 0;
    }

    @Override
    public void updateRedis() {
        String key = "category_findAll";
        List<Category> list = findAllNoRedis();
        redisService.setListObject(key, list, cacheTime);
    }

    @Override
    public boolean deleteCategory(String cid) {

        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = transactionManager.getTransaction(def);
        try {
            categoryMapper.deleteCategory(cid);
        } catch (Exception ex) {
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);
        return true;

    }


}
