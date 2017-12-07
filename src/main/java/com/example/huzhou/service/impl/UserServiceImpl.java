package com.example.huzhou.service.impl;

import com.example.huzhou.entity.User;
import com.example.huzhou.mapper.test1.UserDao;
import com.example.huzhou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
//@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class UserServiceImpl implements UserService {
   @Autowired
    private  UserDao userDao ;
    @Override
    public User getByUserName(String username) {
        return userDao.getByUserName(username);
    }

}
