package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Familia;

public class FamiliaDao {
    DbConnection conn;
    
    public FamiliaDao(DbConnection conn){
        this.conn = conn;
    }
    
    public int insertIntoFamilia (Familia familia){
        int idFamilia = 0;
        try {
            String sql = "INSERT INTO E_FAMILIA VALUES (0,?,?,?,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, familia.getRelacionFamiliar());
            ps.setString(2, familia.getTipoFamilia());
            ps.setString(3, familia.getCiclo());
            ps.setString(4, familia.getObservacion());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                idFamilia = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FamiliaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idFamilia;
    }
    
    public void update (int idValoracion, int id){
        String sql = "UPDATE VALORACION SET id_e_familia = " + id + " WHERE id = " + idValoracion;
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdFamilia (int idValoracion){
        int idFamilia;
        try {
            String sql = "SELECT id_e_familia FROM VALORACION WHERE id = '" + idValoracion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idFamilia = rs.getInt("id_e_familia");
        } catch (SQLException ex) {
            System.out.println("No hubo resultados : " + ex);
            idFamilia = 0;
        }
        return idFamilia;
    }
    
    public void insertIntoFamiliaProblema(int idFamilia, String problema, String involucrados){
        try {
            int idProblema = getIdProblema(problema);
            String sql = "INSERT INTO E_FAMILIA_PROBLEMA VALUES (0,?,?,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, idFamilia);
            ps.setInt(2, idProblema);
            ps.setString(3, involucrados);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FamiliaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdProblema (String problema){
        int idProblema;
        problema = problema.toLowerCase();
        try {
            String sql = "SELECT id FROM E_PROBLEMA WHERE problema = '" + problema + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idProblema = rs.getInt("id");
        } catch (SQLException ex) {
            idProblema = insertIntoProblema (problema);
        }
        return idProblema;
    }
    
    public int insertIntoProblema(String problema){
        int idProblema = 0;
        try {
            String sql = "INSERT INTO E_PROBLEMA VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, problema);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                 idProblema = rs.getInt(1);
            }
            return idProblema;
        } catch (SQLException ex) {
            Logger.getLogger(FamiliaDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public Familia getFamilia (int id){
        try {
            String sql = "SELECT E_FAMILIA.* FROM E_FAMILIA, VALORACION WHERE VALORACION.id_e_familia = E_FAMILIA.id && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Familia familia = new Familia(rs.getInt("id"));
            familia.setRelacionFamiliar(rs.getString("relacion_familiar"));
            familia.setTipoFamilia(rs.getString("tipo_familia"));
            familia.setCiclo(rs.getString("ciclo"));
            familia.setObservacion(rs.getString("observacion"));
            return familia;
        } catch (SQLException ex) {
            System.out.println("Error en query .getFamilia - " + ex);
            return null;
        }
    }
    public List<String> getProblemasOrigen (int id){ ///Ni idea de como es la seleccion para este metodo y el que sigue
        try {
            String sql = "SELECT E_PROBLEMA.problema FROM E_PROBLEMA, E_FAMILIA_PROBLEMA, VALORACION  WHERE E_FAMILIA_PROBLEMA.id_problema = E_PROBLEMA.id && E_FAMILIA_PROBLEMA.id_familia = VALORACION.id_e_familia && E_FAMILIA_PROBLEMA.involucrados = 'familia de origen' && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> problemas = new LinkedList<>();
            while(rs.next()){
                problemas.add(rs.getString("E_PROBLEMA.problema"));
            }
            return problemas;
        } catch (SQLException ex) {
            System.out.println("Error en query .getProblemasOrigen - " + ex);
            return null;
        }
    }
    public List<String> getProblemasConyugales (int id){
        try {
            String sql = "SELECT E_PROBLEMA.problema FROM E_PROBLEMA, E_FAMILIA_PROBLEMA, VALORACION  WHERE E_FAMILIA_PROBLEMA.id_problema = E_PROBLEMA.id && E_FAMILIA_PROBLEMA.id_familia = VALORACION.id_e_familia && E_FAMILIA_PROBLEMA.involucrados = 'conyugales e hijos' && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> problemas = new LinkedList<>();
            while(rs.next()){
                problemas.add(rs.getString("E_PROBLEMA.problema"));
            }
            return problemas;
        } catch (SQLException ex) {
            System.out.println("Error en query .getProblemasConyugales - " + ex);
            return null;
        }
    }
    
}
