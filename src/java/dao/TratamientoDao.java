package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.TratamientoFarmocologico;

public class TratamientoDao {
    DbConnection conn;
    
    public TratamientoDao(DbConnection conn){
        this.conn  = conn;
    }
    
    public int insertIntoTratamiento(TratamientoFarmocologico tratamiento){
        int idTratamiento=0;
        try {
            String sql = "INSERT INTO E_TRATAMIENTO VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, tratamiento.getObservacion());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                idTratamiento = rs.getInt(1);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TratamientoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idTratamiento;
    }
    
    public void update (int idValoracion, int id){
        String sql = "UPDATE VALORACION SET id_e_tratamiento = " + id + " WHERE id = " + idValoracion;
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdTratamiento (int idValoracion){
        int idTratamiento;
        try {
            String sql = "SELECT id_e_tratamiento FROM VALORACION WHERE id = '" + idValoracion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idTratamiento = rs.getInt("id_e_tratamiento");
        } catch (SQLException ex) {
            System.out.println("No hubo resultados : " + ex);
            idTratamiento = 0;
        }
        return idTratamiento;
    }
    
    public void insertIntoTratamientoMedicina(int idTratamiento, String[] medicinas){
        for(String medicina: medicinas){
            try {
                int idMedicina = getIdMedicina(medicina);
                String sql = "INSERT INTO E_TRATAMIENTO_MEDICINA VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idTratamiento);
                ps.setInt(2, idMedicina);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(TratamientoDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int getIdMedicina (String medicina){
        int idMedicina;
        medicina = medicina.toLowerCase();
        try {
            String sql = "SELECT id FROM E_MEDICINA WHERE medicina = '" + medicina + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idMedicina = rs.getInt("id");
        } catch (SQLException ex) {
            idMedicina = insertIntoMedicina (medicina);
        }
        return idMedicina;
    }
    
    public int insertIntoMedicina(String medicina){
        int idMedicina = 0;
        try {
            String sql = "INSERT INTO E_MEDICINA VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, medicina);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                 idMedicina = rs.getInt(1);
            }
            return idMedicina;
        } catch (SQLException ex) {
            Logger.getLogger(TratamientoDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public void insertIntoTratamientoAdministrador(int idTratamiento, String[] administradores){
        for(String administrador: administradores){
            try {
                int idAdministrador = getIdFamiliar(administrador);
                String sql =   "INSERT INTO E_TRATAMIENTO_ADMINISTRADOR VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idTratamiento);
                ps.setInt(2, idAdministrador);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(TratamientoDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public void insertIntoTratamientoComprador(int idTratamiento, String[] compradores){
        for(String comprador: compradores){
            try {
                int idComprador = getIdFamiliar(comprador);
                String sql =   "INSERT INTO E_TRATAMIENTO_COMPRADOR VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idTratamiento);
                ps.setInt(2, idComprador);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(TratamientoDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int getIdFamiliar (String familiar){
        int idFamiliar;
        familiar = familiar.toLowerCase();
        try {
            String sql = "SELECT id FROM E_FAMILIAR WHERE familiar = '" + familiar + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idFamiliar = rs.getInt("id");
        } catch (SQLException ex) {
            idFamiliar = insertIntoFamiliar (familiar);
        }
        return idFamiliar;
    }
    
    public int insertIntoFamiliar(String familiar){
        int idFamiliar = 0;
        try {
            String sql = "INSERT INTO E_FAMILIAR VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, familiar);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                 idFamiliar = rs.getInt(1);
            }
            return idFamiliar;
        } catch (SQLException ex) {
            Logger.getLogger(TratamientoDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public void insertIntoTratamientoTransporte(int idTratamiento, String[] transportes){
        for(String transporte: transportes){
            try {
                int idTransporte = getIdTransporte(transporte);
                String sql =   "INSERT INTO E_TRATAMIENTO_TRANSPORTE VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idTratamiento);
                ps.setInt(2, idTransporte);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(TratamientoDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int getIdTransporte (String transporte){
        int idTransporte;
        transporte = transporte.toLowerCase();
        try {
            String sql = "SELECT id FROM E_TRANSPORTE WHERE transporte = '" + transporte + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idTransporte = rs.getInt("id");
        } catch (SQLException ex) {
            idTransporte = insertIntoTransporte (transporte);
        }
        return idTransporte;
    }
    
    public int insertIntoTransporte(String transporte){
        int idTransporte = 0;
        try {
            String sql = "INSERT INTO E_TRANSPORTE VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, transporte);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                 idTransporte = rs.getInt(1);
            }
            return idTransporte;
        } catch (SQLException ex) {
            Logger.getLogger(TratamientoDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public TratamientoFarmocologico getTratamiento (int id){
        try {
            String sql = "SELECT E_TRATAMIENTO.* FROM E_TRATAMIENTO, VALORACION WHERE VALORACION.id_e_tratamiento = E_TRATAMIENTO.id && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            TratamientoFarmocologico tratamiento = new TratamientoFarmocologico(rs.getInt("id"));
            tratamiento.setObservacion(rs.getString("observacion"));
            return tratamiento;
        } catch (SQLException ex) {
            System.out.println("Error en query .getTratamiento - " + ex);
            return null;
        }
    }
    public List<String> getMedicinas (int id){
        try {
            String sql = "SELECT E_MEDICINA.medicina FROM E_MEDICINA, E_TRATAMIENTO_MEDICINA, VALORACION  WHERE E_TRATAMIENTO_MEDICINA.id_medicina = E_MEDICINA.id && E_TRATAMIENTO_MEDICINA.id_tratamiento = VALORACION.id_e_tratamiento && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> medicinas = new LinkedList<>();
            while(rs.next()){
                medicinas.add(rs.getString("E_MEDICINA.medicina"));
            }
            return medicinas;
        } catch (SQLException ex) {
            System.out.println("Error en query .getMedicina - " + ex);
            return null;
        }
    }
    
    public List<String> getAdministradores (int id){
        try {
            String sql = "SELECT E_FAMILIAR.familiar FROM E_FAMILIAR, E_TRATAMIENTO_ADMINISTRADOR, VALORACION  WHERE E_TRATAMIENTO_ADMINISTRADOR.id_administrador = E_FAMILIAR.id && E_TRATAMIENTO_ADMINISTRADOR.id_tratamiento = VALORACION.id_e_tratamiento && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> familiar = new LinkedList<>();
            while(rs.next()){
                familiar.add(rs.getString("E_FAMILIAR.familiar"));
            }
            return familiar;
        } catch (SQLException ex) {
            System.out.println("Error en query .getAdministradores - " + ex);
            return null;
        }
    }
    public List<String> getCompradores (int id){
        try {
            String sql = "SELECT E_FAMILIAR.familiar FROM E_FAMILIAR, E_TRATAMIENTO_COMPRADOR, VALORACION  WHERE E_TRATAMIENTO_COMPRADOR.id_comprador = E_FAMILIAR.id && E_TRATAMIENTO_COMPRADOR.id_tratamiento = VALORACION.id_e_tratamiento && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> comprador = new LinkedList<>();
            while(rs.next()){
                comprador.add(rs.getString("E_FAMILIAR.familiar"));
            }
            return comprador;
        } catch (SQLException ex) {
            System.out.println("Error en query .getCompradores - " + ex);
            return null;
        }
    }
    public List<String> getTransportes (int id){
        try {
            String sql = "SELECT E_TRANSPORTE.transporte FROM E_TRANSPORTE, E_TRATAMIENTO_TRANSPORTE, VALORACION  WHERE E_TRATAMIENTO_TRANSPORTE.id_transporte = E_TRANSPORTE.id && E_TRATAMIENTO_TRANSPORTE.id_tratamiento = VALORACION.id_e_tratamiento && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> transportes = new LinkedList<>();
            while(rs.next()){
                transportes.add(rs.getString("E_TRANSPORTE.transporte"));
            }
            return transportes;
        } catch (SQLException ex) {
            System.out.println("Error en query .getTransportes - " + ex);
            return null;
        }
    }
    
}
