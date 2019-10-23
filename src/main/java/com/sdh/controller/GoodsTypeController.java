package com.sdh.controller;

import com.sdh.pojo.GoodsType;
import com.sdh.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @ClassName GoodsTypeController
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/23 8:57
 * @Version 1.0
 */
@Controller
@RequestMapping("goodsType")
public class GoodsTypeController {

    @Autowired
    private GoodsTypeService goodsTypeService;

    @GetMapping("listGoodsType")
    public String ListGoodsType(Model model){
        List<GoodsType> goodsTypes = goodsTypeService.queryAllGoodsType();
        model.addAttribute("goodsTypes",goodsTypes);
        return "WEB-INF/goods_type";
    }

    @GetMapping("queryGoodsByTid")
    public String queryGoodsByTid(Model model,Integer tid, String path){
        GoodsType goodsType = goodsTypeService.queryGoodsTypeById(tid);
        model.addAttribute("goodsType",goodsType);
        return "WEB-INF/"+path;
    }
}
