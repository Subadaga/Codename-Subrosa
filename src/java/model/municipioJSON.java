/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author schna
 */

// Esta clase funciona para adaptar el JSON que utilizará Select2, para los dropdowns de Paciente.jsp
public class municipioJSON {
    
    public int id;
    public String text;
    
    public municipioJSON(int id, String text){
    
        this.id = id;
        this.text = text;        
    }
    
}
