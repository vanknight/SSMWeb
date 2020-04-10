package com.web.dao;

import com.web.bean.pojo.Express;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/19 14:59
 * @description:
 */
public interface ExpressMapper {

    List<Express> findAll();

    Express findByEid(@Param("eid") String eid);

    int insertExpress(Express express);

    int updateByEid(Express express);

    Express findByOid(@Param("oid") String oid);

    int deleteByOid(@Param("oid") String oid);
}
