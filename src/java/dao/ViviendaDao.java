package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Vivienda;

public class ViviendaDao {
    
    DbConnection conn;
    
    public ViviendaDao(DbConnection conn){
        this.conn = conn;
    }
    
     public int insertIntoVivienda(Vivienda vivienda){
       int newId = 0;
       String sql = "INSERT INTO E_VIVIENDA VALUES (0,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
       try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            //ps.setInt(1, (abordajeSocial.isA1()) ? 1: 0);
            ps.setString(1, vivienda.getTenencia());
            ps.setString(2, vivienda.getTipo());
            ps.setString(3, vivienda.getZona());
            ps.setBoolean(4, vivienda.isDormitorio_compartido());
            ps.setBoolean(5, vivienda.isAcceso_banio());
            ps.setBoolean(6, vivienda.isElevador());
            ps.setBoolean(7, vivienda.isEscaleras());
            ps.setBoolean(8, vivienda.isAlfombra());
            ps.setBoolean(9, vivienda.isDesniveles());
            ps.setBoolean(10, vivienda.isPasamanos());
            ps.setBoolean(11, vivienda.isObstaculos());
            ps.setBoolean(12, vivienda.isCaidas());
            ps.setString(13, vivienda.getEspecificacion());
            ps.setString(14, vivienda.getObservacion());
            ps.setString(15, vivienda.getPlanta());
            
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){ 
                newId = rs.getInt(1);
            } 
            return newId;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CuidadorDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
   }
     
     public void update (int idValoracion, int id){
        String sql = "UPDATE VALORACION SET id_e_vivienda = " + id + " WHERE id = " + idValoracion;
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
     public int getIdVivienda (int idValoracion){
        int idVivienda;
        try {
            String sql = "SELECT id_e_vivienda FROM VALORACION WHERE id = '" + idValoracion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idVivienda = rs.getInt("id_e_vivienda");
        } catch (SQLException ex) {
            System.out.println("No hubo resultados : " + ex);
            idVivienda = 0;
        }
        return idVivienda;
    }
     
    public void insertIntoViviendaCompaniero(int idVivienda, String[] companieros){
        for(String companiero: companieros){
            try {
                int idCompaniero = getIdFamiliar(companiero);
                String sql =   "INSERT INTO E_VIVIENDA_COMPANIERO VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idVivienda);
                ps.setInt(2, idCompaniero);
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
    
    public Vivienda getVivienda (int id){
        try {
            String sql = "SELECT E_VIVIENDA.* FROM E_VIVIENDA, VALORACION WHERE VALORACION.id_e_vivienda = E_VIVIENDA.id && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Vivienda vivienda = new Vivienda(rs.getInt("id"));
            vivienda.setTenencia(rs.getString("tenencia"));
            vivienda.setTipo(rs.getString("tipo"));
            vivienda.setZona(rs.getString("zona"));
            vivienda.setEspecificacion(rs.getString("especificacion"));
            vivienda.setPlanta(rs.getString("planta"));
            vivienda.setDormitorio_compartido(rs.getBoolean("dormitorio_compartido"));
            vivienda.setAcceso_banio(rs.getBoolean("acceso_banio"));
            vivienda.setCaidas(rs.getBoolean("caidas"));
            vivienda.setElevador(rs.getBoolean("elevador"));
            vivienda.setEscaleras(rs.getBoolean("escaleras"));
            vivienda.setAlfombra(rs.getBoolean("alfombra"));
            vivienda.setObservacion(rs.getString("observacion"));
            vivienda.setDesniveles(rs.getBoolean("desnivel"));
            vivienda.setPasamanos(rs.getBoolean("pasamanos"));
            vivienda.setObstaculos(rs.getBoolean("obstaculos"));
            return vivienda;
        } catch (SQLException ex) {
            System.out.println("Error en query .getVivienda - " + ex);
            return null;
        }
    }
    public List<String> getCompanieros (int id){
        try {
            String sql = "SELECT E_FAMILIAR.familiar FROM E_FAMILIAR, E_VIVIENDA_COMPANIERO, VALORACION  WHERE E_VIVIENDA_COMPANIERO.id_companiero = E_FAMILIAR.id && E_VIVIENDA_COMPANIERO.id_vivienda = VALORACION.id_e_vivienda && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<String> familiares = new LinkedList<>();
            while(rs.next()){
                familiares.add(rs.getString("E_FAMILIAR.familiar"));
            }
            return familiares;
        } catch (SQLException ex) {
            System.out.println("Error en query .getFunciones - " + ex);
            return null;
        }
    }
    
}