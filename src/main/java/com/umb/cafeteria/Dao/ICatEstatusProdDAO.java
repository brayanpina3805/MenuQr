/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.umb.cafeteria.Dao;

import com.umb.cafeteria.Entity.CatEstatusProd;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Brayan
 */
@Repository
public interface ICatEstatusProdDAO extends JpaRepository<CatEstatusProd, Integer> {

    public List<CatEstatusProd> findAll();
}
