package com.example.nutritiousfood.dao;

import com.example.nutritiousfood.entity.Food;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FoodDao extends JpaRepository<Food,Integer> {

    List<Food> findAll();
    Food findById(int id);
    Food deleteFoodsById(int id);
    List<Food> findByBusinessid(int businessid);
    List<Food> findByFoodnameLike(String foodname);
    List<Food> findByNutritype(int nutritype);
    //"select * from product_table where productID in ("+sqlId+")"
    //f.id,f.foodname,f.price,f.img,f.carbohydrate,f.fat,f.protein,f.calories,f.businessid,f.description
//    @Query(value = "select new com.example.nutritiousfood.entity.Food(f.id,f.foodname,f.price,f.img,f.carbohydrate,f.fat,f.protein,f.calories,f.businessid,f.description,f.nutritype) from Food f where f.id in/(?/)")
//    List<Food> findFoodByid(int sqlId);

}
