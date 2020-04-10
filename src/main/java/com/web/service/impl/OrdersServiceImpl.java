package com.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.web.bean.pojo.Express;
import com.web.bean.pojo.Orders;
import com.web.dao.ExpressMapper;
import com.web.dao.OrderItemMapper;
import com.web.dao.OrdersMapper;
import com.web.service.OrdersService;
import com.web.util.RandomUtils;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/6 13:07
 * @description:
 */
@Service("orderService")
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersMapper ordersMapper;

    @Autowired
    private OrderItemMapper orderItemMapper;

    @Autowired
    private ExpressMapper expressMapper;
    @Autowired
    private DataSourceTransactionManager transactionManager;

    @Override
    public Orders findByOid(String oid) {
        return ordersMapper.findByOid(oid);
    }

    @Override
    public List<Orders> findAll() {
        return ordersMapper.findAll();
    }

    @Override
    public boolean insertOrders(Orders orders) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = transactionManager.getTransaction(def);
        try {
            ordersMapper.insertOrders(orders);
            orderItemMapper.insertOrderItems(orders.getList());
            Express express = new Express();
            express.setOid(orders.getOid());
            express.setEid(RandomUtils.getUUID32());
            expressMapper.insertExpress(express);

        } catch (Exception ex) {
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);
        return true;
    }

    @Override
    public boolean deleteByOid(String oid) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = transactionManager.getTransaction(def);
        try {
            orderItemMapper.deleteByOid(oid);
            expressMapper.deleteByOid(oid);
            ordersMapper.deleteByOid(oid);

        } catch (Exception ex) {
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);
        return true;
    }

    @Override
    public boolean updateByOid(Orders orders) {
        return ordersMapper.updateByOid(orders) > 0;
    }

    @Override
    public List<Orders> findByUid(Long uid) {
        return ordersMapper.findByUid(uid);
    }

    @Override
    public List<Orders> findByUid(Long uid, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return ordersMapper.findByUid(uid);
    }

    @Override
    public boolean deleteByUid(Long uid) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = transactionManager.getTransaction(def);
        try {
            List<Orders> list = findByUid(uid);
            for (Orders orders : list) {
                deleteByOid(orders.getOid());
            }
        } catch (Exception ex) {
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);
        return true;
    }

}
