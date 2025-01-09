package com.umb.cafeteria.Dao;

import com.umb.cafeteria.Entity.CatTipoProd;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Brayan
 */
@Repository
public interface ICatTipoProdDAO extends JpaRepository< CatTipoProd, Integer> {

    public List<CatTipoProd> findAll();
}
