package com.web.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.web.bean.pojo.Category;
import com.web.service.impl.CategoryServiceImpl;
import com.web.util.JsonUtils;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/4/11 15:25
 * @description:
 */
@Controller
public class CategoryController {

    private Logger log = Logger.getLogger(getClass());
    @Autowired
    private JsonUtils jsonUtils;

    @Autowired
    private CategoryServiceImpl categoryService;

    @RequestMapping(value = "/category", method = RequestMethod.GET)
    public ResponseEntity findAll() throws JsonProcessingException {

        Map<String, Object> map = new LinkedHashMap<>(2);
        List<Category> list = categoryService.findAll();

        if (list == null || list.size() < 1) {
            map.put("status", 1);
            map.put("msg", "没有分类");
        } else {
            map.put("status", 0);
            map.put("data", list);
        }
        return new ResponseEntity<>(jsonUtils.toJson(map), HttpStatus.OK);
    }

}
