package com.example.nutritiousfood.entity;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Data
public class Comment implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private int userid;

    @Column
    private int foodid;

    @Column
    private String commenttext;

    @Column
    private int starsnum;

    @Column
    @CreatedDate
    private LocalDateTime commenttime;
}
