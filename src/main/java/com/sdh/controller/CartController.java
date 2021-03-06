package com.sdh.controller;

import com.sdh.pojo.Cart;
import com.sdh.pojo.User;
import com.sdh.service.CartService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

/**
 * @ClassName CartController
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/24 10:32
 * @Version 1.0
 */
@Controller
@RequestMapping("cart")
public class CartController {

    @Autowired
    private CartService cartService;

    /**
     * todo: 添加购物车
     * @param cart
     * @return
     */
    @RequestMapping("insert")
    @RequiresAuthentication
    @ResponseBody
    public String insertCart(Cart cart, HttpSession session){
        User user = (User) session.getAttribute("user");
        //查看购物车中该用户是否添加过该商品，添加过进行累加，否则重新添加
        System.out.println(user);
        cart.setUid(user.getUid());
        Cart cart1 = cartService.queryCartByUidAndGid(cart.getUid(),cart.getGid());
        if(cart1==null){
            //如果没有查到说明该用户没有添加过该商品，直接进行添加
            cart.setMoney(cart.getMoney().multiply(new BigDecimal(cart.getNum())));
            System.out.println("添加购物车:"+cart);
            cartService.insertCart(cart);
        }else{
            //如果查到说明该用户在购物车中添加过该商品，修改商品数量和商品的总价钱
            Integer num = cart1.getNum()+cart.getNum();
            System.out.println(cart.getMoney().multiply(new BigDecimal(num)));
            cart1.setNum(num);
            cart1.setMoney(cart.getMoney().multiply(new BigDecimal(num)));
            cartService.updateCart(cart1);
        }
        return "1";
    }

    /**
     * todo: 获取该用户购物车中添加的商品数量
     * @param session
     * @return
     */
    @PostMapping("showCount")
    @ResponseBody
    public Integer showCartCount(HttpSession session){
        User user = (User) session.getAttribute("user");
        Integer num=0;
        if(user!=null){
            num = cartService.getCountCart(user.getUid());
        }
        return num;
    }

    /**
     * todo: 获取该用户购物车中的上品
     * @param uid
     * @param model
     * @return
     */
    @RequestMapping("query")
    public String queryCart(Integer uid, Model model){
        if(uid==null){
            return "redirect:/user/login";
        }
        List<Cart> cartList = cartService.queryCartByUid(uid);
        BigDecimal money= new BigDecimal(0);
        for (Cart cart : cartList) {
            money = money.add(cart.getMoney());
        }
        model.addAttribute("price",money);
        model.addAttribute("cartList",cartList);
        return "/WEB-INF/cart";
    }

    /**
     * todo: 根据ID删除购物车中的商品
     * @param gid
     * @return
     */
    @GetMapping("deleteCart")
    @RequiresAuthentication
    @ResponseBody
    public String deleteCart(Model model,Integer gid,HttpSession session){
        User user = (User) session.getAttribute("user");
        System.out.println("删除成功");
        cartService.deleteCart(gid);
        return "1";
    }

    /**
     * todo: 修改购物车中的商品数量
     * @param uid
     * @param gid
     * @param sign
     * @return
     */
    @RequestMapping("updateCart")
    public List<Cart> updateCart(Integer uid, Integer gid, String sign,Model model){
        System.out.println(uid+" "+gid);
        System.out.println(sign);
        Cart cart = cartService.queryCartByUidAndGid(uid, gid);
        BigDecimal money = cart.getMoney().divide(new BigDecimal(cart.getNum()));
        if("add".equals(sign)){
            cart.setNum(cart.getNum()+1);
        }else{
            cart.setNum(cart.getNum()-1);
        }
        cart.setMoney(money.multiply(new BigDecimal(cart.getNum())));
        cartService.updateCart(cart);
        List<Cart> cartList = cartService.queryCartByUid(uid);
        model.addAttribute("cartList",cartList);
        return cartList;
    }
}
