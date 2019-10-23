package com.sdh.controller;

import com.sdh.pojo.GoodsType;
import com.sdh.service.GoodsService;
import com.sdh.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @GetMapping("queryGoodsByTid")
    public String queryGoodsByTid(Model model,Integer tid, String path){
        GoodsType goodsType = goodsTypeService.queryGoodsTypeById(tid);
        model.addAttribute("goodsType",goodsType);
        return "WEB-INF/"+path;
    }
}
