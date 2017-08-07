package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Valoracion;

public class ValoracionDao {
    
    DbConnection conn;
    
    public ValoracionDao(DbConnection conn){
        this.conn = conn;
    }
    
    public int crearValoracion (int idPaciente){
        int idValoracion = 0;
        String sql = "INSERT INTO VALORACION (id_paciente) VALUES (?)";
        try{
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, idPaciente);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){ 
                idValoracion = rs.getInt(1);
            } 
            return idValoracion;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CuidadorDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public Valoracion getValoracion(int idValoracion){
        try {
            String sql = "SELECT * FROM VALORACION WHERE id = " + idValoracion;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs =  ps.executeQuery();
            Valoracion valoracion = new Valoracion();
            while(rs.next()){
                valoracion.setId(idValoracion);
                valoracion.setIdPaciente(rs.getInt("id_paciente"));
                valoracion.setIdEvaluacionPaciente(rs.getInt("id_e_paciente"));
                valoracion.setIdCuidador(rs.getInt("id_e_cuidador"));
                valoracion.setIdTratamiento(rs.getInt("id_e_tratamiento"));
                valoracion.setIdRecursos(rs.getInt("id_e_recursos"));
                valoracion.setIdFamilia(rs.getInt("id_e_familia"));
                valoracion.setIdEconomia(rs.getInt("id_e_economia"));
                valoracion.setIdServicioMedico(rs.getInt("id_e_servicio_medico"));
                valoracion.setIdMaltrato(rs.getInt("id_e_maltrato"));
                valoracion.setIdVivienda(rs.getInt("id_e_vivienda"));
                valoracion.setIdDiagnostico(rs.getInt("id_e_diagnostico"));
                valoracion.setIdAbordaje(rs.getInt("id_e_abordaje"));
                valoracion.setFecha(rs.getString("fecha"));
            }
            return valoracion;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public int eliminarValoracion(int idValoracion){
        try {
            String sql = "DELETE FROM VALORACION WHERE id = ?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, idValoracion);
            int rows =  ps.executeUpdate();
            return rows;
        } catch (SQLException e) {
            System.out.println("Error ValoracionDao.eliminarValoracion: " + e.getMessage());
            return 0;
        }
    }
    
}
