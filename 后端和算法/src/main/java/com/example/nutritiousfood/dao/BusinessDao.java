package com.example.nutritiousfood.dao;

import com.example.nutritiousfood.entity.Business;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BusinessDao extends JpaRepository<Business,Integer> {

    @Override
    List<Business> findAll();

    Business findById(int id);

    List<Business> findByBusinessnameLike(String businessname);
}
