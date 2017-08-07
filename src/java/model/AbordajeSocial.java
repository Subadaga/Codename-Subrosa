
package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AbordajeSocial {
    
    int id;
    String[] abordajes;
    String cita, observacion;
    
    final String OLD_FORMAT = "dd/MM/yyyy";
    final String NEW_FORMAT = "yyyy/MM/dd";

    public AbordajeSocial(int id) {
        this.id = id;
    }

    public AbordajeSocial() {
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String[] getAbordajes() {
        return abordajes;
    }

    public void setAbordajes(String[] abordajes) {
        this.abordajes = abordajes;
    }

    public String getCita() {
        return cita;
    }

    public void setCita(String cita) {
        if(cita.length()>1){
            try {
                SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                Date d = sdf.parse(cita);
                sdf.applyPattern(NEW_FORMAT);
                cita = sdf.format(d);
                this.cita = cita;
            } catch (ParseException ex) {
                Logger.getLogger(Cuidador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        if(observacion.length()<2){
            observacion = "Abordaje sin observaciones.";
        }
        this.observacion = observacion;
    }
}
