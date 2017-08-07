package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.UsuarioPaciente;
import model.Valoracion;

public class UsuarioPacienteDao {
    
    DbConnection conn;
    
    public UsuarioPacienteDao(DbConnection conn){
        this.conn = conn;
    }
    
    public List<UsuarioPaciente> getPacientes(){
        try {
            String sql = "SELECT * FROM PACIENTE";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs =  ps.executeQuery();
            List<UsuarioPaciente> lista = new LinkedList<>();
            while(rs.next()){
                UsuarioPaciente paciente = new UsuarioPaciente();
                paciente.setId(rs.getInt("id"));
                paciente.setRegistro(rs.getInt("registro"));
                paciente.setNombre(rs.getString("nombre"));
                lista.add(paciente);
            }
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public UsuarioPaciente getRegistro(int id_paciente){
        try {
            UsuarioPaciente paciente = new UsuarioPaciente();
            String sql = "SELECT nombre, registro FROM PACIENTE WHERE id_paciente = "+id_paciente;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs =  ps.executeQuery();
            rs.next();
            paciente.setId(id_paciente);
            paciente.setRegistro(rs.getInt("registro"));
            paciente.setNombre(rs.getString("nombre"));
            paciente.setValoraciones(getValoraciones(id_paciente));
            return paciente;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public List<Valoracion> getValoraciones (int id){
        try {
            String sql = "SELECT * FROM VALORACION WHERE id_paciente = " + id + " ORDER BY id DESC";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs =  ps.executeQuery();
            List<Valoracion> lista = new LinkedList<>();
            while(rs.next()){
                Valoracion valoracion = new Valoracion();
                valoracion.setId(rs.getInt("id"));
                valoracion.setIdPaciente(id);
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
                valoracion.setAbordaje(getAbordaje(rs.getInt("id_e_abordaje")));
                valoracion.setFecha(rs.getString("fecha"));
                lista.add(valoracion);
            }
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public String getAbordaje(int id){
        try {
            String sql = "SELECT observacion FROM E_ABORDAJE WHERE id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getString("observacion");
        } catch (SQLException ex) {
            Logger.getLogger(RegistroDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
    
    public UsuarioPaciente getPacientePorRegisto(int id){
        try {
            String sql = "SELECT id_paciente FROM VALORACION WHERE id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs =  ps.executeQuery();
            rs.next();
            UsuarioPaciente paciente = getRegistro(rs.getInt("id_paciente"));
            return paciente;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
