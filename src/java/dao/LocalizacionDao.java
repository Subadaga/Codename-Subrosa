/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Estados;
import model.Municipios;
/**
 *
 * @author schna
 */
@Stateless
public class LocalizacionDao {
    
    DbConnection conn;
    @PersistenceContext
    EntityManager entityManager;

    public LocalizacionDao() {
    }
    
    
    public List<Estados> getEstados(){
        Query queryEstados = entityManager.createNamedQuery("Estados.findAll", Estados.class);
        return queryEstados.getResultList();
        
        
        
    }
    
    public List<Municipios> getMunicipiosEstado(int idMunicipio){
        Query queryMunicipiosEstado = entityManager.createNamedQuery("Municipios.findByIdMunicipio", Municipios.class);
        queryMunicipiosEstado.setParameter("idMunicipio", idMunicipio);
        return queryMunicipiosEstado.getResultList();
    }
    
}
