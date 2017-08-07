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
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Amiga
 */
@Entity
@Table(name = "e_derechohabiente")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EDerechohabiente.findAll", query = "SELECT e FROM EDerechohabiente e")
    , @NamedQuery(name = "EDerechohabiente.findById", query = "SELECT e FROM EDerechohabiente e WHERE e.id = :id")
    , @NamedQuery(name = "EDerechohabiente.findByDerechohabiente", query = "SELECT e FROM EDerechohabiente e WHERE e.derechohabiente = :derechohabiente")})
public class EDerechohabiente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "derechohabiente")
    private String derechohabiente;
    @ManyToMany(mappedBy = "eDerechohabienteCollection")
    private Collection<EServiciomedico> eServiciomedicoCollection;

    public EDerechohabiente() {
    }

    public EDerechohabiente(Integer id) {
        this.id = id;
    }

    public EDerechohabiente(Integer id, String derechohabiente) {
        this.id = id;
        this.derechohabiente = derechohabiente;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDerechohabiente() {
        return derechohabiente;
    }

    public void setDerechohabiente(String derechohabiente) {
        this.derechohabiente = derechohabiente;
    }

    @XmlTransient
    public Collection<EServiciomedico> getEServiciomedicoCollection() {
        return eServiciomedicoCollection;
    }

    public void setEServiciomedicoCollection(Collection<EServiciomedico> eServiciomedicoCollection) {
        this.eServiciomedicoCollection = eServiciomedicoCollection;
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
        if (!(object instanceof EDerechohabiente)) {
            return false;
        }
        EDerechohabiente other = (EDerechohabiente) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.EDerechohabiente[ id=" + id + " ]";
    }
    
}
