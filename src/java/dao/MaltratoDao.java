package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Maltrato;

public class MaltratoDao {
    
    DbConnection conn;
    
    public MaltratoDao(DbConnection conn){
        this.conn = conn;
    }
    
    public int insertIntoMaltrato (Maltrato maltrato){
        int idMaltrato = 0;
        String sql = "INSERT INTO E_MALTRATO VALUES (0, ?, ?)";
        try{
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setBoolean(1, maltrato.isDeteccionMaltrato());
            ps.setString(2, maltrato.getObservacion());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){ 
                idMaltrato = rs.getInt(1);
            } 
            return idMaltrato;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CuidadorDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public void update (int idValoracion, int id){
        String sql = "UPDATE VALORACION SET id_e_maltrato = " + id + " WHERE id = " + idValoracion;
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdMaltrato (int idValoracion){
        int idMaltrato;
        try {
            String sql = "SELECT id_e_maltrato FROM VALORACION WHERE id = '" + idValoracion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idMaltrato = rs.getInt("id_e_maltrato");
        } catch (SQLException ex) {
            System.out.println("No hubo resultados : " + ex);
            idMaltrato = 0;
        }
        return idMaltrato;
    }
    
    public void insertIntoMaltratoClasificacion(int idTabla, String[] valores){
        for(String valor: valores){
            try {
                int idTablaDos = getIdClasificacion(valor);
                String sql = "INSERT INTO E_MALTRATO_MALTRATOCLASIFICACION VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idTabla);
                ps.setInt(2, idTablaDos);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(MaltratoDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int getIdClasificacion (String valor){
        int id;
        valor = valor.toLowerCase();
        try {
            String sql = "SELECT id FROM E_MALTRATOCLASIFICACION WHERE nombre = '" + valor + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            id = rs.getInt("id");
        } catch (SQLException ex) {
            id = insertIntoClasificacion (valor);
        }
        return id;
    }
    
    public int insertIntoClasificacion(String valor){
        int id = 0;
        try {
            String sql = "INSERT INTO E_MALTRATOCLASIFICACION VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, valor);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                 id = rs.getInt(1);
            }
            return id;
        } catch (SQLException ex) {
            Logger.getLogger(MaltratoDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    
    public void insertIntoMaltratoGenerador(int idTabla, String[] valores){
        for(String valor: valores){
            try {
                int idTablaDos = getIdGenerador(valor);
                String sql = "INSERT INTO E_MALTRATO_GENERADOR VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idTabla);
                ps.setInt(2, idTablaDos);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(MaltratoDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int getIdGenerador (String valor){
        int id;
        valor = valor.toLowerCase();
        try {
            String sql = "SELECT id FROM E_FAMILIAR WHERE familiar = '" + valor + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            id = rs.getInt("id");
        } catch (SQLException ex) {
            id = insertIntoFamiliar (valor);
        }
        return id;
    }
    
    public int insertIntoFamiliar(String valor){
        int id = 0;
        try {
            String sql = "INSERT INTO E_FAMILIAR VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, valor);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                 id = rs.getInt(1);
            }
            return id;
        } catch (SQLException ex) {
            Logger.getLogger(MaltratoDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public Maltrato getMaltrato (int id){
        try {
            String sql = "SELECT E_MALTRATO.* FROM E_MALTRATO, VALORACION WHERE VALORACION.id_e_maltrato = E_MALTRATO.id && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Maltrato maltrato = new Maltrato(rs.getInt("id"));
            maltrato.setDeteccionMaltrato(rs.getBoolean("deteccion_maltrato"));
            maltrato.setObservacion(rs.getString("observacion"));
            return maltrato;
        } catch (SQLException ex) {
            System.out.println("Error en query .getMaltrato - " + ex);
            return null;
        }
    }
    
    public List<String> getClasificacionesMaltrato (int id){
        try {
            String sql = "SELECT E_MALTRATOCLASIFICACION.nombre FROM E_MALTRATOCLASIFICACION, E_MALTRATO_MALTRATOCLASIFICACION, VALORACION  WHERE E_MALTRATO_MALTRATOCLASIFICACION.id_clasificacion = E_MALTRATOCLASIFICACION.id && E_MALTRATO_MALTRATOCLASIFICACION.id_maltrato = VALORACION.id_e_maltrato && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<String> nombres = new LinkedList<>();
            while(rs.next()){
                nombres.add(rs.getString("E_MALTRATOCLASIFICACION.nombre"));
            }
            return nombres;
        } catch (SQLException ex) {
            System.out.println("Error en query .getClasificacionesMaltrato - " + ex);
            return null;
        }
    }
    
    public List<String> getGeneradoresMaltrato (int id){
        try {
            String sql = "SELECT E_FAMILIAR.familiar FROM E_FAMILIAR, E_MALTRATO_GENERADOR, VALORACION  WHERE E_MALTRATO_GENERADOR.id_generador = E_FAMILIAR.id && E_MALTRATO_GENERADOR.id_maltrato = VALORACION.id_e_maltrato && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<String> generadores = new LinkedList<>();
            while(rs.next()){
                generadores.add(rs.getString("E_FAMILIAR.familiar"));
            }
            return generadores;
        } catch (SQLException ex) {
            System.out.println("Error en query .getGeneradoresMaltrato - " + ex);
            return null;
        }
    }
 
}