/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author schna
 */
@Entity
@Table(name = "municipios")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Municipios.findAll", query = "SELECT m FROM Municipios m")
    , @NamedQuery(name = "Municipios.findByIdMunicipio", query = "SELECT m FROM Municipios m WHERE m.municipiosPK.idMunicipio = :idMunicipio")
    , @NamedQuery(name = "Municipios.findByIdEstado", query = "SELECT m FROM Municipios m WHERE m.municipiosPK.idEstado = :idEstado")
    , @NamedQuery(name = "Municipios.findByNombreMunicipio", query = "SELECT m FROM Municipios m WHERE m.nombreMunicipio = :nombreMunicipio")})
public class Municipios implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected MunicipiosPK municipiosPK;
    @Size(max = 255)
    @Column(name = "nombre_municipio")
    private String nombreMunicipio;

    public Municipios() {
    }

    public Municipios(MunicipiosPK municipiosPK) {
        this.municipiosPK = municipiosPK;
    }

    public Municipios(int idMunicipio, int idEstado) {
        this.municipiosPK = new MunicipiosPK(idMunicipio, idEstado);
    }

    public MunicipiosPK getMunicipiosPK() {
        return municipiosPK;
    }

    public void setMunicipiosPK(MunicipiosPK municipiosPK) {
        this.municipiosPK = municipiosPK;
    }

    public String getNombreMunicipio() {
        return nombreMunicipio;
    }

    public void setNombreMunicipio(String nombreMunicipio) {
        this.nombreMunicipio = nombreMunicipio;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (municipiosPK != null ? municipiosPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Municipios)) {
            return false;
        }
        Municipios other = (Municipios) object;
        if ((this.municipiosPK == null && other.municipiosPK != null) || (this.municipiosPK != null && !this.municipiosPK.equals(other.municipiosPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Municipios[ municipiosPK=" + municipiosPK + " ]";
    }
    
}
