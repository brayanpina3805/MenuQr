package com.umb.cafeteria.Entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

/**
 *
 * @author Brayan
 */
@Entity
@Data
@Table(name = "cat_tipo_prod")
public class CatTipoProd implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cat_tipo_id")
    private Integer catTipoProd;

    private String descripcion;

    public CatTipoProd(Integer catTipoProd) {
        this.catTipoProd = catTipoProd;
    }

    public CatTipoProd() {
    }

    public Integer getCatTipoProd() {
        return catTipoProd;
    }

    public void setCatTipoProd(Integer catTipoProd) {
        this.catTipoProd = catTipoProd;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
