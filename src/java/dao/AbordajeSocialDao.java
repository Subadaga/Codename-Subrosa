package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AbordajeSocial;

public class AbordajeSocialDao {
    
    DbConnection conn;
    
    public AbordajeSocialDao(DbConnection conn){
        this.conn = conn;
    }
    
    public int insertIntoAbordaje(AbordajeSocial abordajeSocial){
        int id = 0;
        String sql = "INSERT INTO E_ABORDAJE VALUES (0, ?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, abordajeSocial.getObservacion());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){ 
                id = rs.getInt(1);
            } 
            return id;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(AbordajeSocialDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }     
    }
    
    public void update (int idValoracion, int id){
        String sql = "UPDATE VALORACION SET id_e_abordaje = " + id + " WHERE id = " + idValoracion;
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdAbordajeSocial (int idValoracion){
        int idAbordaje;
        try {
            String sql = "SELECT id_e_abordaje FROM VALORACION WHERE id = '" + idValoracion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idAbordaje = rs.getInt("id_e_abordaje");
        } catch (SQLException ex) {
            System.out.println("No hubo resultados : " + ex);
            idAbordaje = 0;
        }
        return idAbordaje;
    }
    
    public void insertIntoAbordajeAsesoria(int idTabla, String[] valores){
        for(String valor: valores){
            try {
                int idTablaDos = getIdAsesoria(valor);
                String sql = "INSERT INTO E_ABORDAJE_ASESORIA VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idTabla);
                ps.setInt(2, idTablaDos);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(AbordajeSocialDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int getIdAsesoria (String valor){
        int id;
        valor = valor.toLowerCase();
        try {
            String sql = "SELECT id FROM E_ASESORIA WHERE asesoria = '" + valor + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            id = rs.getInt("id");
        } catch (SQLException ex) {
            id = insertIntoAsesoria (valor);
        }
        return id;
    }
    
    public int insertIntoAsesoria(String valor){
        int id = 0;
        try {
            String sql = "INSERT INTO E_ASESORIA VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, valor);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                 id = rs.getInt(1);
            }
            return id;
        } catch (SQLException ex) {
            Logger.getLogger(AbordajeSocialDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    
    public void insertIntoAbordajeCita(int idTabla, String valor){
        try {
            int idTablaDos = getIdCita(valor);
            String sql = "INSERT INTO E_ABORDAJE_CITA VALUES (?,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, idTabla);
            ps.setInt(2, idTablaDos);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AbordajeSocialDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdCita (String valor){
        int id;
        valor = valor.toLowerCase();
        try {
            String sql = "SELECT id FROM E_CITA WHERE cita = '" + valor + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            id = rs.getInt("id");
        } catch (SQLException ex) {
            id = insertIntoCita (valor);
        }
        return id;
    }
    
    public int insertIntoCita(String valor){
        int id = 0;
        try {
            String sql = "INSERT INTO E_CITA VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, valor);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                 id = rs.getInt(1);
            }
            return id;
        } catch (SQLException ex) {
            Logger.getLogger(AbordajeSocialDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public AbordajeSocial getAbordajeSocial (int id){
        try {
            String sql = "SELECT E_ABORDAJE.* FROM E_ABORDAJE, VALORACION WHERE VALORACION.id_e_abordaje = E_ABORDAJE.id && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            AbordajeSocial abordaje = new AbordajeSocial(rs.getInt("id"));
            abordaje.setObservacion(rs.getString("observacion"));
            return abordaje;
        } catch (SQLException ex) {
            System.out.println("Error en query .getAbordajeSocial - " + ex);
            return null;
        }
    }
    
    public List<String> getAsesoria (int id){
        try {
            String sql = "SELECT E_ASESORIA.asesoria FROM E_ASESORIA, E_ABORDAJE_ASESORIA, VALORACION  WHERE E_ABORDAJE_ASESORIA.id_asesoria = E_ASESORIA.id && E_ABORDAJE_ASESORIA.id_abordaje = VALORACION.id_e_abordaje && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<String> citas = new LinkedList<>();
            while(rs.next()){
                citas.add(rs.getString("E_ASESORIA.asesoria"));
            }
            return citas;
        } catch (SQLException ex) {
            System.out.println("Error en query .getAbordajes - " + ex);
            return null;
        }
    }
    
    public String getCita (int id){
        try {
            String sql = "SELECT E_CITA.cita FROM E_CITA, E_ABORDAJE_CITA, VALORACION  WHERE E_ABORDAJE_CITA.id_cita = E_CITA.id && E_ABORDAJE_CITA.id_abordaje = VALORACION.id_e_abordaje && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getString("E_CITA.cita");
            
        } catch (SQLException ex) {
            System.out.println("Error en query .getAbordajes - " + ex);
            return null;
        }
    }
    
}