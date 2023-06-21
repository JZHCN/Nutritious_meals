package com.example.nutritiousfood.dao;

import com.example.nutritiousfood.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao extends JpaRepository<User,Integer> {

    User getReferenceById(Integer integer);

    List<User> findAll();

    User findByPhonenumberAndPassword(String phonenumber, String password);

    User save(User user);

    User findById(int id);
}
