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
@Table(name = "cat_est_prod")
public class CatEstatusProd implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cat_est_id")
    private Integer catEstId;

    private String descripcion;

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
