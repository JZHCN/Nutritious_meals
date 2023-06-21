package com.example.nutritiousfood.service;

import com.example.nutritiousfood.entity.Orders;

import java.util.List;

public interface OrdersService {
    //List<Orders> findByUseridAndBusinessid(int userid, int businessid);
    Orders findById(int id);
    List<Orders> findByUserid(int userid);
    List<Orders> findByUseridAndAndType(int userid, int type);
    Orders save(Orders orders);

    void deleteById(Integer id);
}
