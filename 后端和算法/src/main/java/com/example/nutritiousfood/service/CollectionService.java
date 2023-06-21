package com.example.nutritiousfood.service;

import com.example.nutritiousfood.entity.Collection;
import com.example.nutritiousfood.entity.Food;

import java.util.List;

public interface CollectionService {
    List<Collection> findByUserid(int userid);
    List<Food> findFoodByUserid(int userid);
    Collection save(Collection collection);
    Collection findByUseridAndFoodid(int userid, int foodid);
    int deleteCollectionByFoodidAndUserid(int foodid, int userid);
}
