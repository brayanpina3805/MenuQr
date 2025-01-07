package com.umb.cafeteria.Service;

import com.umb.cafeteria.Entity.Usuario;

import java.util.List;

public interface IUsuarioService {
    public Usuario findByCorreo(String correo);

    public Usuario findByNombre(String nombre);

    public Usuario findByUsuId(int id);

    public Usuario registrar(Usuario u);

    public List<Usuario> findAll();

    public void eliminarUsuario(Long id);

    public Usuario actualizarUsuario(Usuario u);
}
