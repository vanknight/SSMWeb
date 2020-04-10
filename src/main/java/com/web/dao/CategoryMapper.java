package com.web.dao;

import com.web.bean.pojo.Category;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/11 15:26
 * @description:
 */
public interface CategoryMapper {

    List<Category> findAll();

    Category findByCid(@Param("cid") String cid);

    int updateByCid(Category category);

    int insertCategory(Category category);

    int deleteCategory(@Param("cid") String cid);

//    List<Category> findAllAdmin();

}
