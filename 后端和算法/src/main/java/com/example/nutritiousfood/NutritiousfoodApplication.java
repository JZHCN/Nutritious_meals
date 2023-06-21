package com.example.nutritiousfood;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;


@SpringBootApplication
public class NutritiousfoodApplication {

    public static void main(String[] args) {
        SpringApplication.run(NutritiousfoodApplication.class, args);
    }

}
