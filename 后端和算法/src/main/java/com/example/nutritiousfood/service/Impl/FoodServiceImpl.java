package com.example.nutritiousfood.service.Impl;

import com.example.nutritiousfood.dao.FoodDao;
import com.example.nutritiousfood.entity.Food;
import com.example.nutritiousfood.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FoodServiceImpl implements FoodService {
    @Autowired
    private FoodDao foodDao;

    @Override
    public List<Food> findAll(){
        return foodDao.findAll();
    }

    @Override
    public Food findById(int id){
        return foodDao.findById(id);
    }

    @Override
    public Food deleteFoodsById(int id){
        return foodDao.deleteFoodsById(id);
    };

    @Override
    public List<Food> findByBusinessid(int businessid) {

        return foodDao.findByBusinessid(businessid);
    }

    @Override
    public List<Food> findByFoodnameLike(String foodname){
        return foodDao.findByFoodnameLike(foodname);
    }

    @Override
    public List<Food> findByNutritype(int nutritype){
        return foodDao.findByNutritype(nutritype);
    }

//    @Override
//    public List<Food> findFoodById(String sqlId){
//
//
//    }

}
