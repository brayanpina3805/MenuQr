/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umb.cafeteria.Service;

import com.umb.cafeteria.Entity.CatTipoProd;
import com.umb.cafeteria.Entity.Producto;
import java.util.List;

/**
 *
 * @author Brayan
 */
public interface IProductoService {

    public List<Producto> findAll();

    public List<Producto> findByProdTipo(CatTipoProd id);

    public Producto registrar(Producto p);

    public Producto actualizar(Producto p);

    public void eliminarProd(int id);

    public Producto findByNombre(String nombre);

    public Producto findByIdProd(int id);

}
