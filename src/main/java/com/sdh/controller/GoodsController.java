package com.sdh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sdh.pojo.Goods;
import com.sdh.pojo.GoodsType;
import com.sdh.service.GoodsService;
import com.sdh.service.GoodsTypeService;
import com.sdh.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @ClassName GoodsController
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/23 11:52
 * @Version 1.0
 */
@Controller
@RequestMapping("goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GoodsTypeService goodsTypeService;

    /**
     * todo: 根据商品id查询该商品详情,并根据商品类型id获取该类型详情
     * @param id
     * @param tid
     * @param model
     * @return
     */
    @GetMapping("queryDetail")
    public String queryGoods(Integer id,Integer tid, Model model){
        Goods goods = goodsService.queryGoodsById(id);
        GoodsType goodsType = goodsTypeService.queryGoodsTypeById(tid);
        model.addAttribute("goods",goods);
        model.addAttribute("goodsType",goodsType);
        return "WEB-INF/detail";
    }

    /**
     * todo: 根据商品类型id获取该类中所有的商品
     * @param tid
     * @param model
     * @return
     */
    @GetMapping("queryAllGoods")
    public String queryAllGoods(Integer tid,Model model,Integer pageNum,Integer pageSize,String rank){
        if(pageNum==null||pageSize==null){
            pageNum = 0;
            pageSize = 10;
        }
        if(StringUtils.isEmpty(rank)){
            rank = null;
        }
        GoodsType goodsType = goodsTypeService.queryGoodsTypeById(tid);
        PageHelper.startPage(pageNum,pageSize);
        List<Goods> goods = goodsService.queryGoodsByTid(tid,rank);
        PageInfo<Goods> pageInfo =new PageInfo<Goods>(goods);
        model.addAttribute("goodsTypeName",goodsType.getTypeName());
        model.addAttribute("tid",goodsType.getId());
        model.addAttribute("rank",rank);
        model.addAttribute("goodsAll",pageInfo);
        return "WEB-INF/list";
    }

}
