package com.sdh.service.impl;

import com.sdh.dao.UserDao;
import com.sdh.pojo.User;
import com.sdh.service.UserService;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

/**
 * @ClassName UserServiceImpl
 * @Description TODO
 * @Author SDH
 * @CreateDate 2019/10/21 19:45
 * @Version 1.0
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public void insertUser(User user) {
        String salt = UUID.randomUUID().toString();
        user.setSalt(salt);
        user.setCreateDate(new Date());
        Sha256Hash sha256Hash = new Sha256Hash(user.getPassword(), salt, 1000);
        String password = sha256Hash.toBase64();
        user.setPassword(password);
        userDao.insertUser(user);
    }

    @Override
    public User queryUserByUsername(String username) {
        return userDao.queryUserByUsername(username);
    }
}
