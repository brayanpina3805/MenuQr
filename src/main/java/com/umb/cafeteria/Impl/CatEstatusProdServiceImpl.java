
package com.umb.cafeteria.Impl;

import com.umb.cafeteria.Dao.ICatEstatusProdDAO;
import com.umb.cafeteria.Entity.CatEstatusProd;
import com.umb.cafeteria.Service.ICatEstatusProdService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Brayan
 */
@Service
public class CatEstatusProdServiceImpl implements ICatEstatusProdService {

    @Autowired
    private ICatEstatusProdDAO estPrdoDao;

    @Override
    public List<CatEstatusProd> findAll() {
        return estPrdoDao.findAll();
    }

}
