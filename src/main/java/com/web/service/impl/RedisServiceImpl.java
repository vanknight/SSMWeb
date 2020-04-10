package com.web.service.impl;

import com.web.service.RedisService;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/4 15:53
 * @description:
 */
@Service("redisService")
public class RedisServiceImpl implements RedisService {

    private RedisService jedisClient;

    @Autowired
    public RedisServiceImpl(RedisService jedisClient) {
        this.jedisClient = jedisClient;
    }

    public RedisService getJedisClient() {
        return this.jedisClient;
    }

    @Override
    public String get(String key) {
        return jedisClient.get(key);
    }

    @Override
    public <T> Map<String, T> getMapObject(String key, Class<T> tClass) {
        return jedisClient.getMapObject(key, tClass);
    }

    @Override
    public long setMapObject(String key, Map value, int cacheSeconds) {
        return jedisClient.setMapObject(key, value, cacheSeconds);
    }

    @Override
    public <T> T getObject(String key, Class<T> tClass) {
        return jedisClient.getObject(key, tClass);
    }

    @Override
    public Set<String> getSet(String key) {
        return jedisClient.getSet(key);
    }

    @Override
    public String set(String key, String value, int cacheSeconds) {
        return jedisClient.set(key, value, cacheSeconds);
    }

    @Override
    public String setObject(String key, Object obj, int cacheSeconds) {
        return jedisClient.setObject(key, obj, cacheSeconds);
    }

    @Override
    public long setListObject(String key, List value, int cacheSeconds) {
        return jedisClient.setListObject(key, value, cacheSeconds);
    }

    @Override
    public <T> List<T> getListObject(String key, Class<T> tClass) {
        return jedisClient.getListObject(key, tClass);
    }

    @Override
    public long setSet(String key, Set<String> value, int cacheSeconds) {
        return jedisClient.setSet(key, value, cacheSeconds);
    }

    @Override
    public long del(String key) {
        return jedisClient.del(key);
    }

    @Override
    public boolean exists(String key) {
        return jedisClient.exists(key);
    }

    @Override
    public void expire(String key, int cacheSeconds) {
//        jedisClient.
        jedisClient.expire(key, cacheSeconds);
    }
}
