
package model;

public class Maltrato {
    
    int id;
    boolean deteccionMaltrato;
    String observacion; 
    String[] clasificaciones, generadores;

    public Maltrato(int id) {
        this.id = id;
    }
    
    public Maltrato() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public boolean isDeteccionMaltrato() {
        return deteccionMaltrato;
    }

    public void setDeteccionMaltrato(boolean deteccionMaltrato) {
        this.deteccionMaltrato = deteccionMaltrato;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String[] getClasificaciones() {
        return clasificaciones;
    }

    public void setClasificaciones(String[] clasificaciones) {
        this.clasificaciones = clasificaciones;
    }

    public String[] getGeneradores() {
        return generadores;
    }

    public void setGeneradores(String[] generadores) {
        this.generadores = generadores;
    }
    
    
        
    
    
}