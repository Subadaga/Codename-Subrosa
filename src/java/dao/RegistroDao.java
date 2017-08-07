package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Registro;
import model.Valoracion;

public class RegistroDao {
    DbConnection conn;
    
    public RegistroDao(DbConnection conn){
        this.conn = conn;
    }
    
    public Registro getPaientePorId(int id){
        try{
            String sql = "SELECT nombre, registro FROM PACIENTE WHERE id = "+id;
            PreparedStatement preparedStatement = conn.getConnection().prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            Registro registro = new Registro(id);
            rs.next();
            registro.setNombre(rs.getString("nombre"));
            registro.setRegistro(rs.getInt("registro"));
            
            return registro;
        }catch (SQLException e){
            System.out.println("Error RegistroDao .getPacientePorId: "+ e.getMessage());
            return null;
        }
    }
    
    public List<Valoracion> getValoracionesPorId(int id){
        try{
            String sql = "SELECT id_e_abordaje FROM VALORACION WHERE id_paciente = "+id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <Valoracion> valoraciones = new LinkedList<>();
            while(rs.next()){
                Valoracion valoracion = new Valoracion ();
                valoracion.setId(rs.getInt("id_e_abordaje"));
                valoracion.setAbordaje(getAbordaje(valoracion.getId()));
                valoraciones.add(valoracion);
            }
            return valoraciones;
        }catch (SQLException e){
            System.out.println("Error RegistroDao .getValoracionesPorId: "+ e.getMessage());
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
    
}