package com.umb.cafeteria.Contollers;

import com.umb.cafeteria.Entity.CatEstatusProd;
import com.umb.cafeteria.Entity.CatTipoProd;
import com.umb.cafeteria.Service.IProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QrController {

    @Autowired
    private IProductoService productoService;

    @GetMapping("/")
    public String inicio() {

        return "qr";
    }

    @GetMapping("/public/menu")
    public String menu(Model model) {

        model.addAttribute("prodBebidas", productoService.findByProdTipoAndProsEst(new CatTipoProd(1), new CatEstatusProd(1)));
        model.addAttribute("prodComida", productoService.findByProdTipoAndProsEst(new CatTipoProd(3), new CatEstatusProd(1)));
        return "menu";
    }

}
