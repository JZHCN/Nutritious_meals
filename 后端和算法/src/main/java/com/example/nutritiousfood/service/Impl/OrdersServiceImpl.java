package com.example.nutritiousfood.service.Impl;

import com.example.nutritiousfood.dao.OrdersDao;
import com.example.nutritiousfood.entity.Orders;
import com.example.nutritiousfood.service.OrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {
    @Resource
    private OrdersDao ordersDao;
//    @Override
//    public List<Orders> findByUseridAndBusinessid(int userid, int businessid){
//        return ordersDao.findByUseridAndBusinessid(userid,businessid);
//    }
    @Override
    public Orders findById(int id){
        return ordersDao.findById(id);
    }

    @Override
    public List<Orders> findByUserid(int userid){
        return ordersDao.findByUserid(userid);
    }

    @Override
    public List<Orders> findByUseridAndAndType(int userid, int type){
        return ordersDao.findByUseridAndAndType(userid,type);
    }

    @Override
    public Orders save(Orders orders){
        return ordersDao.save(orders);
    }

    public void deleteById(Integer id){
        ordersDao.deleteById(id);
    };
}
