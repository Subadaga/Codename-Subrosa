
package controller;

import beans.SessionBean;
import dao.DbConnection;
import dao.DiagnosticoSocialDao;
import dao.UsuarioPacienteDao;
import dao.ValoracionDao;
import dao.ViviendaDao;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UsuarioPaciente;
import model.Valoracion;
import model.Vivienda;

public class ViviendaController extends HttpServlet {
    
    //bean de la sesion
    @EJB
    SessionBean sesion;
//    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.getSession();
        
        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int idValoracion = Integer.parseInt(request.getParameter("id"));
        String tenenciaParam = request.getParameter("tenencia");
        String tipoParam = request.getParameter("tipo");
        String zonaParam = request.getParameter("zona");
        String plantaParam = request.getParameter("planta");
        boolean banioParam = (request.getParameter("banio")!=null && request.getParameter("banio").equals("si"));
        String[]objetosViviendaParam = request.getParameterValues("objetosVivienda");
        boolean caidasParam = request.getParameter("caidas").equals("si");
        String especificacionCaidadParam = request.getParameter("caidaEspecificacion");
        boolean comparteDormitorioParam = request.getParameter("comparteDormitorio").equals("si");
        String[]companierosParam = request.getParameterValues("companiero");
        String observacionParam = request.getParameter("observaciones");
        
        // ===== CREACIÓN DEL OBJETO =====
        Vivienda vivienda = new Vivienda ();
        vivienda.setTenencia(tenenciaParam);
        vivienda.setTipo(tipoParam);
        vivienda.setZona(zonaParam);
        vivienda.setDormitorio_compartido(comparteDormitorioParam);
        if(vivienda.isDormitorio_compartido()){
            vivienda.setCompanieros(companierosParam);
        }
        vivienda.setPlanta(plantaParam);
        vivienda.setAcceso_banio(comparteDormitorioParam);
        vivienda.setCaidas(caidasParam);
        if(vivienda.isCaidas()){
            vivienda.setEspecificacion(especificacionCaidadParam);
        }
        vivienda.setObservacion(observacionParam);
        if(objetosViviendaParam != null){
            for(String objeto: objetosViviendaParam){
                switch(objeto){
                    case "elevador":
                        vivienda.setElevador(true);
                        break;
                    case "escaleras":
                        vivienda.setEscaleras(true);
                        break;
                    case "alfombra":
                        vivienda.setAlfombra(true);
                        break;
                    case "desniveles":
                        vivienda.setDesniveles(true);
                        break;
                    case "pasamanos":
                        vivienda.setPasamanos(true);
                        break;
                    case "obstaculo":
                        vivienda.setObstaculos(true);
                        break;
                }
            }
        }
        
        
        // ===== ALMACENAMIENTO EN LA BASE DE DATOS =====
        DbConnection conn = new DbConnection();
        ViviendaDao viviendaDao = new ViviendaDao(conn);
        int idVivienda = viviendaDao.insertIntoVivienda(vivienda);
        viviendaDao.update(idValoracion, idVivienda);
        if(vivienda.getCompanieros()!=null){
            viviendaDao.insertIntoViviendaCompaniero(idVivienda, vivienda.getCompanieros());
        }
        // ===== OBTECIÓN DE ID DIAGNOSTICO =====
        DiagnosticoSocialDao diagnosticoDao = new DiagnosticoSocialDao(conn);
        int idDiagnositico = diagnosticoDao.getIdDiagnosticoSocial(idValoracion);
        
        conn.disconnect();
        
        // ===== OBTECIÓN DE DATOS DE DIAGNOSTICO =====
        if(idDiagnositico!=1){
            DiagnosticoSocialController diagnosticoController = new DiagnosticoSocialController();
            diagnosticoController.modificarDiagnosticoSocial(request, idValoracion);
        }
        
        conn = new DbConnection();
        ValoracionDao valoracionDao = new ValoracionDao(conn);
        Valoracion valoracion = valoracionDao.getValoracion(idValoracion);
        UsuarioPacienteDao pacienteDao = new UsuarioPacienteDao(conn);
        UsuarioPaciente paciente = pacienteDao.getPacientePorRegisto(idValoracion);
        conn.disconnect();
        
        request.setAttribute("paciente", paciente);
        request.setAttribute("valoracion", valoracion);
        request.setAttribute("sesion", sesion);
        
        RequestDispatcher rd = request.getRequestDispatcher("/page10.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("sesion", sesion);
        
        RequestDispatcher rd = request.getRequestDispatcher("/page9.jsp");
        rd.forward(request, response);
    }
    
    protected void modificarVivienda(HttpServletRequest request, int idValoracion){
        // ===== DEVOLUACIÓN DE VALORES POR JSP =====
        DbConnection conn = new DbConnection();
        
        ViviendaDao viviendaDao = new ViviendaDao(conn);
        Vivienda vivienda = viviendaDao.getVivienda(idValoracion);
        List<String> companieros = viviendaDao.getCompanieros(idValoracion);
        conn.disconnect();
        
        List<String> tenencias = new LinkedList<>();
        if(vivienda.getTenencia()!=null && !vivienda.getTenencia().equals("casa propia")&& !vivienda.getTenencia().equals("rentada") && !vivienda.getTenencia().equals("prestada") && !vivienda.getTenencia().equals("casa de un hijo")){
            tenencias.add(vivienda.getTenencia());
        }
        
        List<String> tipos = new LinkedList<>();
        if(vivienda.getTipo()!=null && !vivienda.getTipo().equals("casa sola")&& !vivienda.getTipo().equals("departamento") && !vivienda.getTipo().equals("cuarto redondo") && !vivienda.getTipo().equals("vecindad")){
            tipos.add(vivienda.getTipo());
        }
        
        request.setAttribute("tendenciaVivienda", vivienda.getTenencia());
        request.setAttribute("tipoVivienda", vivienda.getTipo());
        request.setAttribute("zona", vivienda.getZona());
        request.setAttribute("dormitorioCompartido", vivienda.isDormitorio_compartido()? "true" : "false");
        request.setAttribute("ubicacionDormitorio", vivienda.getPlanta());
        request.setAttribute("accesoBanio", vivienda.isAcceso_banio()? "true" : "false");
        request.setAttribute("elevador", vivienda.isElevador()? "true" : "false");
        request.setAttribute("escaleras", vivienda.isEscaleras()? "true" : "false");
        request.setAttribute("alfombra", vivienda.isAlfombra()? "true" : "false");
        request.setAttribute("desniveles", vivienda.isDesniveles()? "true" : "false");
        request.setAttribute("pasamanos", vivienda.isPasamanos()? "true" : "false");
        request.setAttribute("obstaculos", vivienda.isObstaculos()? "true" : "false");
        request.setAttribute("caidas", vivienda.isCaidas()? "true" : "false");
        request.setAttribute("caidaEspecificacion", vivienda.getEspecificacion());
        request.setAttribute("observacion", vivienda.getObservacion());
        request.setAttribute("companieros", companieros);
        request.setAttribute("tenencias", tenencias);
        request.setAttribute("tipos", tipos);
    }
}
