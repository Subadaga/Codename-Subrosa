package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import model.EvaluacionPaciente;

public class EvaluacionPacienteDao {
    
    DbConnection conn;
    
    public EvaluacionPacienteDao(DbConnection conn){
        this.conn = conn;
    } 
    
    public int insertIntoPaciente (EvaluacionPaciente evaluacion){
        int newId = 0;
        String sql = "INSERT INTO E_PACIENTE VALUES (0,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            ps.setString(1, evaluacion.getDependencia());
            ps.setBoolean(2, evaluacion.isPerdidaPareja());
            ps.setBoolean(3, evaluacion.isPerdidaFamiliar());
            ps.setBoolean(4, evaluacion.isPerdidaAmistad());
            ps.setBoolean(5, evaluacion.isPerdidaMascota());
            ps.setBoolean(6, evaluacion.isAsisteInstitucionCultutral());
            ps.setBoolean(7, evaluacion.isAsisteEstanciaDeDia());
            ps.setString(8, evaluacion.getObservacion());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){ 
                newId = rs.getInt(1);
            } 
            return newId;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public void updatePaciente (int idValoracion, int idPaciente){
        String sql = "UPDATE VALORACION SET id_e_paciente = " + idPaciente + " WHERE id = " + idValoracion;
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdActividad (String actividad){
        actividad = actividad.toLowerCase();
        int idActividad;
        try {
            String sql = "SELECT id FROM E_ACTIVIDAD WHERE actividad = '" + actividad + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idActividad = rs.getInt("id");
        } catch (SQLException ex) {
            idActividad = insertIntoActividad(actividad);
        }
        return idActividad;
    }
    
    public int insertIntoPacienteActividad (String[] actividades, int idPaciente){
        for(String actividad: actividades){
            int idActividad = getIdActividad(actividad);
            String sql = "INSERT INTO E_PACIENTE_ACTIVIDAD VALUES (?,?)";
            try {
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idPaciente);
                ps.setInt(2,idActividad);
                ps.executeUpdate();
            } catch (SQLException ex) {
                java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
    
    public int insertIntoActividad (String actividad){
        int idActividad=0;
        String sql = "INSERT INTO E_ACTIVIDAD VALUES (0,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, actividad);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                idActividad = rs.getInt(1);
            }
            return idActividad;
        }catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public int getIdAuxiliar (String auxiliar){
        auxiliar = auxiliar.toLowerCase();
        int idAuxiliar;
        try {
            String sql = "SELECT id FROM E_AUXILIAR WHERE auxiliar = '" + auxiliar + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idAuxiliar = rs.getInt("id");
        } catch (SQLException ex) {
            idAuxiliar = insertIntoAuxiliar(auxiliar);
        }
        return idAuxiliar;
    }
    
    public int insertIntoPacienteAuxiliar (String[] auxiliares, int idPaciente){
        for(String auxiliar: auxiliares){
            int idAuxiliar = getIdAuxiliar(auxiliar);
            String sql = "INSERT INTO E_PACIENTE_AUXILIAR VALUES (?,?)";
            try {
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idPaciente);
                ps.setInt(2,idAuxiliar);
                ps.executeUpdate();
            } catch (SQLException ex) {
                java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
    
    public int insertIntoAuxiliar (String auxiliar){
        int idAuxiliar = 0;
        String sql = "INSERT INTO E_AUXILIAR VALUES (0,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, auxiliar);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                idAuxiliar = rs.getInt(1);
            }
            return idAuxiliar;
        }catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public int getIdDiagnosticoMedico (String diagnosticoMedico){
        diagnosticoMedico = diagnosticoMedico.toLowerCase();
        int idDiagnosticoMedico;
        try {
            String sql = "SELECT id FROM E_DIAGNOSTICOMEDICO WHERE diagnostico_medico = '" + diagnosticoMedico + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idDiagnosticoMedico = rs.getInt("id");
        } catch (SQLException ex) {
            idDiagnosticoMedico = insertIntoDiagnosticoMedico(diagnosticoMedico);
        }
        return idDiagnosticoMedico;
    }
    
    public int insertIntoPacienteDiagnosticoMedico (String[] diagnosticosMedico, int idPaciente){
        for(String diagnosticoMedico: diagnosticosMedico){
            int idDiagnosticoMedico = getIdDiagnosticoMedico(diagnosticoMedico);
            String sql = "INSERT INTO E_PACIENTE_DIAGNOSTICOMEDICO VALUES (?,?)";
            try {
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idPaciente);
                ps.setInt(2,idDiagnosticoMedico);
                ps.executeUpdate();
            } catch (SQLException ex) {
                java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
    
    public int insertIntoDiagnosticoMedico (String diagnosticoMedico){
        int idDiagnosticoMedico = 0;
        String sql = "INSERT INTO E_DIAGNOSTICOMEDICO VALUES (0,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, diagnosticoMedico);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                idDiagnosticoMedico = rs.getInt(1);
            }
            return idDiagnosticoMedico;
        }catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public int getIdSindrome (String sindrome){
        sindrome = sindrome.toLowerCase();
        int idSindrome;
        try {
            String sql = "SELECT id FROM E_SINDROME WHERE sindrome = '" + sindrome + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idSindrome = rs.getInt("id");
        } catch (SQLException ex) {
            idSindrome = insertIntoSindrome(sindrome);
        }
        return idSindrome;
    }
    
    public int insertIntoPacienteSindrome (String[] sindromes, int idPaciente){
        for(String sindrome: sindromes){
            int idSindrome = getIdSindrome(sindrome);
            String sql = "INSERT INTO E_PACIENTE_SINDROME VALUES (?,?)";
            try {
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idPaciente);
                ps.setInt(2,idSindrome);
                ps.executeUpdate();
            } catch (SQLException ex) {
                java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
    
    public int insertIntoSindrome (String sindrome){
        int idSindrome = 0;
        String sql = "INSERT INTO E_SINDROME VALUES (0,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, sindrome);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                idSindrome = rs.getInt(1);
            }
            return idSindrome;
        }catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public EvaluacionPaciente getEvaluacionPaciente (int id){
        try {
            String sql = "SELECT E_PACIENTE.* FROM E_PACIENTE, VALORACION WHERE VALORACION.id_e_paciente = E_PACIENTE.id && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            EvaluacionPaciente evaluacionPaciente = new EvaluacionPaciente(rs.getInt("id"));
            evaluacionPaciente.setAsisteEstanciaDeDia(rs.getBoolean("bol_asiste_estancia"));
            evaluacionPaciente.setAsisteInstitucionCultutral(rs.getBoolean("bol_asiste_institucion"));
            evaluacionPaciente.setPerdidaAmistad(rs.getBoolean("bol_perdida_amistad"));
            evaluacionPaciente.setPerdidaFamiliar(rs.getBoolean("bol_perdida_familiar"));
            evaluacionPaciente.setPerdidaMascota(rs.getBoolean("bol_perdida_mascota"));
            evaluacionPaciente.setPerdidaPareja(rs.getBoolean("bol_perdida_pareja"));
            evaluacionPaciente.setDependencia(rs.getString("txt_dependencia"));
            evaluacionPaciente.setObservacion(rs.getString("txt_observacion"));
            return evaluacionPaciente;
        } catch (SQLException ex) {
            System.out.println("Error en query .getEvaluacionPaciente - " + ex);
            return null;
        }
    }
    
    public List<String> getActividades (int id){
        try {
            String sql = "SELECT E_ACTIVIDAD.actividad FROM E_ACTIVIDAD, E_PACIENTE_ACTIVIDAD, VALORACION  WHERE E_PACIENTE_ACTIVIDAD.id_actividad = E_ACTIVIDAD.id && E_PACIENTE_ACTIVIDAD.id_paciente = VALORACION.id_e_paciente && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> actividades = new LinkedList<>();
            while(rs.next()){
                actividades.add(rs.getString("E_ACTIVIDAD.actividad"));
            }
            return actividades;
        } catch (SQLException ex) {
            System.out.println("Error en query .getActividades - " + ex);
            return null;
        }
    }
    
    public List<String> getAuxiliar (int id){
        try {
            String sql = "SELECT E_AUXILIAR.auxiliar FROM E_AUXILIAR, E_PACIENTE_AUXILIAR, VALORACION  WHERE E_PACIENTE_AUXILIAR.id_auxiliar = E_AUXILIAR.id && E_PACIENTE_AUXILIAR.id_paciente = VALORACION.id_e_paciente && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> auxiliares = new LinkedList<>();
            while(rs.next()){
                auxiliares.add(rs.getString("E_AUXILIAR.auxiliar"));
            }
            return auxiliares;
        } catch (SQLException ex) {
            System.out.println("Error en query .getAuxiliar - " + ex);
            return null;
        }
    }
    
    public List<String> getDiagnostico (int id){
        try {
            String sql = "SELECT E_DIAGNOSTICOMEDICO.diagnostico_medico FROM E_DIAGNOSTICOMEDICO, E_PACIENTE_DIAGNOSTICOMEDICO, VALORACION  WHERE E_PACIENTE_DIAGNOSTICOMEDICO.id_diagnostico_medico = E_DIAGNOSTICOMEDICO.id && E_PACIENTE_DIAGNOSTICOMEDICO.id_paciente = VALORACION.id_e_paciente && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> diagnosticos = new LinkedList<>();
            while(rs.next()){
                diagnosticos.add(rs.getString("E_DIAGNOSTICOMEDICO.diagnostico_medico"));
            }
            return diagnosticos;
        } catch (SQLException ex) {
            System.out.println("Error en query .getDiagnostico - " + ex);
            return null;
        }
    }
    
    public List<String> getSindrome (int id){
        try {
            String sql = "SELECT E_SINDROME.sindrome FROM E_SINDROME, E_PACIENTE_SINDROME, VALORACION  WHERE E_PACIENTE_SINDROME.id_sindrome = E_SINDROME.id && E_PACIENTE_SINDROME.id_paciente = VALORACION.id_e_paciente && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> sindromes = new LinkedList<>();
            while(rs.next()){
                sindromes.add(rs.getString("E_SINDROME.sindrome"));
            }
            return sindromes;
        } catch (SQLException ex) {
            System.out.println("Error en query .getSindrome - " + ex);
            return null;
        }
    }
    
}
