package com.web.dao;

import com.web.bean.pojo.User;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/10 14:22
 * @description:
 */
public interface UserMapper {

    List<User> findAll();

    User login(@Param("username") String username, @Param("password") String password);

    User findByUsername(@Param("username") String username);

    User findByEmail(@Param("email") String email);

    User findByUsernameAndEmail(@Param("username") String username,@Param("email") String email);

    User findByUid(@Param("uid") Long uid);

    int insertUser(User user);

    int updateByUid(User user);

    int deleteUser(@Param("uid") Long uid);
}
