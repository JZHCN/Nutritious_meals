package com.example.nutritiousfood.controller;

import com.example.nutritiousfood.entity.ResponseResult;
import com.example.nutritiousfood.entity.User;
import com.example.nutritiousfood.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/login")
@Api(tags = "登录控制器")
@CrossOrigin
public class LoginController {
    @Autowired
    private UserService userService;

    @ApiOperation(value = "登录")
    @GetMapping("login")
    public ResponseResult login(@RequestParam("phonenumber") String phonenumber, @RequestParam("password") String password){
        User user;

        user = userService.findByPhonenumberAndPassword(phonenumber,password);

        if (user == null){
            return new ResponseResult(401,"登录失败");
        }
        else {
            Map<String,String> map = new HashMap<>();
            int id = user.getId();
            int type = user.getType();
            map.put("id",Integer.toString(id));
            map.put("username",user.getUsername());
            map.put("phonenumber",user.getPhonenumber());
            map.put("type",Integer.toString(type));

            return new ResponseResult(200,"登录成功",map);
        }
    }

}
