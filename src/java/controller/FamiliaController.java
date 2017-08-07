package controller;

import beans.SessionBean;
import dao.DbConnection;
import dao.EconomiaDao;
import dao.FamiliaDao;
import dao.UsuarioPacienteDao;
import dao.ValoracionDao;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Familia;
import model.UsuarioPaciente;
import model.Valoracion;

public class FamiliaController extends HttpServlet {
    
     //bean de la sesion
    @EJB
    SessionBean sesion;
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.getSession();
        
        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int idValoracion = Integer.parseInt(request.getParameter("id"));
        String[]familiaOrigenParam = request.getParameterValues("familiaOrigen");
        String[]conyugueHijosParam = request.getParameterValues("conyugueHijos");
        String relacionParam = request.getParameter("relacion");
        String tipoParam = request.getParameter("tipo");
        String cicloParam = request.getParameter("ciclo");
        String observacionParam = request.getParameter("observaciones");
        
        // ===== CREACIÓN DEL OBJETO =====
        Familia familia = new Familia ();
        familia.setProblemasOrigen(familiaOrigenParam);
        familia.setProblemasConyugales(conyugueHijosParam);
        familia.setRelacionFamiliar(relacionParam);
        familia.setTipoFamilia(tipoParam);
        familia.setCiclo(cicloParam);
        familia.setObservacion(observacionParam);
        
        // ===== ALMACENAMIENTO EN LA BASE DE DATOS =====
        DbConnection conn = new DbConnection ();
        FamiliaDao familiaDao = new FamiliaDao(conn);
        int idFamilia = familiaDao.insertIntoFamilia(familia);
        familiaDao.update(idValoracion, idFamilia);
        if(familia.getProblemasOrigen()!=null){
            for(String problema: familia.getProblemasOrigen()){
                familiaDao.insertIntoFamiliaProblema(idFamilia, problema, "familia de origen");
            }
        }
        if(familia.getProblemasConyugales()!=null){
            for(String problema: familia.getProblemasConyugales()){
                familiaDao.insertIntoFamiliaProblema(idFamilia, problema, "conyugales e hijos");
            }
        }
        
        // ===== OBTECIÓN DE ID TRATAMIENTO=====
        EconomiaDao economiaDao = new EconomiaDao(conn);
        int idEconomia = economiaDao.getIdEconomia(idValoracion);
        
        conn.disconnect();
        
        // ===== OBTECIÓN DE DATOS DE TRATAMIENTO =====
        if(idEconomia!=1){
            EconomiaController economiaController = new EconomiaController();
            economiaController.modificarEconomia(request, idValoracion);
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
        
        RequestDispatcher rd = request.getRequestDispatcher("/page6.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        
        request.setAttribute("sesion", sesion);
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        DbConnection conn = new DbConnection();
        FamiliaDao familiaDao = new FamiliaDao(conn);
        Familia familia = familiaDao.getFamilia(id);
        List<String> problemaConyugales = familiaDao.getProblemasConyugales(id);
        List<String> problemaOrigen = familiaDao.getProblemasOrigen(id);
        conn.disconnect();
        
        request.setAttribute("familiaProcedimiento", familia.getRelacionFamiliar());
        request.setAttribute("problemaConyugales", problemaConyugales);
        request.setAttribute("familiar", problemaOrigen);
        
        RequestDispatcher rd = request.getRequestDispatcher("/page5.jsp");
        rd.forward(request, response);
    }
    
    protected void modificarFamilia(HttpServletRequest request, int idValoracion){
        
         // ===== DEVOLUACIÓN DE VALORES POR JSP =====
        DbConnection conn = new DbConnection();
        
        FamiliaDao familiaDao = new FamiliaDao(conn);
        Familia familia = familiaDao.getFamilia(idValoracion);
        List<String> problemaConyugales = familiaDao.getProblemasConyugales(idValoracion);
        List<String> problemaOrigen = familiaDao.getProblemasOrigen(idValoracion);
        conn.disconnect();
        
        
        request.setAttribute("relacion", familia.getRelacionFamiliar());
        request.setAttribute("tipo", familia.getTipoFamilia());
        request.setAttribute("ciclo", familia.getCiclo());
        request.setAttribute("observacion", familia.getObservacion());
        request.setAttribute("problemasOrigen", problemaOrigen);
        request.setAttribute("problemasConyugales", problemaConyugales);
    }
}
