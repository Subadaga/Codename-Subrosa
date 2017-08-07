
package controller;

import beans.SessionBean;
import dao.AbordajeSocialDao;
import dao.DbConnection;
import dao.UsuarioPacienteDao;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AbordajeSocial;
import model.UsuarioPaciente;

public class AbordajeSocialController extends HttpServlet {
    
    //bean de la sesion
    @EJB
    SessionBean sesion;
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.getSession();

        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int idValoracion = Integer.parseInt(request.getParameter("id"));
        String[] abordajesParam = request.getParameterValues("abordaje");
        String citaParam = request.getParameter("citaText");
        String observacionParam = request.getParameter("observaciones");
        
        // ===== CREACIÓN DEL OBJETO =====
        AbordajeSocial abordaje = new AbordajeSocial ();
        abordaje.setAbordajes(abordajesParam);
        abordaje.setCita(citaParam);
        abordaje.setObservacion(observacionParam);
        
        // ===== ALMACENAMIENTO EN LA BASE DE DATOS ======
        DbConnection conn = new DbConnection();
        AbordajeSocialDao abordajeDao = new AbordajeSocialDao(conn);
        int idAbordaje = abordajeDao.insertIntoAbordaje(abordaje);
        abordajeDao.update(idValoracion, idAbordaje);
        if(abordaje.getAbordajes() != null){
            abordajeDao.insertIntoAbordajeAsesoria(idAbordaje, abordaje.getAbordajes());
        }
        if(abordaje.getCita() != null){
            abordajeDao.insertIntoAbordajeCita(idAbordaje, abordaje.getCita());
        }
        
        // ===== VARIABLES DE SESION =====
        HttpSession pacienteSession = request.getSession();
        UsuarioPacienteDao pacienteDao = new UsuarioPacienteDao(conn);
        UsuarioPaciente paciente = pacienteDao.getPacientePorRegisto(idValoracion);
        conn.disconnect();
        
        pacienteSession.setAttribute("paciente", paciente);
        request.setAttribute("sesion", sesion);

        
        RequestDispatcher rd = request.getRequestDispatcher("/pageHistorico.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        
        request.setAttribute("sesion", sesion);

        
        RequestDispatcher rd = request.getRequestDispatcher("/page11.jsp");
        rd.forward(request, response);
    }
    
    protected void modificarAbordajeSocial(HttpServletRequest request, int idValoracion){
        // ===== DEVOLUACIÓN DE VALORES POR JSP =====
        DbConnection conn = new DbConnection();
        
        AbordajeSocialDao abordajeDao = new AbordajeSocialDao(conn);
        AbordajeSocial abordaje = abordajeDao.getAbordajeSocial(idValoracion);
        List<String> asesorias = abordajeDao.getAsesoria(idValoracion);
        String cita = abordajeDao.getCita(idValoracion);
        conn.disconnect();
        
        String ans1="false", ans2="false", ans3="false", ans4="false", ans5="false", ans6="false", ans7="false", ans8="false", ans9="false", ans10="false", ans11="false", ans12="false", ans13="false", ans14="false", ans15="false", ans16="false", ans17="false", ans18="false", ans19="false";
        
        if(asesorias!=null){
            for(String asesoria: asesorias){
                switch(asesoria){
                    case "recomendación de redistribución de cuidados entre familiares":
                        ans1 = "true";
                        break;
                    case "acompañamiento emocional al paciente y cuidador primario":
                        ans2 = "true";
                        break;
                    case "intervención en crisis a familiar colapsado":
                        ans3 = "true";
                        break;
                    case "recomendación sobre ayuda externa a traves de agencias de cuidadores remunerados":
                        ans4 = "true";
                        break;
                    case "recomendaciones de prevencion de maltrato (tríptico)":
                        ans5 = "true";
                        break;
                    case "recomendaciones preventiva de colapso al cuidador":
                        ans6 = "true";
                        break;
                    case "entrega de tríptico de opciones de servicios de personas mayores":
                        ans7 = "true";
                        break;
                    case "orientación sobre derechos de personas mayores (privilegiar independencia y autonomía)":
                        ans8 = "true";
                        break;
                    case "localización familiar responsable":
                        ans9 = "true";
                        break;
                    case "orientación sobre dudas administrativas y atención intrahospitalaria":
                        ans10 = "true";
                        break;
                    case "reconocimiento escrito a la familia por participación activa en el cuidados al paciente":
                        ans11 = "true";
                        break;
                    case "recomendación de albergues":
                        ans12 = "true";
                        break;
                    case "orientación familiar sobre cuidados en pacientes con demencia":
                        ans13 = "true";
                        break;
                    case "recomendación de centros de dia o institucionalización":
                        ans14 = "true";
                        break;
                    case "ingresa a programa de apoyo de medicamentos":
                        ans15 = "true";
                        break;
                    case "cita a grupo de apoyo incmnsz de familiares de pacientes con demencia":
                        ans16 = "true";
                        break;
                    case "orientación de plan de alta":
                        ans17 = "true";
                        break;
                    case "cita familiar":
                        ans18 = "true";
                        break;
                    case "otro":
                        ans19 = "true";
                        break;
                }
            }
        }
        
        request.setAttribute("cita", cita);
        request.setAttribute("ans1", ans1);
        request.setAttribute("ans2", ans2);
        request.setAttribute("ans3", ans3);
        request.setAttribute("ans4", ans4);
        request.setAttribute("ans5", ans5);
        request.setAttribute("ans6", ans6);
        request.setAttribute("ans7", ans7);
        request.setAttribute("ans8", ans8);
        request.setAttribute("ans9", ans9);
        request.setAttribute("ans10", ans10);
        request.setAttribute("ans11", ans11);
        request.setAttribute("ans12", ans12);
        request.setAttribute("ans13", ans13);
        request.setAttribute("ans14", ans14);
        request.setAttribute("ans15", ans15);
        request.setAttribute("ans16", ans16);
        request.setAttribute("ans17", ans17);
        request.setAttribute("ans18", ans18);
        request.setAttribute("ans19", ans19);
        request.setAttribute("observacion", abordaje.getObservacion());
    }
}
