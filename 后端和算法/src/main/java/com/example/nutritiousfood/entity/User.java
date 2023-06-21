package com.example.nutritiousfood.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private int id;

    @Column
    private String username;

    @Column
    private String phonenumber;

    @Column
    private String password;

    @Column
    private int type;
    //1学生，2教师，3工作人员
}
