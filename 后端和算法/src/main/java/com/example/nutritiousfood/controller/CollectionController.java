package com.example.nutritiousfood.controller;

import com.example.nutritiousfood.entity.Collection;
import com.example.nutritiousfood.entity.Food;
import com.example.nutritiousfood.entity.ResponseResult;
import com.example.nutritiousfood.service.CollectionService;
import com.example.nutritiousfood.service.FoodService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Iterator;
import java.util.List;

@RestController
@RequestMapping("/collection")
@Api(tags = "收藏控制器")
@CrossOrigin
public class CollectionController {
    @Autowired
    private CollectionService collectionService;

    @Autowired
    private FoodService foodService;

    @ApiOperation(value = "按用户id查询收藏")
    @GetMapping("findByUserid")
    public ResponseResult findByUserid(@RequestParam("userid") int userid) {

        List<Food> foods = collectionService.findFoodByUserid(userid);
        return new ResponseResult(200,"查询成功",foods);
    }


    @ApiOperation(value = "按用户id和商品id查询是否已收藏")
    @GetMapping("findByUseridAndFoodid")
    public ResponseResult findByUseridAndFoodid(@RequestParam("userid") int userid,@RequestParam("foodid") int foodid) {

        Collection collection = collectionService.findByUseridAndFoodid(userid,foodid);
        if(collection == null){

            return new ResponseResult(200,"查询成功",false);
        }
        else {

            return new ResponseResult(200,"查询成功",true);
        }
    }

    @ApiOperation(value = "新增收藏(若存在则删除收藏)")
    @GetMapping("addcollection")
    public ResponseResult addcollection(@RequestParam("userid") int userid, @RequestParam("foodid") int foodid) {

//        Collection collectiontest = collectionService.findByUseridAndFoodid(userid,foodid);
//        if(collectiontest == null){
//            Collection collection = new Collection() ;
//            collection.setFoodid(foodid);
//            collection.setUserid(userid);
//
//            Collection collection1 = collectionService.save(collection);
//
//            return new ResponseResult(200,"新增成功",collection1);
//        }else if(collectiontest.getDeletemark() == 1){
//            collectiontest.setDeletemark(0);
//            Collection collection1 = collectionService.save(collectiontest);
//            return new ResponseResult(200,"新增成功",collection1);
//        }
//        else {
//            collectiontest.setDeletemark(1);
//            Collection collection1 = collectionService.save(collectiontest);
//            return new ResponseResult(200,"删除成功",collection1);
//        }
        Collection collectiontest = collectionService.findByUseridAndFoodid(userid,foodid);

        if(collectiontest == null){
            Collection collection = new Collection() ;
            collection.setFoodid(foodid);
            collection.setUserid(userid);

            Collection collection1 = collectionService.save(collection);

            return new ResponseResult(200,"收藏成功",collection1);
        }else {
            int massage = collectionService.deleteCollectionByFoodidAndUserid(foodid,userid);
            return new ResponseResult(200,"取消收藏成功",massage);
        }
    }
}
