package com.zhang.service.impl;

import com.zhang.dao.UserMapper;
import com.zhang.entity.User;
import com.zhang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    //用户登录
    @Override
    public User loginUser(String loginName, String password) {
        User user = userMapper.loginUser(loginName, password);
        return user;
    }

    //用户注册
    @Override
    public int register(User user) {
        int i = userMapper.register(user);
        return i;
    }


}
