
package model;

public class EvaluacionPaciente {
    int id;
    String[] auxiliares, actividades, diagnosticoMedico, sindromes;
    String dependencia, observacion;
    boolean perdidaPareja, perdidaFamiliar, perdidaAmistad, perdidaMascota, asisteInstitucionCultutral, asisteEstanciaDeDia;
    
    public EvaluacionPaciente(int id){
        this.id = id;
    }
    
    public EvaluacionPaciente(){
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String[] getAuxiliares() {
        return auxiliares;
    }

    public void setAuxiliares(String[] auxiliares) {
        this.auxiliares = auxiliares;
    }

    public String[] getActividades() {
        return actividades;
    }

    public void setActividades(String[] actividades) {
        this.actividades = actividades;
    }

    public String[] getDiagnosticoMedico() {
        return diagnosticoMedico;
    }

    public void setDiagnosticoMedico(String[] diagnosticoMedico) {
        this.diagnosticoMedico = diagnosticoMedico;
    }

    public String[] getSindromes() {
        return sindromes;
    }

    public void setSindromes(String[] sindromes) {
        this.sindromes = sindromes;
    }

    public String getDependencia() {
        return dependencia;
    }

    public void setDependencia(String dependencia) {
        this.dependencia = dependencia;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public boolean isPerdidaPareja() {
        return perdidaPareja;
    }

    public void setPerdidaPareja(boolean perdidaPareja) {
        this.perdidaPareja = perdidaPareja;
    }

    public boolean isPerdidaFamiliar() {
        return perdidaFamiliar;
    }

    public void setPerdidaFamiliar(boolean perdidaFamiliar) {
        this.perdidaFamiliar = perdidaFamiliar;
    }

    public boolean isPerdidaAmistad() {
        return perdidaAmistad;
    }

    public void setPerdidaAmistad(boolean perdidaAmistad) {
        this.perdidaAmistad = perdidaAmistad;
    }

    public boolean isPerdidaMascota() {
        return perdidaMascota;
    }

    public void setPerdidaMascota(boolean perdidaMascota) {
        this.perdidaMascota = perdidaMascota;
    }

    public boolean isAsisteInstitucionCultutral() {
        return asisteInstitucionCultutral;
    }

    public void setAsisteInstitucionCultutral(boolean asisteInstitucionCultutral) {
        this.asisteInstitucionCultutral = asisteInstitucionCultutral;
    }

    public boolean isAsisteEstanciaDeDia() {
        return asisteEstanciaDeDia;
    }

    public void setAsisteEstanciaDeDia(boolean asisteEstanciaDeDia) {
        this.asisteEstanciaDeDia = asisteEstanciaDeDia;
    }

    
}
