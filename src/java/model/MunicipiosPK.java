/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author schna
 */
@Embeddable
public class MunicipiosPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "id_municipio")
    private int idMunicipio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_estado")
    private int idEstado;

    public MunicipiosPK() {
    }

    public MunicipiosPK(int idMunicipio, int idEstado) {
        this.idMunicipio = idMunicipio;
        this.idEstado = idEstado;
    }

    public int getIdMunicipio() {
        return idMunicipio;
    }

    public void setIdMunicipio(int idMunicipio) {
        this.idMunicipio = idMunicipio;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idMunicipio;
        hash += (int) idEstado;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MunicipiosPK)) {
            return false;
        }
        MunicipiosPK other = (MunicipiosPK) object;
        if (this.idMunicipio != other.idMunicipio) {
            return false;
        }
        if (this.idEstado != other.idEstado) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.MunicipiosPK[ idMunicipio=" + idMunicipio + ", idEstado=" + idEstado + " ]";
    }
    
}
