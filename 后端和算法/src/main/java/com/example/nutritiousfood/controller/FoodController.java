package com.example.nutritiousfood.controller;

import com.example.nutritiousfood.entity.Business;
import com.example.nutritiousfood.entity.Food;
import com.example.nutritiousfood.entity.ResponseResult;
import com.example.nutritiousfood.service.BusinessService;
import com.example.nutritiousfood.service.FoodService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/food")
@Api(tags = "食物控制器")
@CrossOrigin
public class FoodController {
    @Autowired
    private FoodService foodService;

    @ApiOperation(value = "所有食物")
    @GetMapping("findall")
    public ResponseResult findall(){
        List<Food> foodList = foodService.findAll();

        return new ResponseResult(200,"查询成功",foodList);
    }

    @ApiOperation(value = "按id查询食物")
    @GetMapping("findby/{id}")
    public ResponseResult findbyid(@PathVariable(value = "id") int id){
        Food food = foodService.findById(id);


        return new ResponseResult(200,"查询成功",food);
    }

    @ApiOperation(value = "按id删除食物")
    @GetMapping("deleteby/{id}")
    public ResponseResult deletebyid(@PathVariable(value = "id") int id){
        Food food = foodService.deleteFoodsById(id);

        return new ResponseResult(200,"删除成功",food);
    }

    @ApiOperation(value = "按商家id查询食物")
    @GetMapping("findbybusinessid/{businessid}")
    public ResponseResult findbybusinessid(@PathVariable(value = "businessid") int businessid){


        List<Food> foods = foodService.findByBusinessid(businessid);
        return new ResponseResult(200,"查询成功",foods);
    }

    @ApiOperation(value = "按营养类型查询食物")
    @GetMapping("findbynutritype/{nutritype}")
    public ResponseResult findbynutritype(@PathVariable(value = "nutritype") int nutritype){


        List<Food> foods = foodService.findByNutritype(nutritype);

        return new ResponseResult(200,"查询成功",foods);
    }

    @ApiOperation(value = "模糊搜索食物")
    @GetMapping("findbyfoodnamelike")
    public ResponseResult findbyfoodnamelike(@RequestParam("foodname") String foodname){

        List<Food> foods = foodService.findByFoodnameLike("%"+foodname+"%");
        return new ResponseResult(200,"查询成功",foods);
    }


}
