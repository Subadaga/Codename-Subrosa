package model;

public class Economia {
    int id;
    String situacionEconomica, observacion;
    String[] proveedores,instituciones;
    double ingresoPaciente, ingresoGobierno, ingresoHogar, ingresoNoHogar, ingresoOtro, ingresoTotal;

    public Economia(int id) {
        this.id = id;
    }
    
    public Economia() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getSituacionEconomica() {
        return situacionEconomica;
    }

    public void setSituacionEconomica(String situacionEconomica) {
        this.situacionEconomica = situacionEconomica;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String[] getProveedores() {
        return proveedores;
    }

    public void setProveedores(String[] proveedores) {
        this.proveedores = proveedores;
    }

    public String[] getInstituciones() {
        return instituciones;
    }

    public void setInstituciones(String[] instituciones) {
        this.instituciones = instituciones;
    }

    public double getIngresoPaciente() {
        return ingresoPaciente;
    }

    public void setIngresoPaciente(double ingresoPaciente) {
        this.ingresoPaciente = ingresoPaciente;
    }

    public double getIngresoGobierno() {
        return ingresoGobierno;
    }

    public void setIngresoGobierno(double ingresoGobierno) {
        this.ingresoGobierno = ingresoGobierno;
    }

    public double getIngresoHogar() {
        return ingresoHogar;
    }

    public void setIngresoHogar(double ingresoHogar) {
        this.ingresoHogar = ingresoHogar;
    }

    public double getIngresoNoHogar() {
        return ingresoNoHogar;
    }

    public void setIngresoNoHogar(double ingresoNoHogar) {
        this.ingresoNoHogar = ingresoNoHogar;
    }

    public double getIngresoOtro() {
        return ingresoOtro;
    }

    public void setIngresoOtro(double ingresoOtro) {
        this.ingresoOtro = ingresoOtro;
    }

    public double getIngresoTotal() {
        ingresoTotal = ingresoPaciente + ingresoGobierno + ingresoHogar + ingresoNoHogar + ingresoOtro;
        return ingresoTotal;
    }

    public void setIngresoTotal(double ingresoTotal) {
        this.ingresoTotal = ingresoTotal;
    }
    
}
