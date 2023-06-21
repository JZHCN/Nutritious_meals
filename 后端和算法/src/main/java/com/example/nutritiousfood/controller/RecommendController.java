package com.example.nutritiousfood.controller;

import com.example.nutritiousfood.entity.Food;
import com.example.nutritiousfood.entity.Orderdetail;
import com.example.nutritiousfood.entity.ResponseResult;
import com.example.nutritiousfood.entity.UserR;
import com.example.nutritiousfood.service.FoodService;
import com.example.nutritiousfood.service.OrderdetailService;
import com.example.nutritiousfood.service.OrdersService;
import com.example.nutritiousfood.util.Recommend;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
//import sun.nio.cs.ext.IBM420;

import javax.swing.text.Document;
import java.util.*;

@RestController
@RequestMapping("/recommend")
@Api(tags = "推荐控制器")
@CrossOrigin
public class RecommendController {
    @Autowired
    private OrdersService ordersService;

    @Autowired
    private OrderdetailService orderdetailService;

    @Autowired
    private FoodService foodService;

    @ApiOperation(value = "推荐算法推荐食物")
    @GetMapping("recommendfood")
    public ResponseResult recommendfood(@RequestParam("userid") int userid){

        Recommend recommend =new Recommend();

        //1，使用该用户的名字获取订单信息
        //System.out.println("----------------");
        //查询登录用户的订单信息
        List<Orderdetail> productOrderList = orderdetailService.findOrderdetailUserid(userid);

        //存储个人 购买的所有的商品id
        Integer[] ints = new Integer[productOrderList.size()];

        //存储个人信息，封装成对象，方便计算
        UserR userR = new UserR();

        //筛选出来个人订单中的商品的id
        for (int i = 0; i < productOrderList.size(); i++) {
            ints[i] = productOrderList.get(i).getFoodid();
        }
        userR.setUserId(userid);
        userR.setProductIds(ints);


        //2,拿到所有用户的订单信息
        List<Orderdetail> productOrderLists = orderdetailService.findAll();

        //存储所有人的订单信息
        List<UserR> userRS = new ArrayList<>();

        //利用map的机制，计算出来其余用户的所有的购买商品的id  Map<用户id，商品ID拼接的字符串(1,2,3,4)>
        Map<Integer,String> map = new HashMap<>();


        //筛选出来订单中的商品的id
        for (int i = 0; i < productOrderLists.size(); i++) {
            map.put(productOrderLists.get(i).getUserid(),
                    map.containsKey(productOrderLists.get(i).getUserid())?
                            map.get(productOrderLists.get(i).getUserid())+","+productOrderLists.get(i).getFoodid():
                            productOrderLists.get(i).getFoodid()+"");
        }

        //开始封装每个人的数据
        for (Integer key:map.keySet() ) {

            //new出来一个新的个人的对象，后面要塞到list中
            UserR userR2 = new UserR();

            //把其他每个人购买的商品的id 分割成数组
            String[] split = map.get(key).split(",");

            //转换成int数组 进行存储，方便后期计算
            Integer[] ints1 = new Integer[split.length];
            for (int i = 0; i < split.length; i++) {
                ints1[i] = Integer.valueOf(split[i]);
            }

            //用户id 就是key
            userR2.setUserId(key);
            //用户购买的商品id的数组
            userR2.setProductIds(ints1);

            //塞到list中
            userRS.add(userR2);
        }

        //二值化 处理数据
        List<UserR> userRList = recommend.jisuan(userR, userRS);
        List<Integer> ids = new ArrayList<>();
        //过滤处理
        //try {
           ids = recommend.chuli(userRList, userR);
        //}catch (Exception ignored){

       // }
        if(ids.size()<5){//如果推荐的不够5个，就随机添加够5个
            while (ids.size()<5){
                Random random = new Random();
                int idnum = random.nextInt(85)+1;
                int flag = 0;
                for (int id:ids
                     ) {
                    if (id==idnum||idnum==45||idnum==65||idnum==66){
                        flag = 1;
                    }
                }
                if (flag == 0){
                    ids.add(idnum);
                }
            }
        }

        //System.out.println("推荐的商品：");
        //通过拿到的拼接的被推荐商品的id，去查数据库
        //List<Orderdetail> productList = DBHelp.getProductList(sqlId);
        List<Food> foodList = new ArrayList<Food>();;
        for (int id: ids
             ) {
            Food food = foodService.findById(id);
            foodList.add(food);
        }
        //最终拿到被推荐商品的信息
//        for (int i = 0; i < productList.size(); i++) {
//            System.out.println(productList.get(i).toString());
//        }
        return new ResponseResult(200,"推荐成功",foodList);
    }


    //45 65 66
    @ApiOperation(value = "随机推荐食物")
    @GetMapping("randomrecommendfood")
    public ResponseResult randomrecommendfood(){

        List<Integer> ids = new ArrayList<Integer>();
            while (ids.size()<5){//随机推荐五个食物
                Random random = new Random();
                int idnum = random.nextInt(85)+1;
                int flag = 0;
                for (int id:ids
                ) {
                    if (id==idnum||idnum==45||idnum==65||idnum==66){
                        flag = 1;
                    }
                }
                if (flag == 0){
                    ids.add(idnum);
                }
            }
        List<Food> foodList = new ArrayList<Food>();
        for (int id: ids
        ) {
            Food food = foodService.findById(id);
            foodList.add(food);
        }

        return new ResponseResult(200,"推荐成功",foodList);

    }
}
