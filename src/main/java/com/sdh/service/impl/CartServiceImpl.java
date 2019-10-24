package com.sdh.service.impl;

import com.sdh.dao.CartDao;
import com.sdh.dao.GoodsDao;
import com.sdh.pojo.Cart;
import com.sdh.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CartServiceImpl
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/24 10:31
 * @Version 1.0
 */
@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDao;

    @Autowired
    private GoodsDao goodsDao;

    @Override
    public void insertCart(Cart cart) {
        cartDao.insertCart(cart);
    }

    @Override
    public Cart queryCartByUidAndGid(Integer uid, Integer gid) {
        return cartDao.queryCartByUidAndGid(uid,gid);
    }

    @Override
    public void updateCart(Cart cart) {
        cartDao.updateCart(cart);
    }

    @Override
    public Integer getCountCart(Integer uid) {
        return cartDao.getCountCart(uid);
    }

    @Override
    public List<Cart> queryCartByUid(Integer uid) {
        List<Cart> cartList = cartDao.queryCartByUid(uid);
        for (Cart cart : cartList) {
            cart.setGoods(goodsDao.queryGoodsById(cart.getGid()));
        }
        return cartList;
    }
}
