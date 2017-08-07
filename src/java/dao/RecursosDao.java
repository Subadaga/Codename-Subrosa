package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Recursos;

public class RecursosDao {
    DbConnection conn;
    
    public RecursosDao(DbConnection conn){
        this.conn = conn;
    }
    
    public int insertIntoRecursos(Recursos recursos){
        int idRecursos=0;
        try {
            String sql = "INSERT INTO E_RECURSOS VALUES (0,?,?,?,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setBoolean(1, recursos.isRedFamiliar());
            ps.setBoolean(2, recursos.isRedExtraFamiliar());
            ps.setBoolean(3, recursos.isRedInstitucional());
            ps.setString(4, recursos.getObservacion());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                idRecursos = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RecursosDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idRecursos;
    }
    
    public void update (int idValoracion, int id){
        String sql = "UPDATE VALORACION SET id_e_recursos = " + id + " WHERE id = " + idValoracion;
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdRecursos (int idValoracion){
        int idCuidador;
        try {
            String sql = "SELECT id_e_recursos FROM VALORACION WHERE id = '" + idValoracion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idCuidador = rs.getInt("id_e_recursos");
        } catch (SQLException ex) {
            System.out.println("No hubo resultados : " + ex);
            idCuidador = 0;
        }
        return idCuidador;
    }
    
    public Recursos getRecursos (int id){
        try {
            String sql = "SELECT E_RECURSOS.* FROM E_RECURSOS, VALORACION WHERE VALORACION.id_e_recursos = E_RECURSOS.id && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Recursos recursos = new Recursos(rs.getInt("id"));
            recursos.setRedFamiliar(rs.getBoolean("red_familiar"));
            recursos.setRedExtraFamiliar(rs.getBoolean("red_extra_familiar"));
            recursos.setRedInstitucional(rs.getBoolean("red_institucional"));
            recursos.setObservacion(rs.getString("observacion"));
            return recursos;
        } catch (SQLException ex) {
            System.out.println("Error en query .getCuidador - " + ex);
            return null;
        }
    }
    
}
