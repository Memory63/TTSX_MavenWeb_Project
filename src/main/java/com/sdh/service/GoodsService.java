package com.sdh.service;

import com.sdh.pojo.Goods;

import java.util.List;

/**
 * @ClassName GoodsService
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/23 11:49
 * @Version 1.0
 */
public interface GoodsService  {

    List<Goods> queryGoodsByTid(Integer tid,String rank);

    Goods queryGoodsById(Integer id);

}
