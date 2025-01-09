/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umb.cafeteria.Impl;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import com.umb.cafeteria.Dao.IProductoDao;
import com.umb.cafeteria.Entity.CatTipoProd;
import com.umb.cafeteria.Entity.Producto;
import com.umb.cafeteria.Service.IProductoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Brayan
 */
@Service
public class ProductoServiceImpl implements IProductoService {

    @Autowired
    private IProductoDao productoDao;

    @Override
    public List<Producto> findAll() {
        return productoDao.findAll();
    }

    @Override
    public List<Producto> findByProdTipo(CatTipoProd id) {
        return productoDao.findByProdTipo(id);
    }

    @Override
    public Producto registrar(Producto p) {
        return productoDao.save(p);
    }

    @Override
    public Producto actualizar(Producto p) {
        return productoDao.save(p);
    }

    @Override
    public void eliminarProd(int id) {
        productoDao.deleteByIdProd(id);
    }

}
