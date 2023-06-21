package com.example.nutritiousfood.service;

import com.example.nutritiousfood.entity.User;

import java.util.List;

public interface UserService {

    User getReferenceById(Integer integer);

    List<User> findAll();

    User findByPhonenumberAndPassword(String phonenumber, String password);

    User save(User user);

    User findById(int id);
}
