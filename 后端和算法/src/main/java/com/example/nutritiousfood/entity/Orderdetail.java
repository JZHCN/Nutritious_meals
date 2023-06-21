package com.example.nutritiousfood.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
public class Orderdetail implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private int orderid;

    @Column
    private int userid;

    @Column
    private int foodid;

    @Column
    private int quantity;

    @Column
    private int businessid;

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
    private String description;

    @Column
    private int nutritype;

    public Orderdetail(){}

    //无法解析构造函数 'com.example.nutritiousfood.entity.Orderdetail(int, int, int, int, int,
    // java.lang.String, double, java.lang.String, double, double, double, double, int, java.lang.String, int)'
    public Orderdetail(int id, int orderid, int userid, int foodid, int quantity, int businessid,
                       String foodname, double price, String img, double carbohydrate,
                       double fat, double protein, double calories,
                       String description, int nutritype){
        this.id = id;
        this.orderid = orderid;
        this.userid = userid;
        this.foodid = foodid;
        this.quantity = quantity;
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
