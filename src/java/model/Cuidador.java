
package model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Cuidador {
    int id, anio, mes;
    String nombre, nacimiento, ocupacion, telefonoUno, telefonoDos, correo, tiempoCuidando, parentesco, estadoCivil, escolaridad, escalaZarit, observacion;
    String[] funciones, conflictosGenerales;
    boolean viveConElPaciente;
    
    final String DISPLAY = "dd/MM/yyyy";
    final String DATABASE = "yyyy/MM/dd";

    public Cuidador(int id) {
        this.id = id;
    }
    
    public Cuidador(){
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(String nacimiento) {
        if(nacimiento.length()>1){
            try {
                SimpleDateFormat sdf = new SimpleDateFormat(DISPLAY);
                Date d = sdf.parse(nacimiento);
                sdf.applyPattern(DATABASE);
                nacimiento = sdf.format(d);
                this.nacimiento = nacimiento;
            } catch (ParseException ex) {
                Logger.getLogger(Cuidador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public void setNacimientoDisplay(String nacimiento) {
        if(nacimiento != null && nacimiento.length()>1){
            nacimiento = nacimiento.replace("-", "/");
            try {
                SimpleDateFormat sdf = new SimpleDateFormat(DATABASE);
                Date d = sdf.parse(nacimiento);
                sdf.applyPattern(DISPLAY);
                nacimiento = sdf.format(d);
                this.nacimiento = nacimiento;
            } catch (ParseException ex) {
                Logger.getLogger(Cuidador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public String getTelefonoUno() {
        return telefonoUno;
    }

    public void setTelefonoUno(String telefonoUno) {
        this.telefonoUno = telefonoUno;
    }

    public String getTelefonoDos() {
        return telefonoDos;
    }

    public void setTelefonoDos(String telefonoDos) {
        this.telefonoDos = telefonoDos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTiempoCuidando() {
        return tiempoCuidando;
    }

    public void setTiempoCuidando(String mes, String anio) {
        if(mes != null && anio != null){
            this.tiempoCuidando = anio + "/"+ mes + "/01";
        }
        else if(mes == null){
            this.tiempoCuidando = anio + "/01/01";
        }
        else{
            this.tiempoCuidando = null;
        }
    }
    
    public void setTiempoCuidandoDisplay(String tiempoCuidando){
        if(tiempoCuidando != null && tiempoCuidando.length()>1){
            tiempoCuidando = tiempoCuidando.replace("-", "/");
            try {
                SimpleDateFormat sdf = new SimpleDateFormat(DATABASE);
                Date d = sdf.parse(tiempoCuidando);
                sdf.applyPattern(DISPLAY);
                tiempoCuidando = sdf.format(d);
                this.tiempoCuidando = tiempoCuidando;
            } catch (ParseException ex) {
                Logger.getLogger(Cuidador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public String getParentesco() {
        return parentesco;
    }

    public void setParentesco(String parentesco) {
        this.parentesco = parentesco;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getEscolaridad() {
        return escolaridad;
    }

    public void setEscolaridad(String escolaridad) {
        this.escolaridad = escolaridad;
    }

    public String getEscalaZarit() {
        return escalaZarit;
    }

    public void setEscalaZarit(String escalaZarit) {
        this.escalaZarit = escalaZarit;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String[] getFunciones() {
        return funciones;
    }

    public void setFunciones(String[] funciones) {
        this.funciones = funciones;
    }

    public String[] getConflictosGenerales() {
        return conflictosGenerales;
    }

    public void setConflictosGenerales(String[] conflictosGenerales) {
        this.conflictosGenerales = conflictosGenerales;
    }

    public boolean isViveConElPaciente() {
        return viveConElPaciente;
    }

    public void setViveConElPaciente(boolean viveConElPaciente) {
        this.viveConElPaciente = viveConElPaciente;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAnio() {
        anio = Integer.parseInt(tiempoCuidando.substring(6));
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public int getMes() {
        mes = Integer.parseInt(tiempoCuidando.substring(3, 5));
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }
    
    
}
