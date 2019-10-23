package com.sdh.service.impl;

import com.sdh.dao.GoodsDao;
import com.sdh.pojo.Goods;
import com.sdh.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName GoodsServiceImpl
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/23 11:50
 * @Version 1.0
 */
@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    @Override
    public List<Goods> queryGoodsByTid(Integer tid) {
        List<Goods> goods = goodsDao.queryGoodsByTid(tid);
        return goods;
    }
}
