package com.umb.cafeteria.Entity;


import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "cat_aula")
public class CatAula implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cat_aula_id")
    private Integer catAulaId;

    private Integer numero;

    private String descripcion;

    public CatAula() {
    }

    public CatAula(Integer catAulaId) {
        this.catAulaId = catAulaId;
    }

    public Integer getCatAulaId() {
        return catAulaId;
    }

    public void setCatAulaId(Integer catAulaId) {
        this.catAulaId = catAulaId;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
