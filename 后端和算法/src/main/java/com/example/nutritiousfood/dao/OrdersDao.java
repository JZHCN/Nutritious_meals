package com.example.nutritiousfood.dao;

import com.example.nutritiousfood.entity.Food;
import com.example.nutritiousfood.entity.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrdersDao extends JpaRepository<Orders,Integer> {
    //List<Orders> findByUseridAndBusinessid(int userid, int businessid);
    Orders findById(int id);
    List<Orders> findByUserid(int userid);
    List<Orders> findByUseridAndAndType(int userid, int type);
    Orders save(Orders orders);

    void deleteById(Integer id);

}
