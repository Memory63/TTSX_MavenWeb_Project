package com.sdh.service;

import com.sdh.pojo.GoodsType;

import java.util.List;

/**
 * @ClassName GoodsTypeService
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/23 8:46
 * @Version 1.0
 */
public interface GoodsTypeService {
    /**
     * 获取所有商品类型
     * @return
     */
    List<GoodsType> queryAllGoodsType();
}
