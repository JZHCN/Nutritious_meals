package com.example.nutritiousfood.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
public class Food implements Serializable {

    private static final long serialVersionUID = -1242493306307174690L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String foodname;

    @Column
    private double price;

    @Column
    private String img;

    @Column
    private double carbohydrate;//碳水化合物

    @Column
    private double fat;//脂肪

    @Column
    private double protein;//蛋白质

    @Column
    private double calories;//卡路里

    @Column
    private int businessid;

    @Column
    private String description;

    @Column
    private int nutritype;//0无标签，1补充蛋白质，2减脂，3补充维生素，4补充矿物质，5低GI

    public Food(){}

    public Food(int id,String foodname,double price,String img,double carbohydrate,double fat,double protein,double calories,int businessid,String description,int nutritype){
        this.id = id;
        this.foodname = foodname;
        this.price = price;
        this.img = img;
        this.carbohydrate = carbohydrate;
        this.fat = fat;
        this.protein = protein;
        this.calories = calories;
        this.businessid = businessid;
        this.description = description;
        this.nutritype = nutritype;

    }
}
