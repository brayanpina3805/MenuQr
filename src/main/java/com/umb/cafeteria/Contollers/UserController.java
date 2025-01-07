package com.umb.cafeteria.Contollers;

import com.umb.cafeteria.Entity.CatAula;
import com.umb.cafeteria.Entity.CatEstatusUsu;
import com.umb.cafeteria.Entity.CatTipoUsu;
import com.umb.cafeteria.Entity.Usuario;
import com.umb.cafeteria.Service.IUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/private")
public class UserController {

    @Autowired
    private IUsuarioService usuarioService;

    @GetMapping("/eliminarUser")
    public String eliminarUser(@RequestParam("usuId") String usuId, RedirectAttributes redirectAttributes) {
        try {
            Usuario usuario = usuarioService.findByUsuId(Integer.parseInt(usuId));
            usuario.setUsuEst(new CatEstatusUsu(2));//Usuario Inactivo
            usuarioService.actualizarUsuario(usuario);
            redirectAttributes.addFlashAttribute("alertaExito", "El Usuario con clave " + usuId + " a cambiado su estatus a Inactivo!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("alerta", "Algo salio mal!");
            e.printStackTrace();
        }
        return "redirect:/private/administrar";
    }

    @PostMapping("/actualizarUsuario")
    @ResponseBody
    public ResponseEntity<?> upUser(
            @RequestParam int usuId,
            @RequestParam String nombre,
            @RequestParam String correo,
            @RequestParam int usuTipo,
            @RequestParam int usuEst,
            @RequestParam int usuAula) {

        Map<String, Object> response = new HashMap<>();

        Usuario usuario = usuarioService.findByUsuId(usuId);
        usuario.setNombre(nombre);
        usuario.setCorreo(correo);
        usuario.setUsuAula(new CatAula(usuAula));
        usuario.setUsuTipo(new CatTipoUsu(usuTipo));
        usuario.setUsuEst(new CatEstatusUsu(usuEst));
        usuarioService.actualizarUsuario(usuario);

        response.put("mensaje", "El Usuario con la clave " + usuId + " se actualizo correctamente.");
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
