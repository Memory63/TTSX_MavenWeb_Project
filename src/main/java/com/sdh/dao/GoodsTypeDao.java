package com.sdh.dao;

import com.sdh.pojo.GoodsType;

import java.util.List;

/**
 * @ClassName GoodsTypeDao
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/22 22:47
 * @Version 1.0
 */
public interface GoodsTypeDao {
    /**
     * todo: 获取所有的商品类型
     * @return
     */
    List<GoodsType> queryAllGoodsType();

}
