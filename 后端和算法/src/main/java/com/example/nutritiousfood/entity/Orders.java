package com.example.nutritiousfood.entity;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data
public class Orders implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private int userid;

    @Column
    @CreatedDate
    private Timestamp ordertime;

    @Column
    private LocalDateTime pickuptimestart;

    @Column
    private LocalDateTime pickuptimeend;

    @Column
    private double totalprice;

    @Column
    private int type;

    @OneToMany
    @JoinColumn(name = "orderid")
    private List<Orderdetail> orderdetailList;
}
