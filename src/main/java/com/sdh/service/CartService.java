package com.sdh.service;

import com.sdh.pojo.Cart;

import java.util.List;

/**
 * @ClassName CartService
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/24 10:31
 * @Version 1.0
 */
public interface CartService {

    void insertCart(Cart cart);

    Cart queryCartByUidAndGid(Integer uid, Integer gid);

    void updateCart(Cart cart);

    Integer getCountCart(Integer uid);

    List<Cart> queryCartByUid(Integer uid);

    void deleteCart(Integer gid);
}
