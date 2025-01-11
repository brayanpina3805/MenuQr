package com.umb.cafeteria.Contollers;

import com.umb.cafeteria.Entity.*;
import com.umb.cafeteria.Service.ICatEstatusProdService;
import com.umb.cafeteria.Service.ICatTipoProdService;
import com.umb.cafeteria.Service.IProductoService;
import com.umb.cafeteria.Service.IUsuarioService;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    @PostMapping("/agregar")
    public ResponseEntity<Map<String, String>> agregarProducto(
            @RequestParam("nombre") String nombre,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("precio") float precio,
            @RequestParam("tipoId") int tipoId,
            @RequestParam("estadoId") int estadoId) {

        Map<String, String> response = new HashMap<>();

        if (productoService.findByNombre(nombre) != null) {
            response.put("mensaje", "Ya existe un producto con el mismo nombre");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        } else {
            Producto nuevoProducto = new Producto();
            nuevoProducto.setNombre(nombre);
            nuevoProducto.setDescripcion(descripcion);
            nuevoProducto.setPrecio(precio);
            nuevoProducto.setProdTipo(new CatTipoProd(tipoId));
            nuevoProducto.setProsEst(new CatEstatusProd(estadoId));
            productoService.registrar(nuevoProducto);

            response.put("mensaje", "Producto agregado correctamente");
            return ResponseEntity.ok(response);
        }
    }

    @GetMapping("/obtenerProducto/{id}")
    @ResponseBody
    public Producto obtenerProducto(@PathVariable("id") int id) {
        Producto producto = productoService.findByIdProd(id); // Busca el producto en la base de datos
        return producto; // Devolver el producto como respuesta JSON
    }

    @PostMapping("/actualizarProducto")
    @ResponseBody
    public ResponseEntity<Map<String, String>> actualizarProducto(@RequestParam("idProd") int id,
            @RequestParam("nombre") String nombre,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("precio") float precio,
            @RequestParam("tipoId") int tipoId,
            @RequestParam("estadoId") int estadoId) {
        Map<String, String> response = new HashMap<>();
        try {
            // Actualizar el producto en la base de datos
            Producto producto = productoService.findByIdProd(id);
            if (producto != null) {
                producto.setNombre(nombre);
                producto.setDescripcion(descripcion);
                producto.setPrecio(precio);
                producto.setProdTipo(new CatTipoProd(tipoId));
                producto.setProsEst(new CatEstatusProd(estadoId));

                productoService.registrar(producto);

                response.put("mensaje", "Producto actualizado correctamente");
            } else {
                response.put("mensaje", "Producto no encontrado.");
            }
        } catch (Exception e) {
            response.put("mensaje", "Ocurrió un error al actualizar el producto.");
        }

        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/private/eliminarProducto/{id}")
    public ResponseEntity<Map<String, String>> eliminarProducto(@PathVariable("id") int id) {
        Map<String, String> response = new HashMap<>();
        try {
            productoService.eliminarProd(id); // Lógica para eliminar el producto
            response.put("mensaje", "Producto eliminado correctamente");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("mensaje", "Error al eliminar el producto: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

}
