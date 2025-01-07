package com.umb.cafeteria.Dao;

import com.umb.cafeteria.Entity.CatAula;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICatAulaDAO extends JpaRepository<CatAula,Integer> {
    public List<CatAula> findAll();

}
