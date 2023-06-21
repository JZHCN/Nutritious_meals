package com.example.nutritiousfood.service;

import com.example.nutritiousfood.entity.Orderdetail;

import java.util.List;

public interface OrderdetailService {
    Orderdetail save(Orderdetail orderdetail);
    List<Orderdetail> findByOrderid(int orderid);
    List<Orderdetail> findOrderdetailUserid(int userid);
    List<Orderdetail> findAll();
    <S extends Orderdetail> List<S> saveAll(Iterable<S> entities);

    int removeAllByOrderid(int orderId);
}
