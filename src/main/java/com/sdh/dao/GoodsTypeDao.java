package com.sdh.dao;

import com.sdh.pojo.GoodsType;
import org.apache.ibatis.annotations.Param;

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

    /**
     * todo: 根据id获取商品类型
     * @param id
     * @return
     */
    GoodsType queryGoodsTypeById(@Param("id") Integer id);

}
