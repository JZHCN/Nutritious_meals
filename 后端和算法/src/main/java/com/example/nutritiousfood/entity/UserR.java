package com.example.nutritiousfood.entity;


import lombok.Data;

@Data
public class UserR {//不是实体类，这个类用于推荐功能

    private String userName;

    private Integer userId;

    private Integer[] ProductIds;

    private Double cos_th;
}
