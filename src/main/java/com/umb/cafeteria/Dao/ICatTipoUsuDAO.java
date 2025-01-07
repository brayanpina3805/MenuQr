package com.umb.cafeteria.Dao;

import com.umb.cafeteria.Entity.CatTipoUsu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICatTipoUsuDAO extends JpaRepository<CatTipoUsu, Integer> {

    List<CatTipoUsu> findAll();
}
