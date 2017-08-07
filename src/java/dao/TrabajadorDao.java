package dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Trabajador;
import security.Hash;

@Stateless
public class TrabajadorDao {
    
    @PersistenceContext
    EntityManager entityManager;
    
    public TrabajadorDao(){
    }
    
    public boolean login(String username, String password) throws Exception{
        
        String passwordHashed = Hash.hash(password);
        String trabajadorPassword = getTrabajador(username).getPassword();
               
        if(trabajadorPassword.equals(passwordHashed)){
            return true;
        }else{
            return false;
        }
    }
    
    public Trabajador getTrabajador(String usuario) throws Exception{       
        try{
                Query queryTrabajador = entityManager.createNamedQuery("Trabajador.findByUsuario", Trabajador.class);
                queryTrabajador.setParameter("usuario", usuario);
                return (Trabajador)queryTrabajador.getSingleResult();
        }catch(Exception e){
            return null;
        }
    }
    
    public void insertTrabajador(Trabajador trabajador){  
        entityManager.persist(trabajador);
    }
    
    public void removeTrabajador(Trabajador trabajador){
        if(!entityManager.contains(trabajador)){
            trabajador = entityManager.merge(trabajador);
        }
        
        entityManager.remove(trabajador);
    }
    
    
    
}
