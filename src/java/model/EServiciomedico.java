/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Amiga
 */
@Entity
@Table(name = "e_serviciomedico")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EServiciomedico.findAll", query = "SELECT e FROM EServiciomedico e")
    , @NamedQuery(name = "EServiciomedico.findById", query = "SELECT e FROM EServiciomedico e WHERE e.id = :id")
    , @NamedQuery(name = "EServiciomedico.findByGastosMedicos", query = "SELECT e FROM EServiciomedico e WHERE e.gastosMedicos = :gastosMedicos")})
public class EServiciomedico implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "gastos_medicos")
    private Boolean gastosMedicos;
    @Lob
    @Size(max = 65535)
    @Column(name = "observacion")
    private String observacion;
    @JoinTable(name = "e_serviciomedico_derechohabiente", joinColumns = {
        @JoinColumn(name = "id_servicio_medico", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "id_derechohabiente", referencedColumnName = "id")})
    @ManyToMany
    private Collection<EDerechohabiente> eDerechohabienteCollection;

    public EServiciomedico() {
    }

    public EServiciomedico(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getGastosMedicos() {
        return gastosMedicos;
    }

    public void setGastosMedicos(Boolean gastosMedicos) {
        this.gastosMedicos = gastosMedicos;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    @XmlTransient
    public Collection<EDerechohabiente> getEDerechohabienteCollection() {
        return eDerechohabienteCollection;
    }

    public void setEDerechohabienteCollection(Collection<EDerechohabiente> eDerechohabienteCollection) {
        this.eDerechohabienteCollection = eDerechohabienteCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EServiciomedico)) {
            return false;
        }
        EServiciomedico other = (EServiciomedico) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.EServiciomedico[ id=" + id + " ]";
    }
    
}
