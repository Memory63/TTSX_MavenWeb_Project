package com.sdh.dao;

import com.sdh.pojo.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName CartDao
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/24 10:28
 * @Version 1.0
 */
public interface CartDao {
    /**
     * todo: 添加商品
     * @param cart
     */
    void insertCart(Cart cart);

    /**
     * todo: 查询该用户是否添加过该商品
     * @param uid
     * @param gid
     * @return
     */
    Cart queryCartByUidAndGid(@Param("uid") Integer uid,@Param("gid") Integer gid);

    /**
     * todo: 如果该用户添加过该商品，那么修改该商品的数量
     * @param cart
     */
    void updateCart(Cart cart);

    /**
     * todo: 获取该用户购物车中商品的总数量
     * @param uid
     * @return
     */
    Integer getCountCart(@Param("uid") Integer uid);

    /**
     * todo: 获取该用户购物车中所有的商品
     * @param uid
     * @return
     */
    List<Cart> queryCartByUid(@Param("uid") Integer uid);
}
