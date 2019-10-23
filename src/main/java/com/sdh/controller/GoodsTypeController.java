package com.sdh.controller;

import com.sdh.pojo.GoodsType;
import com.sdh.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @ResponseBody
    public List<GoodsType> ListGoodsType(){
        List<GoodsType> goodsTypes = goodsTypeService.queryAllGoodsType();
        return goodsTypes;
    }
}
