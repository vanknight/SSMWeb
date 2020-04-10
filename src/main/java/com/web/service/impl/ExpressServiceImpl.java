package com.web.service.impl;

import com.web.bean.pojo.Express;
import com.web.dao.ExpressMapper;
import com.web.service.ExpressService;
import com.web.util.RandomUtils;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/19 15:15
 * @description:
 */
@Service("expressService")
public class ExpressServiceImpl implements ExpressService {

    @Autowired
    private ExpressMapper expressMapper;

    @Override
    public List<Express> findAll() {
        return expressMapper.findAll();
    }

    @Override
    public Express findByEid(String eid) {
        return expressMapper.findByEid(eid);
    }

    @Override
    public Express findByOid(String oid) {
        return expressMapper.findByOid(oid);
    }

    @Override
    public boolean insertExpress(Express express) {
        return expressMapper.insertExpress(express) > 0;
    }

    @Override
    public boolean updateByEid(Express express) {
        if (express == null) {
            return false;
        }
        if (findByOid(express.getOid()) == null) {
            express.setEid(RandomUtils.getUUID32());
            return expressMapper.insertExpress(express) > 0;
        } else {
            return expressMapper.updateByEid(express) > 0;
        }

    }


}
