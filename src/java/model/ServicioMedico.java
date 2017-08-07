
package model;

public class ServicioMedico {
    
    int id;
    String[] derechohabientes;
    boolean seguroGastosMedico;
    String obervacion;

    public ServicioMedico(int id) {
        this.id = id;
    }

    public ServicioMedico() {
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String[] getDerechohabientes() {
        return derechohabientes;
    }

    public void setDerechohabientes(String[] derechohabientes) {
        this.derechohabientes = derechohabientes;
    }

    public boolean isSeguroGastosMedico() {
        return seguroGastosMedico;
    }

    public void setSeguroGastosMedico(boolean seguroGastosMedico) {
        this.seguroGastosMedico = seguroGastosMedico;
    }

    public String getObervacion() {
        return obervacion;
    }

    public void setObervacion(String obervacion) {
        this.obervacion = obervacion;
    }
    
    
    
}
