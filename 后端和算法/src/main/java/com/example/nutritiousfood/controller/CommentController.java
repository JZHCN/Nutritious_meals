package com.example.nutritiousfood.controller;

import com.example.nutritiousfood.entity.Comment;
import com.example.nutritiousfood.entity.ResponseResult;
import com.example.nutritiousfood.service.CommentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/comment")
@Api(tags = "评论控制器")
@CrossOrigin
public class CommentController {

    @Autowired
    private CommentService commentService;

    @ApiOperation(value = "按食物id查询评论")
    @GetMapping("findByFoodid")
    public ResponseResult findByFoodid(@RequestParam("foodid") int foodid){

        List<Comment> comments = commentService.findByFoodid(foodid);
        return new ResponseResult(200,"查询成功",comments);
    }
}
