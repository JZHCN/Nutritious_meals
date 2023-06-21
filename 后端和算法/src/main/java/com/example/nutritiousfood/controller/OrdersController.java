package com.example.nutritiousfood.controller;

import com.example.nutritiousfood.entity.Orderdetail;
import com.example.nutritiousfood.entity.Orders;
import com.example.nutritiousfood.entity.ResponseResult;
import com.example.nutritiousfood.service.OrderdetailService;
import com.example.nutritiousfood.service.OrdersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

@RestController
@RequestMapping("/orders")
@Api(tags = "订单控制器")
@CrossOrigin
public class OrdersController {
    @Autowired
    private OrdersService ordersService;

    @Autowired
    private OrderdetailService orderdetailService;

    @ApiOperation(value = "我的订单（根据用户id查询订单）")
    @GetMapping("findbyuserid")
    public ResponseResult findbyuserid(@RequestParam("userid") int userid){
        List<Orders> orders = ordersService.findByUserid(userid);
        for (Orders order:orders
             ) {
            List<Orderdetail> orderdetailList = orderdetailService.findByOrderid(order.getId());
            order.setOrderdetailList(orderdetailList);
        }
        return new ResponseResult(200,"查询成功",orders);
    }

    @ApiOperation(value = "我的订单（根据用户id和订单状态查询订单）")
    @GetMapping("findbyuseridandtype")
    public ResponseResult findbyuseridandtype(@RequestParam("userid") int userid,@RequestParam("type") int type){
        List<Orders> orders = ordersService.findByUseridAndAndType(userid,type);
        for (Orders order:orders
        ) {
            List<Orderdetail> orderdetailList = orderdetailService.findByOrderid(order.getId());
            order.setOrderdetailList(orderdetailList);
        }
        return new ResponseResult(200,"查询成功",orders);
    }

    @ApiOperation(value = "新增订单")
    @GetMapping("addorders")
    public ResponseResult addorders(@RequestParam("userid") int userid,@RequestParam("totalprice") double totalprice,@RequestParam("pickuptimestart") String pickuptimestart,@RequestParam("pickuptimeend") String pickuptimeend){
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime pickuptimestartformat = LocalDateTime.parse(pickuptimestart, df);
        LocalDateTime pickuptimeendformat = LocalDateTime.parse(pickuptimeend, df);
        TimeZone time = TimeZone.getTimeZone("Asia/Shanghai");
        //格式
        //SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // 设置时区
        TimeZone.setDefault(time);
        // 获取实例
        Calendar calendar = Calendar.getInstance();
        //获取Date对象
        Date date = calendar.getTime();
        Timestamp nousedate = new Timestamp(date.getTime());
        Orders orders = new Orders();
        orders.setUserid(userid);
        orders.setTotalprice(totalprice);
        orders.setOrdertime(nousedate);
        orders.setPickuptimestart(pickuptimestartformat);
        orders.setPickuptimeend(pickuptimeendformat);
        orders.setType(1);
        Orders orders1 = ordersService.save(orders);
        System.out.println(orders1);
        return new ResponseResult(200,"添加成功",orders1);

    }

    @ApiOperation(value = "修改订单状态")
    @GetMapping("changetype")
    public ResponseResult changetype(@RequestParam("id") int id,@RequestParam("type") int type){

        Orders orders = ordersService.findById(id);
        orders.setType(type);
        Orders orders1 = ordersService.save(orders);
        return new ResponseResult(200,"修改成功",orders1);

    }

    @ApiOperation(value = "修改订单取餐时间")
    @GetMapping("changetime")
    public ResponseResult changetime(@RequestParam("id") int id,@RequestParam("pickuptimestart") String pickuptimestart,@RequestParam("pickuptimeend") String pickuptimeend){

        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime pickuptimestartformat = LocalDateTime.parse(pickuptimestart, df);
        LocalDateTime pickuptimeendformat = LocalDateTime.parse(pickuptimeend, df);
        Orders orders = ordersService.findById(id);
        orders.setPickuptimestart(pickuptimestartformat);
        orders.setPickuptimeend(pickuptimeendformat);
        Orders orders1 = ordersService.save(orders);
        return new ResponseResult(200,"修改成功",orders1);

    }

    @ApiOperation(value = "删除订单（包括订单和订单详细）")
    @GetMapping("deleteOrders")
    @Transactional
    public ResponseResult deleteOrders(@RequestParam("orderid") int orderid){
        int num = orderdetailService.removeAllByOrderid(orderid);
        ordersService.deleteById(orderid);

        return new ResponseResult(200,"删除成功", num);
    }
}
