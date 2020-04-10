package com.web.service;

import com.web.bean.temp.TokenModel;
import com.web.bean.pojo.User;
import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/16 15:33
 * @description:
 */
public interface UserService {

    public User login(String username, String password);

    public List<User> findAll();

    public User findByUid(Long uid);

    public User findByUsername(String username);

    public User findByEmail(String emil);

    public User findByUsernameAndEmail(String username, String email);

    public boolean insertUser(User user);

    public boolean updateUserByUid(User user);

    public TokenModel createToken(Long userID, boolean remember);

    public TokenModel getToken(String authentication);

    public boolean checkToken(TokenModel model);

    public void deleteToken(Long userID);

    public void deleteRegister(String code);

    public void deleteForgetPassword(String code);

    public String createRandomKey(String sessionID, int cacheTime);

    public boolean checkRandomValue(String sessionID, String randomValue);

    public void removeRandomKey(String sessionID);

    public String createRegisterCode(User user);

    public boolean checkRegisterCode(String enCode);

    public String createForgetPassWordCode(User user);

    public boolean checkForgetPassWordCode(String enCode,String password);


    boolean deleteUser(Long uid);
}
