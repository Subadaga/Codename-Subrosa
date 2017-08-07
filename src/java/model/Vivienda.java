
package model;


public class Vivienda {
    int id;
    String[] companieros;
    String tenencia, tipo, zona, especificacion,planta, observacion;
    boolean dormitorio_compartido, acceso_banio, caidas, elevador, escaleras, alfombra, desniveles, pasamanos, obstaculos;

    public Vivienda(int id) {
        this.id = id;
    }

    public Vivienda() {
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getTenencia() {
        return tenencia;
    }

    public void setTenencia(String tenencia) {
        this.tenencia = tenencia;
    }

    public String[] getCompanieros() {
        return companieros;
    }

    public void setCompanieros(String[] companieros) {
        this.companieros = companieros;
    }

    public String getPlanta() {
        return planta;
    }

    public void setPlanta(String planta) {
        this.planta = planta;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }

    public String getEspecificacion() {
        return especificacion;
    }

    public void setEspecificacion(String especificacion) {
        this.especificacion = especificacion;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public boolean isDormitorio_compartido() {
        return dormitorio_compartido;
    }

    public void setDormitorio_compartido(boolean dormitorio_compartido) {
        this.dormitorio_compartido = dormitorio_compartido;
    }

    public boolean isAcceso_banio() {
        return acceso_banio;
    }

    public void setAcceso_banio(boolean acceso_banio) {
        this.acceso_banio = acceso_banio;
    }

    public boolean isCaidas() {
        return caidas;
    }

    public void setCaidas(boolean caidas) {
        this.caidas = caidas;
    }
    
    public boolean isElevador() {
        return elevador;
    }

    public void setElevador(boolean elevador) {
        this.elevador = elevador;
    }

    public boolean isEscaleras() {
        return escaleras;
    }

    public void setEscaleras(boolean escaleras) {
        this.escaleras = escaleras;
    }

    public boolean isAlfombra() {
        return alfombra;
    }

    public void setAlfombra(boolean alfombra) {
        this.alfombra = alfombra;
    }

    public boolean isDesniveles() {
        return desniveles;
    }

    public void setDesniveles(boolean desniveles) {
        this.desniveles = desniveles;
    }

    public boolean isPasamanos() {
        return pasamanos;
    }

    public void setPasamanos(boolean pasamanos) {
        this.pasamanos = pasamanos;
    }

    public boolean isObstaculos() {
        return obstaculos;
    }

    public void setObstaculos(boolean obstaculos) {
        this.obstaculos = obstaculos;
    }
    
    
}