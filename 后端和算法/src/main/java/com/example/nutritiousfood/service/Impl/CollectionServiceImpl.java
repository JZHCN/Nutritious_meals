package com.example.nutritiousfood.service.Impl;

import com.example.nutritiousfood.dao.CollectionDao;
import com.example.nutritiousfood.entity.Collection;
import com.example.nutritiousfood.entity.Food;
import com.example.nutritiousfood.service.CollectionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CollectionServiceImpl implements CollectionService {
    @Resource
    private CollectionDao collectionDao;

    @Override
    public List<Collection> findByUserid(int userid){
        return collectionDao.findByUserid(userid);
    }

    @Override
    public List<Food> findFoodByUserid(int userid){
        return collectionDao.findFoodByUserid(userid);
    }

    @Override
    public Collection save(Collection collection){
        return collectionDao.save(collection);
    }

    @Override
    public Collection findByUseridAndFoodid(int userid, int foodid){
        return collectionDao.findByUseridAndFoodid(userid,foodid);
    }

    @Override
    public int deleteCollectionByFoodidAndUserid(int foodid, int userid){
        return collectionDao.deleteCollectionByFoodidAndUserid(foodid,userid);
    }
}
