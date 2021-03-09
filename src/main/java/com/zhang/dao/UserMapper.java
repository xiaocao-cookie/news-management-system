package com.zhang.dao;

import com.zhang.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    //用户登录
    public User loginUser(@Param("loginName") String loginName,
                         @Param("password") String password);
    //注册用户
    public int register(User user);
    //获取所有用户信息(带分页)
    public List<User> getPageUsers(@Param("from") Integer from,
                                      @Param("pageSize") Integer pageSize);
    //查询用户总数
    public Integer queryTotalCount();
    //添加用户
    public Integer addUser(User user);
    //通过uid查询用户
    public List<User> queryUserById(Integer uid);
}
