package com.umb.cafeteria.Impl;

import com.umb.cafeteria.Dao.ICatEstatusUsuDAO;
import com.umb.cafeteria.Entity.CatEstatusUsu;
import com.umb.cafeteria.Service.ICatEstatusUsuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CatEstatusUsuServiceImpl implements ICatEstatusUsuService {

    @Autowired
    private ICatEstatusUsuDAO catEstatusUsuDAO;

    @Override
    public List<CatEstatusUsu> findAll() {
        return catEstatusUsuDAO.findAll();
    }
}
