package com.umb.cafeteria.Impl;

import com.umb.cafeteria.Dao.ICatTipoProdDAO;
import com.umb.cafeteria.Entity.CatTipoProd;
import com.umb.cafeteria.Service.ICatTipoProdService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Brayan
 */
@Service
public class CatTipoProdServiceImpl implements ICatTipoProdService {

    @Autowired
    private ICatTipoProdDAO tipoProd;

    @Override
    public List<CatTipoProd> findAll() {
        return tipoProd.findAll();
    }

}
