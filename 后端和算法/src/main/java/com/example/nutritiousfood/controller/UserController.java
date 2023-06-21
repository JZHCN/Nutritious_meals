package com.example.nutritiousfood.controller;

import com.example.nutritiousfood.entity.ResponseResult;
import com.example.nutritiousfood.entity.User;
import com.example.nutritiousfood.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/user")
@Api(tags = "用户控制器")
@CrossOrigin
public class UserController {
    @Autowired
    private UserService userService;

    @ApiOperation(value = "所有用户")
    @GetMapping("findall")
    public ResponseResult findall(){
        List<User> userList = userService.findAll();

        return new ResponseResult(200,"查询成功",userList);
    }

    @ApiOperation(value = "根据id查询用户")
    @GetMapping("findbyid")
    public ResponseResult findbyid(@RequestParam("id")int id) {
        User user = userService.findById(id);
        return new ResponseResult(200,"查询成功",user);
    }



}
