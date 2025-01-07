package com.umb.cafeteria.Impl;

import com.umb.cafeteria.Dao.IUsuarioDAO;
import com.umb.cafeteria.Entity.Usuario;
import com.umb.cafeteria.Service.IUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioServiceImpl implements IUsuarioService {
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;


    @Autowired
    private IUsuarioDAO usuarioDAO;

    @Override
    public Usuario findByCorreo(String correo) {
        return usuarioDAO.findByCorreo(correo);
    }

    @Override
    public Usuario findByNombre(String nombre) {
        return usuarioDAO.findByNombre(nombre);
    }

    @Override
    public Usuario findByUsuId(int id) {
        return usuarioDAO.findByUsuId(id);
    }

    @Override
    public Usuario registrar(Usuario u) {
        u.setContrasena(passwordEncoder.encode(u.getContrasena()));
        return usuarioDAO.save(u);
    }

    @Override
    public List<Usuario> findAll() {
        return usuarioDAO.findAll();
    }

    @Override
    public void eliminarUsuario(Long id) {
        usuarioDAO.deleteByUsuId(id);
    }

    @Override
    public Usuario actualizarUsuario(Usuario u) {
        return usuarioDAO.save(u);
    }


}
