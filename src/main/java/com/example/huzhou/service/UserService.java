package com.example.huzhou.service;

import com.example.huzhou.entity.User;

/**
 * @描述:
 * @类名:
 * @作者: yangshuang
 * @创建时间: 2017/6/16 16:41
 * @版本: v1.0
 */
public interface UserService {
    /**
     * 通过用户名查询用户
     * @param username
     * @return
     */
    User getByUserName(String username);
}
