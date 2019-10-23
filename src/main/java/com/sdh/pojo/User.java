package com.sdh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @ClassName User
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/21 18:57
 * @Version 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer uid;
    private String username;
    private String password;
    private String repassword;
    private String email;
    private String salt;
    private Date createDate;
}
