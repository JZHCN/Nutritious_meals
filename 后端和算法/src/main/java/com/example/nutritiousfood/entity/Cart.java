package com.example.nutritiousfood.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
public class Cart implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private int userid;

    @Column
    private int foodid;

    @Column
    private int quantity;

    @Column
    private int businessid;

    @Column
    private int type;//支付之后修改状态


}
