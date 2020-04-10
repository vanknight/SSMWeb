package com.web.service;

import com.web.bean.pojo.Express;
import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/19 15:08
 * @description:
 */
public interface ExpressService {

    List<Express> findAll();

    Express findByEid(String eid);

    Express findByOid(String oid);

    boolean insertExpress(Express express);

    boolean updateByEid(Express express);


}
