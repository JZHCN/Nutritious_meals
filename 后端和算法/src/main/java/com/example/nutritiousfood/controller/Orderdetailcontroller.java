package com.example.nutritiousfood.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.nutritiousfood.entity.*;
import com.example.nutritiousfood.service.OrderdetailService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/orderdetail")
@Api(tags = "订单详情控制器")
@CrossOrigin
public class Orderdetailcontroller {
    @Autowired
    private OrderdetailService orderdetailService;

    @ApiOperation(value = "新增订单详情")
    @PostMapping("addorderdetail")
    public ResponseResult addorders(@RequestBody Document document, @RequestParam("userid") int userid, @RequestParam("orderid") int orderid){

        List<Food> foodList = (List<Food>) document.getFoodList();
        List<Integer> quantitylist = (List<Integer>)document.getQuantities() ;
        List<Orderdetail> orderdetails = new ArrayList<Orderdetail>();
        //List foodlist = JSONObject.parseObject(foods, List.class);
        //List quantitylist = JSONObject.parseObject(quantities, List.class);
        for(int i=0;i<foodList.size();i++) {
            Food food = JSONObject.parseObject(JSONObject.toJSONString(foodList.get(i)),Food.class);
            Integer quantity = JSONObject.parseObject(JSONObject.toJSONString(quantitylist.get(i)),Integer.class);
            Orderdetail orderdetail = new Orderdetail();
            orderdetail.setUserid(userid);
            orderdetail.setOrderid(orderid);
            orderdetail.setQuantity(quantity);
            orderdetail.setFoodid(food.getId());
            orderdetail.setBusinessid(food.getBusinessid());
            orderdetail.setFoodname(food.getFoodname());
            orderdetail.setPrice(food.getPrice());
            orderdetail.setImg(food.getImg());
            orderdetail.setCarbohydrate(food.getCarbohydrate());
            orderdetail.setFat(food.getFat());
            orderdetail.setProtein(food.getProtein());
            orderdetail.setCalories(food.getCalories());
            orderdetail.setDescription(food.getDescription());
            orderdetail.setNutritype(food.getNutritype());
            orderdetails.add(orderdetail);
        }

        List<Orderdetail> orderdetails1 = orderdetailService.saveAll(orderdetails);
        return new ResponseResult(200,"添加成功",orderdetails1);

    }

    @ApiOperation(value = "查询订单详情")
    @GetMapping("findorderdetailbyorderid")
    public ResponseResult findorderdetailbyorderid(@RequestParam("orderid") int orderid){
        List<Orderdetail> orderdetails = orderdetailService.findByOrderid(orderid);
        return new ResponseResult(200,"查询成功",orderdetails);
    }
}
