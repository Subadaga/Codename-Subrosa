package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import model.Cuidador;

public class CuidadorDao {
    
    DbConnection conn;
    
    public CuidadorDao(DbConnection conn){
        this.conn = conn;
    } 
    
    public int insertIntoCuidador (Cuidador cuidador){
        int newId = 0;
        String sql = "INSERT INTO E_CUIDADOR VALUES (0,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            ps.setString(1, cuidador.getNombre());
            ps.setString(2, cuidador.getNacimiento());
            ps.setString(3, cuidador.getOcupacion());
            ps.setString(4, cuidador.getTelefonoUno());
            ps.setString(5, cuidador.getTelefonoDos());
            ps.setString(6, cuidador.getCorreo());
            ps.setString(7, cuidador.getTiempoCuidando());
            ps.setString(8, cuidador.getParentesco());
            ps.setString(9, cuidador.getEstadoCivil());
            ps.setString(10, cuidador.getEscolaridad());
            ps.setString(11, cuidador.getEscalaZarit());
            ps.setString(12, cuidador.getObservacion());
            ps.setBoolean(13, cuidador.isViveConElPaciente());
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
        String sql = "UPDATE VALORACION SET id_e_cuidador = " + id + " WHERE id = " + idValoracion;
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdCuidador (int idValoracion){
        int idCuidador;
        try {
            String sql = "SELECT id_e_cuidador FROM VALORACION WHERE id = '" + idValoracion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idCuidador = rs.getInt("id_e_cuidador");
        } catch (SQLException ex) {
            System.out.println("No hubo resultados : " + ex);
            idCuidador = 0;
        }
        return idCuidador;
    }
    
    public int getIdFuncion (String funcion){
        funcion = funcion.toLowerCase();
        int idFuncion;
        try {
            String sql = "SELECT id FROM E_FUNCION WHERE funcion = '" + funcion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idFuncion = rs.getInt("id");
        } catch (SQLException ex) {
            idFuncion = insertIntoFuncion(funcion);
        }
        return idFuncion;
    }
    
    public int insertIntoCuidadorFuncion (String[] funciones, int idCuidador){
        for(String funcion: funciones){
            int idFuncion = getIdFuncion(funcion);
            String sql = "INSERT INTO E_CUIDADOR_FUNCION VALUES (?,?)";
            try {
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idCuidador);
                ps.setInt(2,idFuncion);
                ps.executeUpdate();
            } catch (SQLException ex) {
                java.util.logging.Logger.getLogger(CuidadorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
    
    public int insertIntoFuncion (String funcion){
        int idFuncion=0;
        String sql = "INSERT INTO E_FUNCION VALUES (0,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, funcion);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                idFuncion = rs.getInt(1);
            }
            return idFuncion;
        }catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CuidadorDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public int getIdConflicto (String conflicto){
        conflicto = conflicto.toLowerCase();
        int idConflicto;
        try {
            String sql = "SELECT id FROM E_CONFLICTO WHERE conflicto = '" + conflicto + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idConflicto = rs.getInt("id");
        } catch (SQLException ex) {
            idConflicto = insertIntoConflicto(conflicto);
        }
        return idConflicto;
    }
    
    public int insertIntoCuidadorConflicto (String[] conflictos, int idCuidador){
        for(String conflicto: conflictos){
            int idConflicto = getIdConflicto(conflicto);
            String sql = "INSERT INTO E_CUIDADOR_CONFLICTO VALUES (?,?)";
            try {
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idCuidador);
                ps.setInt(2,idConflicto);
                ps.executeUpdate();
            } catch (SQLException ex) {
                java.util.logging.Logger.getLogger(CuidadorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
    
    public int insertIntoConflicto (String conflicto){
        int idConflicto = 0;
        String sql = "INSERT INTO E_CONFLICTO VALUES (0,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, conflicto);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                idConflicto = rs.getInt(1);
            }
            return idConflicto;
        }catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CuidadorDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public Cuidador getCuidador (int id){
        try {
            String sql = "SELECT E_CUIDADOR.* FROM E_CUIDADOR, VALORACION WHERE VALORACION.id_e_cuidador = E_CUIDADOR.id && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Cuidador cuidador = new Cuidador(rs.getInt("id"));
            cuidador.setNombre(rs.getString("nombre"));
            cuidador.setNacimientoDisplay(rs.getString("nacimiento"));
            cuidador.setOcupacion(rs.getString("ocupacion"));
            cuidador.setTelefonoUno(rs.getString("telefono_uno"));
            cuidador.setTelefonoDos(rs.getString("telefono_dos"));
            cuidador.setCorreo(rs.getString("correo"));
            cuidador.setTiempoCuidandoDisplay(rs.getString("tiempo_cuidando"));
            cuidador.setParentesco(rs.getString("parentesco"));
            cuidador.setEstadoCivil(rs.getString("estado_civil"));
            cuidador.setEscolaridad(rs.getString("escolaridad"));
            cuidador.setEscalaZarit(rs.getString("escala_zarit"));
            cuidador.setObservacion(rs.getString("observacion"));
            cuidador.setViveConElPaciente(rs.getBoolean("vive_con_paciente"));
            return cuidador;
        } catch (SQLException ex) {
            System.out.println("Error en query .getCuidador - " + ex);
            return null;
        }
    }
    public List<String> getFunciones (int id){
        try {
            String sql = "SELECT E_FUNCION.funcion FROM E_FUNCION, E_CUIDADOR_FUNCION, VALORACION  WHERE E_CUIDADOR_FUNCION.id_funcion = E_FUNCION.id && E_CUIDADOR_FUNCION.id_cuidador = VALORACION.id_e_cuidador && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> funciones = new LinkedList<>();
            while(rs.next()){
                funciones.add(rs.getString("E_FUNCION.funcion"));
            }
            return funciones;
        } catch (SQLException ex) {
            System.out.println("Error en query .getFunciones - " + ex);
            return null;
        }
    }
    public List<String> getConflictosGenerales (int id){
        try {
            String sql = "SELECT E_CONFLICTO.conflicto FROM E_CONFLICTO, E_CUIDADOR_CONFLICTO, VALORACION  WHERE E_CUIDADOR_CONFLICTO.id_conflicto = E_CONFLICTO.id && E_CUIDADOR_CONFLICTO.id_cuidador = VALORACION.id_e_cuidador && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> conflictos = new LinkedList<>();
            while(rs.next()){
                conflictos.add(rs.getString("E_CONFLICTO.conflicto"));
            }
            return conflictos;
        } catch (SQLException ex) {
            System.out.println("Error en query .getConflictosGenerales - " + ex);
            return null;
        }
    }

}
