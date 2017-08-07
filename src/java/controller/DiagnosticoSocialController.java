
package controller;

import beans.SessionBean;
import dao.AbordajeSocialDao;
import dao.DbConnection;
import dao.DiagnosticoSocialDao;
import dao.UsuarioPacienteDao;
import dao.ValoracionDao;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DiagnosticoSocial;
import model.UsuarioPaciente;
import model.Valoracion;

public class DiagnosticoSocialController extends HttpServlet {
    
    //bean de la sesion
    @EJB
    SessionBean sesion;
            
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.getSession();
        // ===== OBTECIÓN DE VALORES POR JSP =====
        int idValoracion = Integer.parseInt(request.getParameter("id"));
        boolean patologiaParam = request.getParameter("patologia")!= null && request.getParameter("patologia").equals("si");
        String familiaParam = request.getParameter("familia");
        String[]historiaFamiliarParam = request.getParameterValues("historiaFamiliar");
        boolean comunicacionParam = request.getParameter("problemasComunicacion") != null && request.getParameter("problemasComunicacion").equals("si");
        String[]redDeApoyoParam = request.getParameterValues("redDeApoyo");
        String desgasteEmocionalParam = request.getParameter("desgasteEmocional");
        String cuidadoParam = request.getParameter("cuidado");
        String supervisionParam = request.getParameter("supervision");
        boolean deteccionDeMaltratoParam = request.getParameter("patologia") != null && request.getParameter("deteccionDeMaltrato").equals("si");
        String[] clasificacionParam = request.getParameterValues("clasificacionDeMaltrato");
        String colapsoParam = request.getParameter("colapso");
        boolean riegoParam = request.getParameter("riesgo") != null && request.getParameter("riesgo").equals("si");
        String nivelSocioeconomicoParam = request.getParameter("nivelSocioeconomico");
        String[]desapegosParam = request.getParameterValues("desapegoTerapeutico");
        String[]quejasParam = request.getParameterValues("queja");
        String observacionParam = request.getParameter("observaciones");
        
        // ===== CREACIÓN DE OBJETO =====
        DiagnosticoSocial diagnostico = new DiagnosticoSocial();
        diagnostico.setPatologia(patologiaParam);
        diagnostico.setFamilia(familiaParam);
        if(historiaFamiliarParam != null){
            for(String dato : historiaFamiliarParam){
                if(dato.equals("actual")){
                    diagnostico.setConflictoActual(true);
                }
                else{
                    diagnostico.setConflictoHistorico(true);
                }
            }
        }
        diagnostico.setComunicacion(comunicacionParam);
        if(redDeApoyoParam != null){
            for(String dato : redDeApoyoParam){
                switch(dato){
                    case "familiar":
                        diagnostico.setRedFamiliar(true);
                        break;
                    case "extra-familiar":
                        diagnostico.setRedExtrafamiliar(true);
                        break;
                    case "institucional":
                        diagnostico.setRedInstitucional(true);
                        break;
                }
            }
        }
        diagnostico.setDesgasteEmocional(desgasteEmocionalParam);
        diagnostico.setRedCuidados(cuidadoParam);
        diagnostico.setSupervision(supervisionParam);
        diagnostico.setDeteccionMaltrato(deteccionDeMaltratoParam);
        if(diagnostico.isDeteccionMaltrato()){
            diagnostico.setClasificacionesMaltrato(clasificacionParam);
        }
        diagnostico.setColapsoCuidador(colapsoParam);
        diagnostico.setRiesgosArquitectonicos(riegoParam);
        diagnostico.setNivelSocioeconomico(nivelSocioeconomicoParam);
        if(desapegosParam != null){
            diagnostico.setDesapegosTerapeuticos(desapegosParam);
        }
        if(quejasParam != null){
            diagnostico.setQuejas(quejasParam);
        }
        diagnostico.setObservacion(observacionParam);
        
        
        // ===== ALMACENAMIENTO EN LA BASE DE DATOS =====
        DbConnection conn = new DbConnection ();
        DiagnosticoSocialDao diagnosticoDao = new DiagnosticoSocialDao(conn); 
        int idDiagnostico = diagnosticoDao.insertIntoDiagnostico(diagnostico);
        diagnosticoDao.update(idValoracion, idDiagnostico);
        if(diagnostico.getClasificacionesMaltrato() != null){
            diagnosticoDao.insertIntoDiagnosticoClasificacionMaltrato(idDiagnostico, diagnostico.getClasificacionesMaltrato());
        }
        if(diagnostico.getDesapegosTerapeuticos() != null){
            diagnosticoDao.insertIntoDiagnosticoDesapegoTerapeutico(idDiagnostico, diagnostico.getDesapegosTerapeuticos());
        }
        if(diagnostico.getQuejas() != null){
            diagnosticoDao.insertIntoDiagnosticoArea(idDiagnostico, diagnostico.getQuejas());
        }
        // ===== OBTECIÓN DE ID ABORDAJE =====
        AbordajeSocialDao abordajeDao = new AbordajeSocialDao(conn);
        int idAbordaje = abordajeDao.getIdAbordajeSocial(idValoracion);
        
