package com.umb.cafeteria.Entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "cat_estatus_usu")
public class CatEstatusUsu implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cat_est_id")
    private Integer catEstId;

    private String descripcion;

    public CatEstatusUsu() {

    }

    public CatEstatusUsu(Integer catEstId) {
        this.catEstId = catEstId;
    }

    public Integer getCatEstId() {
        return catEstId;
    }

    public void setCatEstId(Integer catEstId) {
        this.catEstId = catEstId;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
