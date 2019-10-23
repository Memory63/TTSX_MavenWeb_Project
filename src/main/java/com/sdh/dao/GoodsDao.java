package com.sdh.dao;

import com.sdh.pojo.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName Goods
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/23 11:42
 * @Version 1.0
 */
public interface GoodsDao {
    /**
     * todo: 根据商品类型id获取某类型的所有商品
     * @param tid
     * @return
     */
    List<Goods> queryGoodsByTid(@Param("tid") Integer tid);
}
