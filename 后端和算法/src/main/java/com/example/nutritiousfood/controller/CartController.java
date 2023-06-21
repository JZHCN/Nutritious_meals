package com.example.nutritiousfood.controller;

import com.example.nutritiousfood.entity.Cart;
import com.example.nutritiousfood.entity.Food;
import com.example.nutritiousfood.entity.Orders;
import com.example.nutritiousfood.entity.ResponseResult;
import com.example.nutritiousfood.service.CartService;
import com.example.nutritiousfood.service.OrdersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cart")
@Api(tags = "购物车控制器")
@CrossOrigin
public class CartController {
    @Autowired
    private OrdersService orderService;

    @Autowired
    private CartService cartService;

//    @ApiOperation(value = "按用户id和商家id查询订单")
//    @GetMapping("findByUseridAndBusinessid")
//    public List<Orders> findByUseridAndBusinessid(@RequestParam("userid") int userid, @RequestParam("businessid") int businessid){
//        return orderService.findByUseridAndBusinessid(userid,businessid);
//    }

    @ApiOperation(value = "加入购物车")
    @GetMapping("addincart")
    public ResponseResult addincart(@RequestParam("userid") int userid,@RequestParam("foodid") int foodid,@RequestParam("quantity") int quantity,@RequestParam("businessid") int businessid){
        Cart cart = new Cart();
        cart.setUserid(userid);
        cart.setFoodid(foodid);
        cart.setQuantity(quantity);
        cart.setBusinessid(businessid);
        Cart cart1 = cartService.save(cart);

        return new ResponseResult(200,"添加成功",cart1);

    }

    @ApiOperation(value = "删除购物车")
    @GetMapping("deletefromcart")
    public ResponseResult deletefromcart(@RequestParam("id") int id){
        Integer massege = cartService.deleteById(id);
        return new ResponseResult(200,"删除成功",massege);
    }

    @ApiOperation(value = "修改购物车状态")
    @GetMapping("changecart")
    public ResponseResult addincart(@RequestParam("id") int id, @RequestParam("type") int type){
        Cart cart = cartService.findById(id);
        cart.setType(type);
        Cart cart1 = cartService.save(cart);

        return new ResponseResult(200,"添加成功",cart1);
    }

    @ApiOperation(value = "按用户id查询购物车的食物")
    @GetMapping("findfoodbyuserid")
    public ResponseResult findfoodbyuserid(@RequestParam("userid") int userid){
        List<Food> foods = cartService.findFoodByUserid(userid);

        return new ResponseResult(200,"查询成功",foods);
    }

    @ApiOperation(value = "按用户id查询购物车的项")
    @GetMapping("findbyuserid")
    public ResponseResult findbyuserid(@RequestParam("userid") int userid){
        List<Cart> carts = cartService.findByUserid(userid);

        return new ResponseResult(200,"查询成功",carts);
    }

}
