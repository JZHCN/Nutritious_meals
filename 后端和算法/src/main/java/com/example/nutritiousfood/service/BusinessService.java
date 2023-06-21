package com.example.nutritiousfood.service;

import com.example.nutritiousfood.entity.Business;

import java.util.List;

public interface BusinessService {
    List<Business> findAll();

    Business findById(int id);
    List<Business> findByBusinessnameLike(String businessname);
}
