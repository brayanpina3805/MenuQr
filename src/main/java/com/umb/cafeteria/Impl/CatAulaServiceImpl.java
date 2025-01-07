package com.umb.cafeteria.Impl;


import com.umb.cafeteria.Dao.ICatAulaDAO;
import com.umb.cafeteria.Entity.CatAula;
import com.umb.cafeteria.Service.ICatAulaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CatAulaServiceImpl implements ICatAulaService {

    @Autowired
    private ICatAulaDAO catAulaDAO;

    @Override
    public List<CatAula> findAll() {
        return catAulaDAO.findAll();
    }
}
