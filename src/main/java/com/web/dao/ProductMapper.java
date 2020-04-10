package com.web.dao;

import com.web.bean.pojo.Product;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/10 14:47
 * @description:
 */
public interface ProductMapper {

    List<Product> findAll();

    List<Product> findAllByAdmin();

    List<Product> findNew(@Param("start") int start, @Param("size") int size);

    List<Product> findHot(@Param("start") int start, @Param("size") int size);

    List<Product> findByCid(@Param("cid") String cid);

    List<Product> findByCidAdmin(@Param("cid") String cid);

    List<Product> findByCidLimit(@Param("cid") String cid, @Param("size") Integer size);

    Product findByPid(@Param("pid") String pid);

    Product findByPidAdmin(@Param("pid") String pid);
    Product findByPidAdminNoObj(@Param("pid") String pid);

    int insertProduct(Product product);

    int updateByPid(Product product);

    int deleteProduct(@Param("pid") String pid);

    int updateByPidToState(@Param("pid") String pid, @Param("state") int state);

    List<Product> findSearch(@Param("search")String search);

    int updateByPidToRating(@Param("pid")String pid, @Param("rating")Double rating);


}
