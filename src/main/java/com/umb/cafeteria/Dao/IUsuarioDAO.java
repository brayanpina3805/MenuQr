package com.umb.cafeteria.Dao;

import com.umb.cafeteria.Entity.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUsuarioDAO extends JpaRepository<Usuario, Integer> {

    public Usuario findByCorreo(String correo);

    public Usuario findByNombre(String nombre);

    public Usuario findByUsuId(int id);

    public List<Usuario> findAll();

    public void deleteByUsuId(Long id);

}
