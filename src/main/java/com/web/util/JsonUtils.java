package com.web.util;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/3/28 16:21
 * @description:
 */
@Component
public class JsonUtils {

    private Logger logger = LoggerFactory.getLogger(JsonUtils.class);
    private ObjectMapper objectMapper;

    public JsonUtils() {
        objectMapper = new ObjectMapper();
        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    }

    public JsonUtils(JsonInclude.Include include) {
        objectMapper = new ObjectMapper();
        objectMapper.setSerializationInclusion(include);
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    }

    public String toJson(Object object) throws JsonProcessingException {
        if (object == null) {
            return null;
        }
        return objectMapper.writeValueAsString(object);
    }

    public <T> T fromJson(String json, Class<T> cls) throws IOException {
        if (json == null) {
            return null;
        }
        return objectMapper.readValue(json, cls);
    }

    public <T> T fromJson(String json, TypeReference valueTypeRef) throws IOException {
        if (json == null) {
            return null;
        }
        return objectMapper.readValue(json, valueTypeRef);
    }

    private JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClass) {
        return objectMapper.getTypeFactory().constructParametricType(collectionClass, elementClass);
    }

    public <T> T fromJson(String json, Class<?> tClass, Class<?>... elementClass) {
        JavaType javaType = getCollectionType(tClass, elementClass);
        try {
            return objectMapper.readValue(json, javaType);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
