package com.example.nutritiousfood.service.Impl;

import com.example.nutritiousfood.dao.CommentDao;
import com.example.nutritiousfood.entity.Comment;
import com.example.nutritiousfood.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentDao commentDao;

    @Override
    public List<Comment> findByFoodid(int foodid){
        return commentDao.findByFoodid(foodid);
    }
}
