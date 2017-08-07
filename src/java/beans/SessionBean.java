/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.ejb.Stateful;


/**
 *
 * @author itzelmosso
 */
@Stateful
public class SessionBean {
    
    
int idCuidador = 100;


    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public int getIdCuidador() {
        return idCuidador;
    }

    public void setIdCuidador(int idCuidador) {
        this.idCuidador = idCuidador;
    }
}
