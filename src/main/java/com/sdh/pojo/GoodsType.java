package com.sdh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @ClassName GoodsType
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/22 22:41
 * @Version 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsType {
    private Integer id;
    private String typeName;
    private String typeClass;
    private Date createDate;
    private String goodsPath;
    private String typeImg;
    private List<Goods> goodsList;
}
