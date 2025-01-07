package com.umb.cafeteria.Dao;

import com.umb.cafeteria.Entity.CatEstatusUsu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICatEstatusUsuDAO extends JpaRepository<CatEstatusUsu, Integer> {
    public List<CatEstatusUsu> findAll();
}
