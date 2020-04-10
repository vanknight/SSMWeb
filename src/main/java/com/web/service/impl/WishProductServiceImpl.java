package com.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.web.bean.pojo.WishProduct;
import com.web.dao.WishProductMapper;
import com.web.service.WishProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/19 16:25
 * @description:
 */
@Service("wishProductService")
public class WishProductServiceImpl implements WishProductService {

    @Autowired
    private WishProductMapper wishProductMapper;

    @Override
    public List<WishProduct> findAll() {
        return wishProductMapper.findAll();
    }

    @Override
    public List<WishProduct> findByUid(Long uid) {
        return wishProductMapper.findByUid(uid);
    }

    @Override
    public boolean insertWishProduct(WishProduct wishProduct) {
        return wishProductMapper.insertWishProduct(wishProduct) > 0;
    }

    @Override
    public boolean deleteWishProduct(Long uid, String pid) {
        return wishProductMapper.deleteWishProduct(uid, pid) > 0;
    }

    @Override
    public boolean deleteWishProductByWid(String wid) {
        return wishProductMapper.deleteWishProductByWid(wid) > 0;
    }

    @Override
    public List<WishProduct> findByUid(Long uid, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);

        return wishProductMapper.findByUid(uid);
    }

    @Override
    public WishProduct findByUidAndPid(Long uid, String pid) {
        return wishProductMapper.findByUidAndPid(uid, pid);
    }

    @Override
    public boolean deleteWishProductByUid(Long uid) {
        return wishProductMapper.deleteWishProductByUid(uid) > 0;
    }
}
