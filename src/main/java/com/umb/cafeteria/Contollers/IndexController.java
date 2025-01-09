package com.umb.cafeteria.Contollers;

import com.umb.cafeteria.Entity.*;
import com.umb.cafeteria.Service.ICatEstatusProdService;
import com.umb.cafeteria.Service.ICatTipoProdService;
import com.umb.cafeteria.Service.IProductoService;
import com.umb.cafeteria.Service.IUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/private")
public class IndexController {

    @Autowired
    private IUsuarioService usuarioService;

    @Autowired
    private IProductoService productoService;

    @Autowired
    private ICatTipoProdService catTipoService;

    @Autowired
    private ICatEstatusProdService catEstProdService;

//Este es mi pantalla index una vez despues de que el usuario se registro con exito
    @GetMapping("/index")
    public String index(Authentication auth, HttpSession session, Model model) {
        String usercorreo = auth.getName();
        Usuario usuario;
        if (session.getAttribute("usuario") == null) {
            usuario = usuarioService.findByCorreo(usercorreo);
            usuario.setContrasena(null);
            session.setAttribute("usuario", usuario);
        } else {
            usuario = (Usuario) session.getAttribute("usuario");
        }

        model.addAttribute("estProd", catEstProdService.findAll());
        model.addAttribute("tipoProd", catTipoService.findAll());
        model.addAttribute("productosGenerales", productoService.findAll());
        model.addAttribute("prodBebidas", productoService.findByProdTipo(new CatTipoProd(1)));
        model.addAttribute("prodComida", productoService.findByProdTipo(new CatTipoProd(3)));

        return "index";
    }

}