        conn.disconnect();
        
        // ===== OBTECIÓN DE DATOS DE ABORDAJE =====
        if(idAbordaje!=1){
            AbordajeSocialController abordajeController = new AbordajeSocialController();
            abordajeController.modificarAbordajeSocial(request, idValoracion);
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

        
        RequestDispatcher rd = request.getRequestDispatcher("/page11.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("sesion", sesion);

        
        RequestDispatcher rd = request.getRequestDispatcher("/page10.jsp");
        rd.forward(request, response);
    }
    
    protected void modificarDiagnosticoSocial(HttpServletRequest request, int idValoracion){
        // ===== DEVOLUACIÓN DE VALORES POR JSP =====
        DbConnection conn = new DbConnection();
        
        DiagnosticoSocialDao diagnosticoDao = new DiagnosticoSocialDao(conn);
        DiagnosticoSocial diagnostico = diagnosticoDao.getDiagnosticoSocial(idValoracion);
        List<String> desapegosTerapeuticos = diagnosticoDao.getDesapegosTerapeuticos(idValoracion);
        List<String> quejas = diagnosticoDao.getQuejas(idValoracion);
        conn.disconnect();
        
        String insolvencia = "false", apoyoFamiliar = "false";
        List<String> desapegosExtras = new LinkedList<>();
        if(desapegosTerapeuticos != null){
            for(String desapegoTerapeutico: desapegosTerapeuticos){
                switch(desapegoTerapeutico){
                    case "insolvencia económica":
                        insolvencia = "true";
                        break;
                    case "falta de apoyo familiar":
                        apoyoFamiliar = "true";
                        break;
                    default:
                        desapegosExtras.add(desapegoTerapeutico);
                }
            }
        }
        
        String cuota = "false", atencion = "false";
        List<String> quejasExtras = new LinkedList<>();
        if(quejas != null){
            for(String queja: quejas){
                switch(queja){
                    case "cuota de pago":
                        cuota = "true";
                        break;
                    case "atención médica":
                        atencion = "true";
                        break;
                    default:
                        quejasExtras.add(queja);
                }
            }
        }
        
       
        request.setAttribute("patologia", diagnostico.isPatologia()? "true" : "false");
        request.setAttribute("familia", diagnostico.getFamilia());
        request.setAttribute("conflictosActuales", diagnostico.isConflictoActual()? "true" : "false");
        request.setAttribute("conflictosHistoricos", diagnostico.isConflictoHistorico()? "true" : "false");
        request.setAttribute("comunicacion", diagnostico.isComunicacion() ? "true" : "false");
        request.setAttribute("familiar", diagnostico.isRedFamiliar() ? "true" : "false");
        request.setAttribute("extraFamiliar", diagnostico.isRedExtrafamiliar() ? "true" : "false");
        request.setAttribute("institucional", diagnostico.isRedInstitucional() ? "true" : "false");
        request.setAttribute("desgasteEmocional", diagnostico.getDesgasteEmocional());
        request.setAttribute("cuidado", diagnostico.getRedCuidados());
        request.setAttribute("supervision", diagnostico.getSupervision());
        request.setAttribute("deteccionMaltrato", diagnostico.isDeteccionMaltrato() ? "si" : "no");
        request.setAttribute("colapsoCuidador", diagnostico.getColapsoCuidador());
        request.setAttribute("riesgo", diagnostico.isRiesgosArquitectonicos() ? "si" : "no");
        request.setAttribute("nivelSocioeconomico", diagnostico.getNivelSocioeconomico());
        request.setAttribute("observacion", diagnostico.getObservacion());
        request.setAttribute("insolvencia", insolvencia);
        request.setAttribute("atencion", atencion);
        request.setAttribute("desapegosExtras", desapegosExtras);
        request.setAttribute("cuota", cuota);
        request.setAttribute("atencion", atencion);
        request.setAttribute("quejasExtras", quejasExtras);
    }
}
