package com.web.service;

import com.web.bean.pojo.Category;
import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/16 15:33
 * @description:
 */
public interface CategoryService {

    public List<Category> findAll();

    public Category findByCid(String cid);

    public List<Category> findAllNoRedis();

    public Category findByCidNoRedis(String cid);

    public boolean updateCategoryNoRedis(Category category);

    public boolean insertCategoryNoRedis(Category category);

    public void updateRedis();

    public boolean deleteCategory(String cid);

}
