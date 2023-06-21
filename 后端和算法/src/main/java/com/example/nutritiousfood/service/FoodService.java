package com.example.nutritiousfood.service;

import com.example.nutritiousfood.entity.Food;

import java.util.List;

public interface FoodService {

    List<Food> findAll();
    Food findById(int id);
    Food deleteFoodsById(int id);

    List<Food> findByBusinessid(int businessid);
    List<Food> findByNutritype(int nutritype);
    List<Food> findByFoodnameLike(String foodname);
    //List<Food> findFoodById(String sqlId);

}
