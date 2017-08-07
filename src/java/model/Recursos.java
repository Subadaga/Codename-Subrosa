
package model;

public class Recursos {
    
    int id;
    boolean redFamiliar, redExtraFamiliar, redInstitucional;
    String observacion;

    public Recursos(int id) {
        this.id = id;
    }
    
    public Recursos() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isRedFamiliar() {
        return redFamiliar;
    }

    public void setRedFamiliar(boolean redFamiliar) {
        this.redFamiliar = redFamiliar;
    }

    public boolean isRedExtraFamiliar() {
        return redExtraFamiliar;
    }

    public void setRedExtraFamiliar(boolean redExtraFamiliar) {
        this.redExtraFamiliar = redExtraFamiliar;
    }

    public boolean isRedInstitucional() {
        return redInstitucional;
    }

    public void setRedInstitucional(boolean redInstitucional) {
        this.redInstitucional = redInstitucional;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }
    
    
    
}
