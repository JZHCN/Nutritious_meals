package com.example.nutritiousfood.entity;

import lombok.Data;

import java.util.List;

@Data
public class Document {
    List<Food> foodList;
    List<Integer> quantities;
}
