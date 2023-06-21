package com.example.nutritiousfood.dao;

import com.example.nutritiousfood.entity.Business;
import com.example.nutritiousfood.entity.Cart;
import com.example.nutritiousfood.entity.Food;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartDao extends JpaRepository<Cart,Integer> {

    Cart save(Cart cart);
    Cart findById(int id);
    List<Cart> findByUserid(int userid);
    Integer deleteById(int id);


    //f.id,f.foodname,f.price,f.img,f.carbohydrate,f.fat,f.protein,f.calories,f.businessid,f.description
    @Query(value = "select new com.example.nutritiousfood.entity.Food(f.id,f.foodname,f.price,f.img,f.carbohydrate,f.fat,f.protein,f.calories,f.businessid,f.description,f.nutritype) from Food f left join Cart c on f.id=c.foodid where c.userid=?1")
    List<Food> findFoodByUserid(int userid);

}
