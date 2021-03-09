package com.zhang.service;

import com.zhang.entity.User;
import com.zhang.util.Page;

import java.util.List;

public interface UserService {
    //用户登录
    public User loginUser(String loginName,String password);
    //用户注册
    public int register(User user);
    //获取用户列表(带分页)
    public Page queryPageUsers(Integer currentPage);
    //添加用户
    public Integer addUser(User user);
    //通过uid查询用户
    public List<User> queryUserById(Integer uid);
}
