package com.web.redis;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.web.service.RedisService;
import com.web.util.JsonUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisException;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/3 16:36
 * @description:
 */
@Service("jedisClient")
public class JedisClient implements RedisService {

    @Autowired
    public JsonUtils jsonUtils;

    private static Logger logger = LoggerFactory.getLogger(JedisClient.class);

    @Autowired
    public JedisClient(JedisPool jedisPool) {
        this.jedisPool = jedisPool;
    }

    //private String password;
    //public String getPassword() {
    //    return password;
    //}
    //@Value("${redis.pass}")
    //public void setPassword(String password) {
    //    this.password = password;
    //}

    private JedisPool jedisPool;

    public Jedis getResource() {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            //jedis.auth(password);

        } catch (JedisException e) {
            logger.warn("getResource.", e);
            returnBrokenResource(jedis);
            throw e;
        }
        return jedis;
    }

    public void returnBrokenResource(Jedis jedis) {
//        if (jedis != null) {
//            jedisPool.returnBrokenResource(jedis);
//        }
        returnResource(jedis);
    }

    public void returnResource(Jedis jedis) {
        if (jedis != null) {
            jedis.close();
//            jedisPool.returnResource(jedis);
        }
    }

    @Override
    public String get(String key) {
        String value = null;
        Jedis jedis = null;

        jedis = getResource();
        if (jedis.exists(key)) {
            value = jedis.get(key);
        }
//        logger.debug("get {} = {}", key, value);
        returnBrokenResource(jedis);

        return value;
    }

    @Override
    public <T> Map<String, T> getMapObject(String key, Class<T> tClass) {
        try {
            if (exists(key)) {
                String jsonList = get(key);
                Map<String, String> stringMap = jsonUtils
                    .fromJson(jsonList, new TypeReference<Map<String, String>>() {
                    });
                Set<String> keySet = stringMap.keySet();
                Map<String, T> map = new HashMap<>();

                for (String s : keySet) {
                    map.put(s, jsonUtils.fromJson(stringMap.get(s), tClass));
                }
                return map;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public long setMapObject(String key, Map value, int cacheSeconds) {
        try {
            Map<String, String> map = new HashMap<>();
            Set<String> keySet = value.keySet();

            for (String o : keySet) {
                map.put(o, jsonUtils.toJson(value.get(o)));
            }

            return set(key, jsonUtils.toJson(map), cacheSeconds).equals("OK") ? value.size() : 0;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public <T> T getObject(String key, Class<T> tClass) {
        if (exists(key)) {
            String json = get(key);
            try {
                return jsonUtils.fromJson(json, tClass);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public Set<String> getSet(String key) {
        Set<String> value = null;
        Jedis jedis = null;
        try {
            jedis = getResource();
            if (jedis.exists(key)) {
                value = jedis.smembers(key);
                logger.debug("getMap {} = {}", key, value);
            }
        } catch (Exception e) {
            logger.warn("getMap {} = {}", key, value, e);
        } finally {
            returnResource(jedis);
        }
        return value;
    }

    @Override
    public String set(String key, String value, int cacheSeconds) {
        String result = null;
        Jedis jedis = null;
        try {
            jedis = getResource();
            result = jedis.set(key, value);
            if (cacheSeconds != 0) {
                jedis.expire(key, cacheSeconds);
            }
            logger.debug("set {} = {}", key, value);
        } catch (Exception e) {
            logger.warn("set {} = {}", key, value, e);
        } finally {
            returnResource(jedis);
        }
        return result;
    }

    @Override
    public String setObject(String key, Object obj, int cacheSeconds) {
        String result = null;
        Jedis jedis = null;
        String value = "";
        try {
            jedis = getResource();
            value = jsonUtils.toJson(obj);
            result = jedis.set(key, value);
            if (cacheSeconds != 0) {
                jedis.expire(key, cacheSeconds);
            }
            logger.debug("set {} = {}", key, value);
        } catch (Exception e) {
            logger.warn("set {} = {}", key, value, e);
        } finally {
            returnResource(jedis);
        }
        return result;
    }

    @Override
    public long setListObject(String key, List value, int cacheSeconds) {
        try {
            List<String> list = new ArrayList<>();
            for (Object o : value) {
                list.add(jsonUtils.toJson(o));
            }

            String json = jsonUtils.toJson(list);

            return set(key, jsonUtils.toJson(list), cacheSeconds).equals("OK") ? value.size() : 0;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public <T> List<T> getListObject(String key, Class<T> tClass) {
        try {
            if (exists(key)) {
                String jsonList = get(key);

                List<String> list = jsonUtils.fromJson(jsonList, new TypeReference<List<String>>() {
                });

                List<T> objList = new ArrayList<>();
                for (String s : list) {
                    objList.add(jsonUtils.fromJson(s, tClass));
                }
                return objList;
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public long setSet(String key, Set<String> value, int cacheSeconds) {
        long result = 0;
        Jedis jedis = null;
        try {
            jedis = getResource();
            if (jedis.exists(key)) {
                jedis.del(key);
            }

            result = jedis.sadd(key, value.toArray(new String[value.size()]));

            if (cacheSeconds != 0) {
                jedis.expire(key, cacheSeconds);
            }
            logger.debug("setSet {} = {}", key, value);
        } catch (Exception e) {
            logger.warn("setSet {} = {}", key, value, e);
        } finally {
            returnResource(jedis);
        }
        return result;
    }

    @Override
    public long del(String key) {
        long result = 0;
        Jedis jedis = null;
        try {
            jedis = getResource();
            if (jedis.exists(key)) {
                result = jedis.del(key);
                logger.debug("del {}", key);
            } else {
                logger.debug("del {} not exists", key);
            }
        } catch (Exception e) {
            logger.warn("del {}", key, e);
        } finally {
            returnResource(jedis);
        }
        return result;
    }

    @Override
    public boolean exists(String key) {
        boolean result = false;
        Jedis jedis = null;
        try {
            jedis = getResource();
            result = jedis.exists(key);
//            logger.debug("exists {}", key);
        } catch (Exception e) {
            logger.warn("exists {}", key, e);
        } finally {
            returnResource(jedis);
        }
        return result;
    }

    @Override
    public void expire(String key, int cacheSeconds) {
        Jedis jedis = null;
        jedis = getResource();
        if (jedis.exists(key)) {
            jedis.expire(key, cacheSeconds);
            logger.debug("expire {} = {}", key, cacheSeconds);
        }
        returnBrokenResource(jedis);

    }


}
