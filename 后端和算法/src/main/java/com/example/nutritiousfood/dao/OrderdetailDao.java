package com.example.nutritiousfood.dao;

import com.example.nutritiousfood.entity.Business;
import com.example.nutritiousfood.entity.Food;
import com.example.nutritiousfood.entity.Orderdetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderdetailDao extends JpaRepository<Orderdetail,Integer> {

    Orderdetail save(Orderdetail orderdetail);
    List<Orderdetail> findByOrderid(int orderid);

    //int id, int orderid, int foodid, int quantity, int businessid,
    //                       String foodname, double price, String img, double carbohydrate,
    //                       double fat, double protein, double calories,
    //                       String description, int nutritype
    @Query(value = "select new com.example.nutritiousfood.entity.Orderdetail(od.id,od.orderid,od.userid,od.foodid,od.quantity,od.businessid,od.foodname,od.price,od.img,od.carbohydrate,od.fat,od.protein,od.calories,od.description,od.nutritype) from Orderdetail od left join Orders o on o.id=od.orderid where o.userid=?1")
    List<Orderdetail> findOrderdetailUserid(int userid);

    List<Orderdetail> findAll();

    int deleteAllByOrderid(int orderId);

    int deleteOrderdetailsByOrderid(int orderId);

    int removeAllByOrderid(int orderId);

    @Override
    <S extends Orderdetail> List<S> saveAll(Iterable<S> entities);
}
