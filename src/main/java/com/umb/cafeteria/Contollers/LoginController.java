package com.umb.cafeteria.Contollers;

import com.umb.cafeteria.Entity.CatEstatusUsu;
import com.umb.cafeteria.Entity.CatTipoUsu;
import com.umb.cafeteria.Entity.Usuario;
import com.umb.cafeteria.Service.ICatAulaService;
import com.umb.cafeteria.Service.IUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

    @Autowired
    private IUsuarioService usuarioService;

    @Autowired
    private ICatAulaService catAulaService;

    @GetMapping("/auth/login")
    public String login(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "login";
    }

    @GetMapping("/auth/sign-up")
    public String registroForm(Model model) {
        model.addAttribute("usuario", new Usuario());
        model.addAttribute("aulas", catAulaService.findAll());
        return "sign-up";
    }


    //Este es el controlador del registro de usuarios
    @PostMapping("/auth/sign-up")
    public String registro(@ModelAttribute Usuario usuario, RedirectAttributes redirectAttributes) {

        if (usuarioService.findByCorreo(usuario.getCorreo()) != null) {
            redirectAttributes.addFlashAttribute("alerta", "El correo electrónico  ya se encuentra registrado.");
            return "redirect:/auth/sign-up";
        }

        if (usuarioService.findByNombre(usuario.getNombre()) != null) {
            redirectAttributes.addFlashAttribute("alerta", "El nombre de usuario ya se encuentra registrado.");
            return "redirect:/auth/sign-up";
        }


        redirectAttributes.addFlashAttribute("alertaExito", "Usuario registrado exitosamente.Por favor Inicia Sesion!");
        usuario.setUsuTipo(new CatTipoUsu(2));
        usuario.setUsuEst(new CatEstatusUsu(1));
        usuarioService.registrar(usuario);
        return "redirect:/auth/sign-up";
    }
}
