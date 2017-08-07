package controller;

import beans.SessionBean;
import dao.DbConnection;
import dao.MaltratoDao;
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
import model.Maltrato;
import model.UsuarioPaciente;
import model.Valoracion;


public class MaltratoController extends HttpServlet {
    
    //bean de la sesion
    @EJB
    SessionBean sesion;
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.getSession();
        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int idValoracion = Integer.parseInt(request.getParameter("id"));
        boolean deteccionParam = request.getParameter("deteccionDeMaltrato").equals("si");
        String[] clasificacionParam = request.getParameterValues("clasificacionDeMaltrato");
        String[] generadoresParam = request.getParameterValues("generadorDeMaltrato");
        String observacionParam = request.getParameter("observaciones");
        
        // ===== CREACIÓN DEL OBJETO =====
        Maltrato maltrato = new Maltrato();
        maltrato.setDeteccionMaltrato(deteccionParam);
        maltrato.setObservacion(observacionParam);
        if(maltrato.isDeteccionMaltrato()){
            if(clasificacionParam != null){
                maltrato.setClasificaciones(clasificacionParam);
            }
            if(generadoresParam != null){
                maltrato.setGeneradores(generadoresParam);
            }
        }
        
        // ===== ALMACENAMIENTO EN LA BASE DE DATOS =====
        DbConnection conn = new DbConnection();
        MaltratoDao maltratoDao = new MaltratoDao(conn);
        int idMaltrato = maltratoDao.insertIntoMaltrato(maltrato);
        maltratoDao.update(idValoracion, idMaltrato);
        if(maltrato.getClasificaciones() != null){
            maltratoDao.insertIntoMaltratoClasificacion(idMaltrato, maltrato.getClasificaciones());
        }
        if(maltrato.getGeneradores() != null){
            maltratoDao.insertIntoMaltratoGenerador(idMaltrato, maltrato.getGeneradores());
        }
        // ===== OBTECIÓN DE ID VIVIENDA =====
        ViviendaDao viviendaDao = new ViviendaDao(conn);
        int idVivienda = viviendaDao.getIdVivienda(idValoracion);
        
        conn.disconnect();
        
        // ===== OBTECIÓN DE DATOS DE VIVIENDA =====
        if(idVivienda!=1){
            ViviendaController viviendaController = new ViviendaController();
            viviendaController.modificarVivienda(request, idValoracion);
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
        
        RequestDispatcher rd = request.getRequestDispatcher("/page9.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        
         request.setAttribute("sesion", sesion);
        
        RequestDispatcher rd = request.getRequestDispatcher("/page8.jsp");
        rd.forward(request, response);
    }
    
    protected void modificarMaltrato(HttpServletRequest request, int idValoracion){
        // ===== DEVOLUACIÓN DE VALORES POR JSP =====
        DbConnection conn = new DbConnection();
        
        MaltratoDao maltratoDao = new MaltratoDao(conn);
        Maltrato maltrato = maltratoDao.getMaltrato(idValoracion);
        List<String> clasificaciones = maltratoDao.getClasificacionesMaltrato(idValoracion);
        List<String> generadores = maltratoDao.getGeneradoresMaltrato(idValoracion);
        conn.disconnect();
        
        String psicoEmocional = "false", fisico = "false", negligencia = "false", sexual = "false", financiero = "false", patrimonial = "false", abandono = "false";
        List<String> clasificacionesExtras = new LinkedList<>();
        if(clasificaciones != null){
            for(String clasificacion: clasificaciones ){
                switch(clasificacion){
                    case "psico-emocional":
                        psicoEmocional = "true";
                        break;
                    case "físico":
                        fisico = "true";
                        break;
                    case "negligencia":
                        negligencia = "true";
                        break;
                    case "sexual":
                        sexual = "true";
                        break;
                    case "financiero":
                        financiero = "true";
                        break;
                    case "patrimonial":
                        patrimonial = "true";
                        break;      
                    case "abandono":
                        abandono = "true";
                        break;
                    default:
                        clasificacionesExtras.add(clasificacion);
                }
           
            }
       
        }
       
        String hijo = "false", conyuge = "false", nieto = "false", hermano = "false";
        List<String> generadoresExtras = new LinkedList<>();
        if(generadores != null){
            for(String generador: generadores){
                switch(generador){
                    case "hijo":
                            hijo = "true";
                            break;
                    case "conyuge":
                            conyuge = "true";
                            break;
                    case "nieto":
                            nieto = "true";
                            break;
                    case "hermano":
                            hermano = "true";
                            break;
                    default:
                            generadoresExtras.add(generador);
                }
            }
        }
        
        String deteccionMaltrato = "no";
        if(maltrato.isDeteccionMaltrato()){
            deteccionMaltrato = "si";
        }
       
       
        request.setAttribute("psicoEmocional", psicoEmocional);
        request.setAttribute("fisico", fisico);
        request.setAttribute("negligencia", negligencia);
        request.setAttribute("sexual", sexual);
        request.setAttribute("financiero", financiero);
        request.setAttribute("patrimonial", patrimonial);
        request.setAttribute("abandono", abandono);
        request.setAttribute("hijo", hijo);
        request.setAttribute("conyuge", conyuge);
        request.setAttribute("nieto", nieto);
        request.setAttribute("hermano", hermano);
        request.setAttribute("clasificacionesExtras", clasificacionesExtras);
        request.setAttribute("generadoresExtras", generadoresExtras);
        request.setAttribute("deteccionMaltrato", deteccionMaltrato);
        request.setAttribute("observacion", maltrato.getObservacion());
    }
}
