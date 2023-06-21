package com.example.nutritiousfood.service.Impl;

import com.example.nutritiousfood.dao.BusinessDao;
import com.example.nutritiousfood.entity.Business;
import com.example.nutritiousfood.service.BusinessService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BusinessServiceImpl implements BusinessService {
    @Resource
    private BusinessDao businessDao;

    @Override
    public List<Business> findAll(){
        return businessDao.findAll();
    }

    @Override
    public Business findById(int id){
        return businessDao.findById(id);
    }

    @Override
    public List<Business> findByBusinessnameLike(String businessname){
        return businessDao.findByBusinessnameLike(businessname);
    }
}
