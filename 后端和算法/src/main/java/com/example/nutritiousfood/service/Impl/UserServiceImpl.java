package com.example.nutritiousfood.service.Impl;

import com.example.nutritiousfood.dao.UserDao;
import com.example.nutritiousfood.entity.User;
import com.example.nutritiousfood.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    @Override
    public User getReferenceById(Integer integer) {
        return null;
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User findByPhonenumberAndPassword(String phonenumber, String password) {

        return userDao.findByPhonenumberAndPassword(phonenumber,password);
    }

    @Override
    public User save(User user){
        return userDao.save(user);
    }

    @Override
    public User findById(int id){
        return userDao.findById(id);
    }


}
