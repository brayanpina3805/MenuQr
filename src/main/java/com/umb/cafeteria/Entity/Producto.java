package com.umb.cafeteria.Entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Data;

/**
 *
 * @author Brayan
 */
@Entity
@Data
@Table(name = "producto")
public class Producto implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_prod")
    private Integer idProd;

    @ManyToOne
    @JoinColumn(name = "prod_est")
    private CatEstatusProd prosEst;

    @ManyToOne
    @JoinColumn(name = "prod_tipo")
    private CatTipoProd prodTipo;

    private String nombre;

    private String descripcion;

    private float precio;

    public Producto(CatEstatusProd prosEst, CatTipoProd prodTipo, String nombre, String descripcion, float precio) {
        this.prosEst = prosEst;
        this.prodTipo = prodTipo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
    }

    public Producto() {

    }

    //Getters and setters
    public Integer getIdProd() {
        return idProd;
    }

    public void setIdProd(Integer idProd) {
        this.idProd = idProd;
    }

    public CatEstatusProd getProsEst() {
        return prosEst;
    }

    public void setProsEst(CatEstatusProd prosEst) {
        this.prosEst = prosEst;
    }

    public CatTipoProd getProdTipo() {
        return prodTipo;
    }

    public void setProdTipo(CatTipoProd prodTipo) {
        this.prodTipo = prodTipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

}
