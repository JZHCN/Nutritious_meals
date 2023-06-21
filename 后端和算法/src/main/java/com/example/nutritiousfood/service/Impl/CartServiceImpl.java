package com.example.nutritiousfood.service.Impl;

import com.example.nutritiousfood.dao.CartDao;
import com.example.nutritiousfood.entity.Cart;
import com.example.nutritiousfood.entity.Food;
import com.example.nutritiousfood.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Resource
    private CartDao cartDao;

    @Override
    public Cart save(Cart cart){
        return cartDao.save(cart);
    }

    @Override
    public Cart findById(int id){
        return cartDao.findById(id);
    }

    @Override
    public Integer deleteById(int id){
        return cartDao.deleteById(id);
    }


    @Override
    public List<Cart> findByUserid(int userid) {

        return cartDao.findByUserid(userid);
    }

    @Override
    public List<Food> findFoodByUserid(int userid){
        return cartDao.findFoodByUserid(userid);
    }
}
