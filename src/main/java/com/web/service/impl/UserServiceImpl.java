package com.web.service.impl;

import com.web.bean.temp.TokenModel;
import com.web.bean.pojo.User;
import com.web.dao.UserMapper;
import com.web.service.CartItemService;
import com.web.service.OrdersService;
import com.web.service.RedisService;
import com.web.service.UserService;
import com.web.service.WishProductService;
import com.web.util.Constants;
import com.web.util.Md5Utils;
import java.util.List;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
 * @date-Time: 2018/4/10 14:27
 * @description:
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    private Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
    private Integer userTime = 1000*60*60;

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CartItemService cartItemService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private WishProductService wishProductService;
    @Autowired
    private DataSourceTransactionManager transactionManager;

    @Override
    public User findByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userMapper.findByEmail(email);
    }

    @Override
    public User findByUsernameAndEmail(String username, String email) {
        return userMapper.findByUsernameAndEmail(username,email);
    }

    @Override
    public User login(String username, String password) {
        return userMapper.login(username, password);
    }

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    @Override
    public User findByUid(Long uid) {
//        String key = Constants.REDIS_USER_PREFIX + "_" + uid;
//        try {
//            if (redisService.exists(key)) {
//                return redisService.getObject(key, User.class);
//            } else {
//                User user = userMapper.findByUidAndPid(uid);
//                redisService.setObject(key, user, userTime);
//                return user;
//            }
//        }catch (Exception e){
//            log.debug(e.getMessage());
//            return userMapper.findByUidAndPid(uid);
//        }
        return userMapper.findByUid(uid);
    }

    @Override
    public boolean insertUser(User user) {
        if (userMapper.findByUsername(user.getUsername()) != null) {
            return false;
        } else if (userMapper.findByUid(user.getUid()) != null) {
            return false;
        }
        return userMapper.insertUser(user) > 0;
    }

    @Override
    public boolean updateUserByUid(User user) {
        if (findByUid(user.getUid()) == null) {
            return userMapper.insertUser(user) > 0;
        }
        return userMapper.updateByUid(user) > 0;
    }

    /**
     * 用userID创造一个TokenModel，并且存入缓存
     *
     * @return TokenModel
     */
    @Override
    public TokenModel createToken(Long userID, boolean remember) {

        String token = UUID.randomUUID().toString()
            .replace("-", "").toUpperCase();
        String key = Constants.REDIS_TOKEN_PREFIX + "_" + userID;
        TokenModel tokenModel = new TokenModel(String.valueOf(userID), token, remember);
        if (remember) {
            redisService.setObject(key, tokenModel, Constants.REMEMBER_TIME);
        } else {
            redisService.setObject(key, tokenModel, Constants.UN_REMEMBER_TIME);
        }
        return tokenModel;
    }

    /**
     * 获得的字符串解析为token和userID
     *
     * @return tokenModel
     */
    @Override
    public TokenModel getToken(String authentication) {
        int i = 2;
        if (authentication == null || authentication.length() == 0) {
            return null;
        }

        String[] param = authentication.split("_");
        if (param.length != i) {
            return null;
        }
        String userID = param[0];
        String token = param[1];

        return new TokenModel(userID, token, false);
    }

    /**
     * model里的token与缓存中的token比对
     *
     * @return 是否正确
     */
    @Override
    public boolean checkToken(TokenModel model) {
        if (model == null) {
            return false;
        }
        String key = Constants.REDIS_TOKEN_PREFIX + "_" + model.getUserId();
        try {
            TokenModel tokenModel = redisService.getObject(key, TokenModel.class);

            if (tokenModel == null || !tokenModel.getToken().equals(model.getToken())) {
                return false;
            }
            if (tokenModel.isRemember()) {
                redisService.expire(key, Constants.REMEMBER_TIME);
            } else {
                redisService.expire(key, Constants.UN_REMEMBER_TIME);
            }

        } catch (Exception e) {
            redisService.del(key);
            return false;
        }
        return true;
    }

    /**
     * 根据userID删除缓存里面的Token 有关退出登陆
     */
    @Override
    public void deleteToken(Long userID) {
        String key = Constants.REDIS_TOKEN_PREFIX + "_" + userID;
        redisService.del(key);
    }

    @Override
    public void deleteRegister(String code) {
        String key = Constants.REGISTER_CODE_PREFIX + "_" + code;
        redisService.del(key);
    }

    @Override
    public void deleteForgetPassword(String code) {
        String key = Constants.FORGETPASSWORD_CODE_PREFIX + "_" + code;
        redisService.del(key);
    }
    /**
     * 根据sessionID存入randomValue
     *
     * @return randomValue
     */
    @Override
    public String createRandomKey(String sessionID, int cacheTime) {
        String randomKey = Constants.RANDOM_PREFIX + "_" + sessionID;

        log.debug("存入的sessionID : " + sessionID);
        String randomValue = UUID.randomUUID().toString()
            .replace("-", "").toUpperCase();
        log.debug("存入 randomKey : " + randomKey);
        redisService.set(randomKey, randomValue, cacheTime);
        return randomValue;
    }

    /**
     * 根据sessionID和randomValue与缓存对比，且延长存在时间
     *
     * @return 成功与否
     */
    @Override
    public boolean checkRandomValue(String sessionID, String randomValue) {
        String randomKey = Constants.RANDOM_PREFIX + "_" + sessionID;

        redisService.expire(randomKey, 60 * 5);
        log.debug("randomKey时间延长");
        return (redisService.exists(randomKey) &&
            redisService.get(randomKey).equals(randomValue));
    }

    /**
     * 根据sessionID删除缓存里的randomKey
     */
    @Override
    public void removeRandomKey(String sessionID) {
        String randomKey = Constants.RANDOM_PREFIX + "_" + sessionID;

        if (redisService.exists(randomKey)) {
            redisService.del(randomKey);
        }
    }

    /**
     * 通过user生成密钥key
     *
     * @return 加密后的registerCode
     */
    @Override
    public String createRegisterCode(User user) {

        user.setCode(UUID.randomUUID().toString().replace("-", ""));
        StringBuilder sb = new StringBuilder();
        user.setState(0);
        boolean mark = insertUser(user);
        if(mark) {
            sb.append(Constants.REGISTER_CODE_PREFIX);
            sb.append("_");
            sb.append(user.getCode());
            redisService.set(sb.toString(), user.getUsername(), userTime);
            return user.getCode();
        }else{
            return null;
        }
    }

    /**
     * 加密后的enCode解密解析后的code和username与解析出来的username查询出来的code比对 注册相关
     *
     * @return 正确与否
     */
    @Override
    public boolean checkRegisterCode(String enCode) {
        if (enCode == null || enCode.length() < 1) {
            return false;
        }
        String code = Constants.REGISTER_CODE_PREFIX + "_" + enCode;

        String username_ = redisService.get(code);
        User user = findByUsername(username_);

        if (user != null && user.getCode().equals(enCode)) {

            user.setCode("");
            user.setState(1);
            String pwd = user.getPassword();
            user.setPassword(Md5Utils.MD5(pwd));
            deleteRegister(enCode);
            return userMapper.updateByUid(user) > 0;
        }
        return false;
    }

    @Override
    public String createForgetPassWordCode(User user) {
        user.setCode(UUID.randomUUID().toString().replace("-", ""));
        StringBuilder sb = new StringBuilder();
        boolean mark = updateUserByUid(user);
        if(mark) {
            sb.append(Constants.FORGETPASSWORD_CODE_PREFIX);
            sb.append("_");
            sb.append(user.getCode());

            redisService.set(sb.toString(), user.getUsername(), userTime);
            return user.getCode();
        }else{
            return null;
        }
    }

    @Override
    public boolean checkForgetPassWordCode(String enCode,String password) {
        if (enCode == null || enCode.length() < 1) {
            return false;
        }
        String code = Constants.FORGETPASSWORD_CODE_PREFIX + "_" + enCode;

        String username_ = redisService.get(code);
        User user = findByUsername(username_);

        if (user != null && user.getCode().equals(enCode)) {

            user.setCode("");
            user.setPassword(Md5Utils.MD5(password));
            deleteForgetPassword(enCode);
            boolean mark = userMapper.updateByUid(user) > 0;
            if(mark){
                deleteToken(user.getUid());
            }
            return mark;
        }
        return false;
    }

    @Override
    public boolean deleteUser(Long uid) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = transactionManager.getTransaction(def);
        try {
            cartItemService.deleteCartItem(uid);
            ordersService.deleteByUid(uid);
            wishProductService.deleteWishProductByUid(uid);
            userMapper.deleteUser(uid);

        } catch (Exception ex) {
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);
        return true;

    }
}
