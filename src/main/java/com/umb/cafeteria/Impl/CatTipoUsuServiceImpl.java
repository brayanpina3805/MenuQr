package com.umb.cafeteria.Impl;

import com.umb.cafeteria.Dao.ICatTipoUsuDAO;
import com.umb.cafeteria.Entity.CatTipoUsu;
import com.umb.cafeteria.Service.ICatTipoUsuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CatTipoUsuServiceImpl implements ICatTipoUsuService {
    @Autowired
    private ICatTipoUsuDAO catTipoUsuDAO;

    @Override
    public List<CatTipoUsu> findAll() {
        return catTipoUsuDAO.findAll();
    }
}
