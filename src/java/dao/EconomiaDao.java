package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Economia;

public class EconomiaDao {
    DbConnection conn;
    
    public EconomiaDao(DbConnection conn){
        this.conn = conn;
    }
    
    public int insertIntoEconomia(Economia economia){
        int idEconomia = 0;
        try {
            String sql = "INSERT INTO E_ECONOMIA VALUES (0,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, economia.getSituacionEconomica());
            ps.setDouble(2, economia.getIngresoPaciente());
            ps.setDouble(3, economia.getIngresoGobierno());
            ps.setDouble(4, economia.getIngresoHogar());
            ps.setDouble(5, economia.getIngresoNoHogar());
            ps.setDouble(6, economia.getIngresoOtro());
            ps.setDouble(7, economia.getIngresoTotal());
            ps.setString(8, economia.getObservacion());
            ps.executeUpdate();
            ResultSet rs =  ps.getGeneratedKeys();
            while(rs.next()){
                idEconomia = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EconomiaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idEconomia;
    }
    
    public void update (int idValoracion, int id){
        String sql = "UPDATE VALORACION SET id_e_economia = " + id + " WHERE id = " + idValoracion;
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdEconomia (int idValoracion){
        int idEconomia;
        try {
            String sql = "SELECT id_e_economia FROM VALORACION WHERE id = '" + idValoracion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idEconomia = rs.getInt("id_e_economia");
        } catch (SQLException ex) {
            System.out.println("No hubo resultados : " + ex);
            idEconomia = 0;
        }
        return idEconomia;
    }
    
    public void insertIntoEconomiaProveedor(int idEconomia, String[] proveedores){
        for(String proveedor: proveedores){
            try {
                int idProveedor = getIdFamiliar(proveedor);
                String sql =   "INSERT INTO E_ECONOMIA_PROVEEDOR VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idEconomia);
                ps.setInt(2, idProveedor);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(EconomiaDao.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EconomiaDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public void insertIntoEconomiaInstitucion(int idEconomia, String[] instituciones){
        for(String institucion: instituciones){
            try {
                int idInstitucion = getIdInstitucion(institucion);
                String sql =   "INSERT INTO E_ECONOMIA_INSTITUCION VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idEconomia);
                ps.setInt(2, idInstitucion);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(EconomiaDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int getIdInstitucion (String institucion){
        int idInstitucion;
        try {
            String sql = "SELECT id FROM E_INSTITUCION WHERE nombre = '" + institucion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idInstitucion = rs.getInt("id");
        } catch (SQLException ex) {
            idInstitucion = insertIntoInstitucion (institucion);
        }
        return idInstitucion;
    }
    
    public int insertIntoInstitucion(String institucion){
        int idInstitucion = 0;
        try {
            String sql = "INSERT INTO E_INSTITUCION VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, institucion);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                 idInstitucion = rs.getInt(1);
            }
            return idInstitucion;
        } catch (SQLException ex) {
            Logger.getLogger(EconomiaDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public Economia getEconomia (int id){
        try {
            String sql = "SELECT E_ECONOMIA.* FROM E_ECONOMIA, VALORACION WHERE VALORACION.id_e_economia = E_ECONOMIA.id && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Economia economia = new Economia(rs.getInt("id"));
            economia.setSituacionEconomica(rs.getString("situacion_economica"));
            economia.setIngresoPaciente(rs.getDouble("ingreso_paciente"));
            economia.setIngresoGobierno(rs.getDouble("ingreso_gobierno"));
            economia.setIngresoHogar(rs.getDouble("ingreso_hogar"));
            economia.setIngresoNoHogar(rs.getDouble("ingreso_no_hogar"));
            economia.setIngresoOtro(rs.getDouble("ingreso_otro"));
            economia.setIngresoTotal(rs.getDouble("ingreso_total"));
            economia.setObservacion(rs.getString("observacion"));
            return economia;
        } catch (SQLException ex) {
            System.out.println("Error en query .getEconomia - " + ex);
            return null;
        }
    }
    public List<String> getProveedores (int id){
        try {
            String sql = "SELECT E_FAMILIAR.familiar FROM E_FAMILIAR, E_ECONOMIA_PROVEEDOR, VALORACION  WHERE E_ECONOMIA_PROVEEDOR.id_proveedor = E_FAMILIAR.id && E_ECONOMIA_PROVEEDOR.id_economia = VALORACION.id_e_economia && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> familiares = new LinkedList<>();
            while(rs.next()){
                familiares.add(rs.getString("E_FAMILIAR.familiar"));
            }
            return familiares;
        } catch (SQLException ex) {
            System.out.println("Error en query .getProveedores - " + ex);
            return null;
        }
    }
    public List<String> getInstituciones (int id){
        try {
            String sql = "SELECT E_INSTITUCION.nombre FROM E_INSTITUCION, E_ECONOMIA_INSTITUCION, VALORACION  WHERE E_ECONOMIA_INSTITUCION.id_institucion = E_INSTITUCION.id && E_ECONOMIA_INSTITUCION.id_economia = VALORACION.id_e_economia && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<String> instituciones = new LinkedList<>();
            while(rs.next()){
                instituciones.add(rs.getString("E_INSTITUCION.nombre"));
            }
            return instituciones;
        } catch (SQLException ex) {
            System.out.println("Error en query .getConflictosGenerales - " + ex);
            return null;
        }
    }
    
    
}
