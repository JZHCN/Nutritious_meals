package com.example.nutritiousfood.service.Impl;

import com.example.nutritiousfood.dao.OrderdetailDao;
import com.example.nutritiousfood.entity.Orderdetail;
import com.example.nutritiousfood.service.OrderdetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderdetailServiceImpl implements OrderdetailService {
    @Resource
    private OrderdetailDao orderdetailDao;

    @Override
    public Orderdetail save(Orderdetail orderdetail){
        return orderdetailDao.save(orderdetail);
    }

    @Override
    public List<Orderdetail> findByOrderid(int orderid){
        return orderdetailDao.findByOrderid(orderid);
    }

    @Override
    public List<Orderdetail> findOrderdetailUserid(int userid){
        return orderdetailDao.findOrderdetailUserid(userid);
    }

    @Override
    public List<Orderdetail> findAll(){
        return orderdetailDao.findAll();
    }

    public int removeAllByOrderid(int orderId){
        return orderdetailDao.removeAllByOrderid(orderId);
    };

    @Override
    public <S extends Orderdetail> List<S> saveAll(Iterable<S> entities){
        return orderdetailDao.saveAll(entities);
    }
}
