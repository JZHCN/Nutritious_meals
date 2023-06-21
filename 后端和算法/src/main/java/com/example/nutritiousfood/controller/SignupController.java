package com.example.nutritiousfood.controller;

import com.example.nutritiousfood.entity.ResponseResult;
import com.example.nutritiousfood.entity.User;
import com.example.nutritiousfood.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/signup")
@Api(tags = "注册控制器")
@CrossOrigin
public class SignupController {
    @Autowired
    private UserService userService;

    @ApiOperation(value = "注册")
    @GetMapping("signup")
    public ResponseResult signup(String username,String password,String phonenumber,int type){
        User olduser;
        olduser = userService.findByPhonenumberAndPassword(phonenumber,password);
        if (olduser != null){
            return new ResponseResult(401,"注册失败");
        }
        else {
            User user =new User();
            user.setType(type);
            user.setPhonenumber(phonenumber);
            user.setUsername(username);
            user.setPassword(password);
            userService.save(user);
            Map<String,String> map = new HashMap<>();
            int id = user.getId();
            map.put("id",Integer.toString(id));
            map.put("username",user.getUsername());
            map.put("phonenumber",user.getPhonenumber());
            map.put("type",Integer.toString(type));
            return new ResponseResult(200,"注册成功",map);
        }
    }
}
