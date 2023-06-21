package com.example.nutritiousfood.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
public class Collection implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private int userid;

    @Column
    private int foodid;

//    @Column
//    private int deletemark;//0未删除，1已删除
}
