package com.web.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.web.util.JsonUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/16 15:33
 * @description:
 */
public interface RedisService {

    public String get(String key);

    public <T> Map<String, T> getMapObject(String key, Class<T> tClass);

    public long setMapObject(String key, Map value, int cacheSeconds);

    public <T> T getObject(String key, Class<T> tClass);

    public Set<String> getSet(String key);

    public String set(String key, String value, int cacheSeconds);

    public String setObject(String key, Object obj, int cacheSeconds);

    public long setListObject(String key, List value, int cacheSeconds);

    public <T> List<T> getListObject(String key, Class<T> tClass);

    public long setSet(String key, Set<String> value, int cacheSeconds);

    public long del(String key);

    public boolean exists(String key);

    public void expire(String key, int cacheSeconds);

}
