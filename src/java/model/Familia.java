package model;

public class Familia {
    int id;
    String relacionFamiliar, tipoFamilia, ciclo, observacion;
    String[] problemasOrigen, problemasConyugales;

    public Familia() {
    }
    
    public Familia(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getRelacionFamiliar() {
        return relacionFamiliar;
    }

    public void setRelacionFamiliar(String relacionFamiliar) {
        this.relacionFamiliar = relacionFamiliar;
    }

    public String getTipoFamilia() {
        return tipoFamilia;
    }

    public void setTipoFamilia(String tipoFamilia) {
        this.tipoFamilia = tipoFamilia;
    }

    public String getCiclo() {
        return ciclo;
    }

    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String[] getProblemasOrigen() {
        return problemasOrigen;
    }

    public void setProblemasOrigen(String[] problemasOrigen) {
        this.problemasOrigen = problemasOrigen;
    }

    public String[] getProblemasConyugales() {
        return problemasConyugales;
    }

    public void setProblemasConyugales(String[] problemasConyugales) {
        this.problemasConyugales = problemasConyugales;
    }
    
}
