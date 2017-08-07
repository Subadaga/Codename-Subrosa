/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Amiga
 */
@Entity
@Table(name = "paciente")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Paciente.findAll", query = "SELECT p FROM Paciente p")
    , @NamedQuery(name = "Paciente.findByIdPaciente", query = "SELECT p FROM Paciente p WHERE p.idPaciente = :idPaciente")
    , @NamedQuery(name = "Paciente.findByNoCama", query = "SELECT p FROM Paciente p WHERE p.noCama = :noCama")
    , @NamedQuery(name = "Paciente.findByCodigoPostal", query = "SELECT p FROM Paciente p WHERE p.codigoPostal = :codigoPostal")
    , @NamedQuery(name = "Paciente.findByTelefonoCasa", query = "SELECT p FROM Paciente p WHERE p.telefonoCasa = :telefonoCasa")
    , @NamedQuery(name = "Paciente.findByTelefonoCel", query = "SELECT p FROM Paciente p WHERE p.telefonoCel = :telefonoCel")
    , @NamedQuery(name = "Paciente.findByFechaEvaluacion", query = "SELECT p FROM Paciente p WHERE p.fechaEvaluacion = :fechaEvaluacion")
    , @NamedQuery(name = "Paciente.findByFechaIngreso", query = "SELECT p FROM Paciente p WHERE p.fechaIngreso = :fechaIngreso")
    , @NamedQuery(name = "Paciente.findByConsultaExterna", query = "SELECT p FROM Paciente p WHERE p.consultaExterna = :consultaExterna")
    , @NamedQuery(name = "Paciente.findByNombre", query = "SELECT p FROM Paciente p WHERE p.nombre = :nombre")
    , @NamedQuery(name = "Paciente.findByApellidoPaterno", query = "SELECT p FROM Paciente p WHERE p.apellidoPaterno = :apellidoPaterno")
    , @NamedQuery(name = "Paciente.findByApellidoMaterno", query = "SELECT p FROM Paciente p WHERE p.apellidoMaterno = :apellidoMaterno")
    , @NamedQuery(name = "Paciente.findByFechaNacimiento", query = "SELECT p FROM Paciente p WHERE p.fechaNacimiento = :fechaNacimiento")
    , @NamedQuery(name = "Paciente.findByEstado", query = "SELECT p FROM Paciente p WHERE p.estado = :estado")
    , @NamedQuery(name = "Paciente.findByMunicipio", query = "SELECT p FROM Paciente p WHERE p.municipio = :municipio")
    , @NamedQuery(name = "Paciente.findByColonia", query = "SELECT p FROM Paciente p WHERE p.colonia = :colonia")
    , @NamedQuery(name = "Paciente.findByCalle", query = "SELECT p FROM Paciente p WHERE p.calle = :calle")
    , @NamedQuery(name = "Paciente.findByEstadoCivil", query = "SELECT p FROM Paciente p WHERE p.estadoCivil = :estadoCivil")
    , @NamedQuery(name = "Paciente.findByGenero", query = "SELECT p FROM Paciente p WHERE p.genero = :genero")
    , @NamedQuery(name = "Paciente.findBySexo", query = "SELECT p FROM Paciente p WHERE p.sexo = :sexo")
    , @NamedQuery(name = "Paciente.findByReligion", query = "SELECT p FROM Paciente p WHERE p.religion = :religion")
    , @NamedQuery(name = "Paciente.findByEntrevistaA", query = "SELECT p FROM Paciente p WHERE p.entrevistaA = :entrevistaA")})
public class Paciente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_paciente")
    private Integer idPaciente;
    @Column(name = "no_cama")
    private Integer noCama;
    @Size(max = 40)
    @Column(name = "codigo_postal")
    private String codigoPostal;
    @Size(max = 40)
    @Column(name = "telefono_casa")
    private String telefonoCasa;
    @Size(max = 40)
    @Column(name = "telefono_cel")
    private String telefonoCel;
    @Size(max = 15)
    @Column(name = "fecha_evaluacion")
    private String fechaEvaluacion;
    @Size(max = 45)
    @Column(name = "fecha_ingreso")
    private String fechaIngreso;
    @Size(max = 45)
    @Column(name = "consulta_externa")
    private String consultaExterna;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "nombre")
    private String nombre;
    @Size(max = 45)
    @Column(name = "apellido_paterno")
    private String apellidoPaterno;
    @Size(max = 45)
    @Column(name = "apellido_materno")
    private String apellidoMaterno;
    @Size(max = 45)
    @Column(name = "fecha_nacimiento")
    private String fechaNacimiento;
    @Size(max = 45)
    @Column(name = "estado")
    private String estado;
    @Size(max = 45)
    @Column(name = "municipio")
    private String municipio;
    @Size(max = 45)
    @Column(name = "colonia")
    private String colonia;
    @Size(max = 45)
    @Column(name = "calle")
    private String calle;
    @Size(max = 45)
    @Column(name = "estado_civil")
    private String estadoCivil;
    @Size(max = 45)
    @Column(name = "genero")
    private String genero;
    @Size(max = 45)
    @Column(name = "sexo")
    private String sexo;
    @Size(max = 45)
    @Column(name = "religion")
    private String religion;
    @Size(max = 45)
    @Column(name = "entrevista_a")
    private String entrevistaA;

    public Paciente() {
    }

    public Paciente(Integer idPaciente) {
        this.idPaciente = idPaciente;
    }

    public Paciente(Integer idPaciente, String nombre) {
        this.idPaciente = idPaciente;
        this.nombre = nombre;
    }

    public Integer getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Integer idPaciente) {
        this.idPaciente = idPaciente;
    }

    public Integer getNoCama() {
        return noCama;
    }

    public void setNoCama(Integer noCama) {
        this.noCama = noCama;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getTelefonoCasa() {
        return telefonoCasa;
    }

    public void setTelefonoCasa(String telefonoCasa) {
        this.telefonoCasa = telefonoCasa;
    }

    public String getTelefonoCel() {
        return telefonoCel;
    }

    public void setTelefonoCel(String telefonoCel) {
        this.telefonoCel = telefonoCel;
    }

    public String getFechaEvaluacion() {
        return fechaEvaluacion;
    }

    public void setFechaEvaluacion(String fechaEvaluacion) {
        this.fechaEvaluacion = fechaEvaluacion;
    }

    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getConsultaExterna() {
        return consultaExterna;
    }

    public void setConsultaExterna(String consultaExterna) {
        this.consultaExterna = consultaExterna;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getEntrevistaA() {
        return entrevistaA;
    }

    public void setEntrevistaA(String entrevistaA) {
        this.entrevistaA = entrevistaA;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPaciente != null ? idPaciente.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Paciente)) {
            return false;
        }
        Paciente other = (Paciente) object;
        if ((this.idPaciente == null && other.idPaciente != null) || (this.idPaciente != null && !this.idPaciente.equals(other.idPaciente))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Paciente[ idPaciente=" + idPaciente + " ]";
    }
    
}
