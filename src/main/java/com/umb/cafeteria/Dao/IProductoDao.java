/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umb.cafeteria.Dao;

import com.umb.cafeteria.Entity.CatEstatusProd;
import com.umb.cafeteria.Entity.CatTipoProd;
import com.umb.cafeteria.Entity.Producto;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Brayan
 */
@Repository
public interface IProductoDao extends JpaRepository<Producto, Integer> {

    public List<Producto> findAll();

    public List<Producto> findByProdTipo(CatTipoProd id);

    public void deleteByIdProd(int id);

    public Producto findByNombre(String nombre);

    public Producto findByIdProd(int id);

    public List<Producto> findByProdTipoAndProsEst(CatTipoProd id, CatEstatusProd idE);

}
