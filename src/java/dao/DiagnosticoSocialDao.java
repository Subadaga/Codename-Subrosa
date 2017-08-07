package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DiagnosticoSocial;

public class DiagnosticoSocialDao {
    
    DbConnection conn;
    
    public DiagnosticoSocialDao(DbConnection conn){
        this.conn = conn;
    }
    
    public int insertIntoDiagnostico(DiagnosticoSocial diagnostico){
        int newId = 0;
        String sql = "INSERT INTO E_DIAGNOSTICO VALUES (0,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            ps.setBoolean(1, diagnostico.isPatologia());
            ps.setString(2, diagnostico.getFamilia());
            ps.setBoolean(3, diagnostico.isConflictoHistorico());
            ps.setBoolean(4, diagnostico.isConflictoActual());
            ps.setBoolean(5, diagnostico.isComunicacion());
            ps.setBoolean(6, diagnostico.isRedFamiliar());
            ps.setBoolean(7, diagnostico.isRedExtrafamiliar());
            ps.setBoolean(8, diagnostico.isRedInstitucional());
            ps.setString(9, diagnostico.getDesgasteEmocional());
            ps.setString(10, diagnostico.getRedCuidados());
            ps.setString(11, diagnostico.getSupervision());
            ps.setBoolean(12, diagnostico.isDeteccionMaltrato());
            ps.setString(13, diagnostico.getColapsoCuidador());
            ps.setBoolean(14, diagnostico.isRiesgosArquitectonicos());
            ps.setString(15, diagnostico.getNivelSocioeconomico());
            ps.setString(16, diagnostico.getObservacion());
            
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
        String sql = "UPDATE VALORACION SET id_e_diagnostico = " + id + " WHERE id = " + idValoracion;
        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(EvaluacionPacienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIdDiagnosticoSocial (int idValoracion){
        int idDiagnostico;
        try {
            String sql = "SELECT id_e_diagnostico FROM VALORACION WHERE id = '" + idValoracion + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idDiagnostico = rs.getInt("id_e_diagnostico");
        } catch (SQLException ex) {
            System.out.println("No hubo resultados : " + ex);
            idDiagnostico = 0;
        }
        return idDiagnostico;
    }
    
    public void insertIntoDiagnosticoClasificacionMaltrato(int idTabla, String[] valores){
        for(String valor: valores){
            try {
                int idTablaDos = getIdClasificacion(valor);
                String sql = "INSERT INTO E_DIAGNOSTICO_MALTRATOCLASIFICACION VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idTabla);
                ps.setInt(2, idTablaDos);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(DiagnosticoSocialDao.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DiagnosticoSocialDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public void insertIntoDiagnosticoArea(int idTabla, String[] valores){
        for(String valor: valores){
            try {
                int idTablaDos = getIdArea(valor);
                String sql = "INSERT INTO E_DIAGNOSTICO_AREA VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idTabla);
                ps.setInt(2, idTablaDos);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(DiagnosticoSocialDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int getIdArea (String valor){
        int id;
        valor = valor.toLowerCase();
        try {
            String sql = "SELECT id FROM E_AREA WHERE area = '" + valor + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            id = rs.getInt("id");
        } catch (SQLException ex) {
            id = insertIntoArea(valor);
        }
        return id;
    }
    
    public int insertIntoArea(String valor){
        int id = 0;
        try {
            String sql = "INSERT INTO E_AREA VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, valor);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                 id = rs.getInt(1);
            }
            return id;
        } catch (SQLException ex) {
            Logger.getLogger(DiagnosticoSocialDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public void insertIntoDiagnosticoDesapegoTerapeutico(int idTabla, String[] valores){
        for(String valor: valores){
            try {
                int idTablaDos = getIdDesapegoTerapeutico(valor);
                String sql = "INSERT INTO E_DIAGNOSTICO_DESAPEGOTERAPEUTICO VALUES (?,?)";
                PreparedStatement ps = conn.getConnection().prepareStatement(sql);
                ps.setInt(1, idTabla);
                ps.setInt(2, idTablaDos);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(DiagnosticoSocialDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int getIdDesapegoTerapeutico (String valor){
        int id;
        valor = valor.toLowerCase();
        try {
            String sql = "SELECT id FROM E_DESAPEGOTERAPEUTICO WHERE desapego_terapeutico = '" + valor + "'";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            id = rs.getInt("id");
        } catch (SQLException ex) {
            id = insertIntoDesapegoTerapeutico(valor);
        }
        return id;
    }
    
    public int insertIntoDesapegoTerapeutico(String valor){
        int id = 0;
        try {
            String sql = "INSERT INTO E_DESAPEGOTERAPEUTICO VALUES (0,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, valor);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while(rs.next()){
                 id = rs.getInt(1);
            }
            return id;
        } catch (SQLException ex) {
            Logger.getLogger(DiagnosticoSocialDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public DiagnosticoSocial getDiagnosticoSocial (int id){
        try {
            String sql = "SELECT E_DIAGNOSTICO.* FROM E_DIAGNOSTICO, VALORACION WHERE VALORACION.id_e_diagnostico = E_DIAGNOSTICO.id && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            DiagnosticoSocial diagnostico = new DiagnosticoSocial(rs.getInt("id"));
            diagnostico.setPatologia(rs.getBoolean("patologia_social"));
            diagnostico.setConflictoHistorico(rs.getBoolean("conflicto_historico"));
            diagnostico.setConflictoActual(rs.getBoolean("conflicto_actual"));
            diagnostico.setComunicacion(rs.getBoolean("comunicacion"));
            diagnostico.setRedFamiliar(rs.getBoolean("red_familiar"));
            diagnostico.setRedExtrafamiliar(rs.getBoolean("red_extrafamiliar"));
            diagnostico.setRedInstitucional(rs.getBoolean("red_institucional"));
            diagnostico.setDeteccionMaltrato(rs.getBoolean("maltrato"));
            diagnostico.setRiesgosArquitectonicos(rs.getBoolean("riesgos_arquitectonicos"));
            diagnostico.setFamilia(rs.getString("familia"));
            diagnostico.setDesgasteEmocional(rs.getString("desgaste_emocional"));
            diagnostico.setObservacion(rs.getString("observacion"));
            diagnostico.setRedCuidados(rs.getString("red_cuidados"));
            diagnostico.setSupervision(rs.getString("supervision"));
            diagnostico.setColapsoCuidador(rs.getString("colapso_cuidador"));
            diagnostico.setNivelSocioeconomico(rs.getString("nivel_socioeconomico"));
            return diagnostico;
        } catch (SQLException ex) {
            System.out.println("Error en query .getDiagnosticoSocial - " + ex);
            return null;
        }
    }
    public List<String> getDesapegosTerapeuticos (int id){
        try {
            String sql = "SELECT E_DESAPEGOTERAPEUTICO.desapego_terapeutico FROM E_DESAPEGOTERAPEUTICO, E_DIAGNOSTICO_DESAPEGOTERAPEUTICO, VALORACION  WHERE E_DIAGNOSTICO_DESAPEGOTERAPEUTICO.id_desapego_terapeutico = E_DESAPEGOTERAPEUTICO.id && E_DIAGNOSTICO_DESAPEGOTERAPEUTICO.id_diagnostico_medico = VALORACION.id_e_diagnostico && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> desapegos_terapeuticos = new LinkedList<>();
            while(rs.next()){
                desapegos_terapeuticos.add(rs.getString("E_DESAPEGOTERAPEUTICO.desapego_terapeutico"));
            }
            return desapegos_terapeuticos;
        } catch (SQLException ex) {
            System.out.println("Error en query .getDesapegosTerapeuticos - " + ex);
            return null;
        }
    }
    
    public List<String> getQuejas (int id){
        try {
            String sql = "SELECT E_AREA.area FROM E_AREA, E_DIAGNOSTICO_AREA, VALORACION  WHERE E_DIAGNOSTICO_AREA.id_area = E_AREA.id && E_DIAGNOSTICO_AREA.id_diagnostico = VALORACION.id_e_diagnostico && VALORACION.id = " + id;
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List <String> quejas = new LinkedList<>();
            while(rs.next()){
                quejas.add(rs.getString("E_AREA.area"));
            }
            return quejas;
        } catch (SQLException ex) {
            System.out.println("Error en query .getQuejas - " + ex);
            return null;
        }
    }
}