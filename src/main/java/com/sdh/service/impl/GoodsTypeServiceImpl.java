package com.sdh.service.impl;

import com.sdh.dao.GoodsDao;
import com.sdh.dao.GoodsTypeDao;
import com.sdh.pojo.Goods;
import com.sdh.pojo.GoodsType;
import com.sdh.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName GoodsTypeServiceImpl
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/23 8:56
 * @Version 1.0
 */
@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {

    @Autowired
    private GoodsTypeDao goodsTypeDao;
    @Autowired
    private GoodsDao goodsDao;

    @Override
    public List<GoodsType> queryAllGoodsType() {
        return goodsTypeDao.queryAllGoodsType();
    }

    @Override
    public GoodsType queryGoodsTypeById(Integer id) {
        GoodsType goodsType = goodsTypeDao.queryGoodsTypeById(id);
        List<Goods> goods = goodsDao.queryGoodsByTid(id,null);
        goodsType.setGoodsList(goods);
        return goodsType;
    }
}
