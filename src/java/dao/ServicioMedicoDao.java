package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import model.ServicioMedico;

public class ServicioMedicoDao {
    DbConnection conn;
    
    public ServicioMedicoDao(DbConnection conn){
        this.conn = conn;
    }
    
    public int insertIntoServicioMedico (ServicioMedico servicio){
        int idServicioMedico = 0;
        String sql = "INSERT INTO E_SERVICIOMEDICO VALUES (0,?,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            ps.setBoolean(1, servicio.isSeguroGastosMedico());
            ps.setString(2, servicio.getObervacion());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){ 
                idServicioMedico = rs.getInt(1);
            } 
            return idServicioMedico;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(ServicioMedicoDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public void update (int idValoracion, int id){
        String sql = "UPDATE VALORACION SET id_e_servicio_medico = " + id + " WHERE id = " + idValoracion;
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdServicioMedico (int idValoracion){
        int idSerivicoMedico;
        try {
            String sql = "SELECT id_e_servicio_medico FROM VALORACION WHERE id = '" + idValoracion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idSerivicoMedico = rs.getInt("id_e_servicio_medico");
        } catch (SQLException ex) {
            System.out.println("No hubo resultados : " + ex);
            idSerivicoMedico = 0;
        }
        return idSerivicoMedico;
    }
    
    public int getIdDerechohabiente (String derechohabiente){
        int idDerechohabiente;
        try {
            String sql = "SELECT id FROM E_DERECHOHABIENTE WHERE derechohabiente = '" + derechohabiente + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idDerechohabiente = rs.getInt("id");
        } catch (SQLException ex) {
            idDerechohabiente = insertIntoDerechohabiente(derechohabiente);
        }
        return idDerechohabiente;
    }
    
    public int insertIntoPacienteDerechohabiente (String[] derechohabientes, int idServicioMedico){
        for(String derechohabiente: derechohabientes){
            int idDerechohabiente = getIdDerechohabiente(derechohabiente);
            String sql = "INSERT INTO E_SERVICIOMEDICO_DERECHOHABIENTE VALUES (?,?)";
            try {
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idServicioMedico);
                ps.setInt(2,idDerechohabiente);
                ps.executeUpdate();
            } catch (SQLException ex) {
                java.util.logging.Logger.getLogger(ServicioMedicoDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
    
    public int insertIntoDerechohabiente (String derechohabiente){
        int idDerechohabiente = 0;
        String sql = "INSERT INTO E_DERECHOHABIENTE VALUES (0,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, derechohabiente);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                idDerechohabiente = rs.getInt(1);
            }
            return idDerechohabiente;
        }catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public ServicioMedico getServicioMedico (int id){
        try {
            String sql = "SELECT E_SERVICIOMEDICO.* FROM E_SERVICIOMEDICO, VALORACION WHERE VALORACION.id_e_servicio_medico = E_SERVICIOMEDICO.id && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            ServicioMedico servicio_medico = new ServicioMedico(rs.getInt("id"));
            servicio_medico.setSeguroGastosMedico(rs.getBoolean("gastos_medicos"));
            servicio_medico.setObervacion(rs.getString("observacion"));
            return servicio_medico;
        } catch (SQLException ex) {
            System.out.println("Error en query .getServicioMedico - " + ex);
            return null;
        }
    }
    public List<String> getDerechoHabientes (int id){
        try {
            String sql = "SELECT E_DERECHOHABIENTE.derechohabiente FROM E_DERECHOHABIENTE, E_SERVICIOMEDICO_DERECHOHABIENTE, VALORACION  WHERE E_SERVICIOMEDICO_DERECHOHABIENTE.id_derechohabiente = E_DERECHOHABIENTE.id && E_SERVICIOMEDICO_DERECHOHABIENTE.id_servicio_medico = VALORACION.id_e_servicio_medico && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<String> derechohabientes = new LinkedList<>();
            while(rs.next()){
                derechohabientes.add(rs.getString("E_DERECHOHABIENTE.derechohabiente"));
            }
            return derechohabientes;
        } catch (SQLException ex) {
            System.out.println("Error en query .getDerechoHabientes - " + ex);
            return null;
        }
    }
}
