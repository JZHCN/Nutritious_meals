package com.example.nutritiousfood.service;

import com.example.nutritiousfood.entity.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> findByFoodid(int foodid);
}
