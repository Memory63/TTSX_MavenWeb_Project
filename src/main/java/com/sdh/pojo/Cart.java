package com.sdh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @ClassName Cart
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/24 10:26
 * @Version 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private Integer uid;
    private Integer gid;
    private Integer num;
    private BigDecimal money;
    private Goods goods;
}
