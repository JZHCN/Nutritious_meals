package com.example.nutritiousfood.dao;

import com.example.nutritiousfood.entity.Cart;
import com.example.nutritiousfood.entity.Collection;
import com.example.nutritiousfood.entity.Food;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface CollectionDao extends JpaRepository<Collection,Integer> {
    List<Collection> findByUserid(int userid);
    Collection findByUseridAndFoodid(int userid, int foodid);

    @Query(value = "select new com.example.nutritiousfood.entity.Food(f.id,f.foodname,f.price,f.img,f.carbohydrate,f.fat,f.protein,f.calories,f.businessid,f.description,f.nutritype) from Food f left join Collection c on f.id=c.foodid where c.userid=?1")
    List<Food> findFoodByUserid(int userid);

    Collection save(Collection collection);

    @Modifying
    @Transactional
    int deleteCollectionByFoodidAndUserid(int foodid, int userid);
}
