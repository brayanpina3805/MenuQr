package com.umb.cafeteria.Contollers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InicioController {

    @GetMapping("/")
    public String inicio() {

        return "login";
    }

    @GetMapping("public/index")
    public String index() {
        return "login";
    }

}
