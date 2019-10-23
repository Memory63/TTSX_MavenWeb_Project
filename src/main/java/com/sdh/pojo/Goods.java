package com.sdh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @ClassName Goods
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/23 11:38
 * @Version 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
    private Integer id;
    private Integer tid;
    private String goodsName;
    private String picture;
    private Date pubdate;
    private BigDecimal price;
    private Double weight;
    private String intro;
    private GoodsType goodsType;
}
