package com.umb.cafeteria.Contollers;

import com.umb.cafeteria.Entity.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InicioController {

    @GetMapping("public/index")
    public String index() {
        return "login";
    }

    @GetMapping("/auth/login")
    public String login(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "login";
    }
}
