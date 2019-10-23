package com.sdh.service;

import com.sdh.pojo.User;

/**
 * @ClassName UserService
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/21 19:44
 * @Version 1.0
 */
public interface UserService {
    /**
     * 添加用户
     * @param user
     */
    void insertUser(User user);

    /**
     * 根据用户名查询用户(登录)
     * @param username
     * @return
     */
    User queryUserByUsername(String username);
}
