package com.umb.cafeteria.Entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "cat_tipo_usu")
public class CatTipoUsu implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cat_usu_id")
    private Integer catUsuId;

    private String descripcion;

    public CatTipoUsu() {
    }

    public CatTipoUsu(Integer catUsuId) {
        this.catUsuId = catUsuId;
    }

    public Integer getCatUsuId() {
        return catUsuId;
    }

    public void setCatUsuId(Integer catUsuId) {
        this.catUsuId = catUsuId;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
