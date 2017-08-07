package model;

public class TratamientoFarmocologico {
    int id;
    String observacion;
    String[] medicinas, administradores, compradores, transportes;

    public TratamientoFarmocologico(int id) {
        this.id = id;
    }
    
    public TratamientoFarmocologico() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }
    
    public String[] getMedicinas() {
        return medicinas;
    }

    public void setMedicinas(String[] medicinas) {
        this.medicinas = medicinas;
    }

    public String[] getAdministradores() {
        return administradores;
    }

    public void setAdministradores(String[] administradores) {
        this.administradores = administradores;
    }

    public String[] getCompradores() {
        return compradores;
    }

    public void setCompradores(String[] compradores) {
        this.compradores = compradores;
    }

    public String[] getTransportes() {
        return transportes;
    }

    public void setTransportes(String[] transportes) {
        this.transportes = transportes;
    }
    
}
