package com.example.nutritiousfood.service;

import com.example.nutritiousfood.entity.Cart;
import com.example.nutritiousfood.entity.Food;

import java.util.List;

public interface CartService {

    Cart save(Cart cart);
    Cart findById(int id);
    List<Cart> findByUserid(int userid);
    Integer deleteById(int id);

    List<Food> findFoodByUserid(int userid);
}
