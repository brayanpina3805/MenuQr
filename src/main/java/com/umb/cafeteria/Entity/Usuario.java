package com.umb.cafeteria.Entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "usuario")
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "usu_id")
    private Integer usuId;

    @ManyToOne
    @JoinColumn(name = "usu_tipo")
    private CatTipoUsu usuTipo;

    @ManyToOne
    @JoinColumn(name = "usu_est")
    private CatEstatusUsu usuEst;

    private String nombre;

    private String correo;

    private String contrasena;

    public Usuario(Integer usuId, CatTipoUsu usuTipo, CatEstatusUsu usuEst, String nombre, String correo, String contrasena) {
        this.usuId = usuId;
        this.usuTipo = usuTipo;
        this.usuEst = usuEst;
        this.nombre = nombre;
        this.correo = correo;
        this.contrasena = contrasena;
    }

    public Usuario() {

    }

    public Usuario(Integer usuId) {
        this.usuId = usuId;
    }

    public Integer getUsuId() {
        return usuId;
    }

    public void setUsuId(Integer usuId) {
        this.usuId = usuId;
    }

    public CatTipoUsu getUsuTipo() {
        return usuTipo;
    }

    public void setUsuTipo(CatTipoUsu usuTipo) {
        this.usuTipo = usuTipo;
    }

    public CatEstatusUsu getUsuEst() {
        return usuEst;
    }

    public void setUsuEst(CatEstatusUsu usuEst) {
        this.usuEst = usuEst;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
}
