package dao;

import model.Paciente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import security.AESCipher;

@Stateless
public class PacienteDao {
    
    @PersistenceContext
    EntityManager entityManager;   
    
    public PacienteDao(){
    }
    
    public Paciente getPaciente(String idPaciente) throws Exception{
        try{
            Query queryPaciente = entityManager.createNamedQuery("Paciente.findByIdPaciente", Paciente.class);
            queryPaciente.setParameter("idPaciente", idPaciente);
            return (Paciente)queryPaciente.getSingleResult();
        
        }catch(Exception e){
            return null;
        }
        
    }

    public void insertIntoPaciente(Paciente paciente) {
        entityManager.persist(paciente);
        
    }

    public void updatePaciente(Paciente paciente) {
       
    }

    public void deletePaciente(Paciente paciente) {
        if(!entityManager.contains(paciente)){
            paciente = entityManager.merge(paciente);
        }
        
        entityManager.remove(paciente);
    }

}
