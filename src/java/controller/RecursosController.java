package controller;

import beans.SessionBean;
import dao.DbConnection;
import dao.FamiliaDao;
import dao.RecursosDao;
import dao.UsuarioPacienteDao;
import dao.ValoracionDao;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Recursos;
import model.UsuarioPaciente;
import model.Valoracion;

@WebServlet(name = "RecursosController", urlPatterns = {"/recursos"})
public class RecursosController extends HttpServlet {
    
    //bean de la sesion
    @EJB
    SessionBean sesion;
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.getSession();
        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int idValoracion = Integer.parseInt(request.getParameter("id"));
        String[]redesDeApoyoParam = request.getParameterValues("redDeApoyo");
        String obervacionParam = request.getParameter("observaciones");
        
        // ===== CREACIÓN DEL OBJETO =====
        Recursos recursos = new Recursos();
        if(redesDeApoyoParam!=null){
            for(String redDeApoyo: redesDeApoyoParam){
                if(redDeApoyo.equals("familiar")){
                    recursos.setRedFamiliar(true);
                }
                if(redDeApoyo.equals("extra-familiar")){
                    recursos.setRedExtraFamiliar(true);
                }
                if(redDeApoyo.equals("institucional")){
                    recursos.setRedInstitucional(true);
                }
            }
        }
        
        recursos.setObservacion(obervacionParam);
        
        // ===== ALMACENAMIENTO EN LA BASE DE DATOS =====
        DbConnection conn = new DbConnection();
        RecursosDao recursosDao = new RecursosDao(conn);
        int idRecursos = recursosDao.insertIntoRecursos(recursos);
        recursosDao.update(idValoracion, idRecursos);
        
        // ===== OBTECIÓN DE ID TRATAMIENTO=====
        FamiliaDao familiaDao = new FamiliaDao(conn);
        int idFamilia = familiaDao.getIdFamilia(idValoracion);
        
        conn.disconnect();
        
        // ===== OBTECIÓN DE DATOS DE TRATAMIENTO =====
        if(idFamilia!=1){
            FamiliaController familiaController = new FamiliaController();
            familiaController.modificarFamilia(request, idValoracion);
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
        
        RequestDispatcher rd = request.getRequestDispatcher("/page5.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("sesion", sesion);
        
        RequestDispatcher rd = request.getRequestDispatcher("/page4");
        rd.forward(request, response);
    }
    
    protected void modificarRecursos(HttpServletRequest request, int idValoracion){
        
        // ===== DEVOLUACIÓN DE VALORES POR JSP =====
        DbConnection conn = new DbConnection();
        
        RecursosDao recursosDao = new RecursosDao(conn);
        Recursos recursos = recursosDao.getRecursos(idValoracion);
        conn.disconnect();
        
        String familiar = "false", extraFamiliar = "false", institucional="false";
        if(recursos.isRedFamiliar()){
            familiar = "true";
        }
        if(recursos.isRedExtraFamiliar()){
            extraFamiliar = "true";
        }
        if(recursos.isRedInstitucional()){
            institucional = "true";
        }
        
        request.setAttribute("familiar", familiar);
        request.setAttribute("extraFamiliar", extraFamiliar);
        request.setAttribute("institucional", institucional);
        request.setAttribute("observacion", recursos.getObservacion());
    }
}
