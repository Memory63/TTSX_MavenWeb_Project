package com.sdh.dao;

import com.sdh.pojo.User;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName UserDao
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/21 19:05
 * @Version 1.0
 */
public interface UserDao {
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
    User queryUserByUsername(@Param("username") String username);
}
