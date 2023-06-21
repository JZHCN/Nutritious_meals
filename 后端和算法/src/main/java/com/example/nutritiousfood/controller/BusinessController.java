package com.example.nutritiousfood.controller;

import com.example.nutritiousfood.entity.Business;
import com.example.nutritiousfood.entity.Food;
import com.example.nutritiousfood.entity.ResponseResult;
import com.example.nutritiousfood.entity.User;
import com.example.nutritiousfood.service.BusinessService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/business")
@Api(tags = "商家控制器")
@CrossOrigin
public class BusinessController {
    @Autowired
    private BusinessService businessService;

    @ApiOperation(value = "所有商家")
    @GetMapping("findall")
    public ResponseResult findall(){
        List<Business> businessesList = businessService.findAll();

        return new ResponseResult(200,"查询成功",businessesList);
    }

    @ApiOperation(value = "按id查询商家")
    @GetMapping("findbyid")
    public ResponseResult findbyid(@RequestParam("id")int id){


        Business business = businessService.findById(id);

        return new ResponseResult(200,"查询成功",business);
    }

    @ApiOperation(value = "模糊搜索商家")
    @GetMapping("findbybusinessnamelike")
    public  ResponseResult findbybusinessnamelike(@RequestParam("businessname") String businessname){

        List<Business> businessList = businessService.findByBusinessnameLike("%"+businessname+"%");
        return new ResponseResult(200,"查询成功",businessList);
    }

}
