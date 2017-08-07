package controller;

import beans.SessionBean;
import dao.DbConnection;
import dao.MaltratoDao;
import dao.ServicioMedicoDao;
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
import model.ServicioMedico;
import model.UsuarioPaciente;
import model.Valoracion;

public class ServicioMedicoController extends HttpServlet {
    
    //bean de la sesion
    @EJB
    SessionBean sesion;
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.getSession();
        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int idValoracion = Integer.parseInt(request.getParameter("id"));
        String[]derechohabientesParam = request.getParameterValues("derechohabientes");
        boolean seguroGastosMedicosParam = request.getParameter("gastosMedico").equals("si");
        String observacionParam = request.getParameter("observaciones");
        
        // ===== CREACIÓN DEL OBJETO =====
        ServicioMedico servicio = new ServicioMedico ();
        servicio.setDerechohabientes(derechohabientesParam);
        servicio.setSeguroGastosMedico(seguroGastosMedicosParam);
        servicio.setObervacion(observacionParam);
        
        
        // ===== ALMACENAMIENTO EN LA BASE DE DATOS =====
        DbConnection conn = new DbConnection();
        ServicioMedicoDao servicioDao = new ServicioMedicoDao(conn);
        int idServicioMedico = servicioDao.insertIntoServicioMedico(servicio);
        servicioDao.update(idValoracion, idServicioMedico);
        if(servicio.getDerechohabientes()!=null){
            servicioDao.insertIntoPacienteDerechohabiente(servicio.getDerechohabientes(), idServicioMedico);
        }
        // ===== OBTECIÓN DE ID MALTRATO =====
        MaltratoDao maltratoDao = new MaltratoDao(conn);
        int idMaltrato = maltratoDao.getIdMaltrato(idValoracion);
        
        conn.disconnect();
        
        // ===== OBTECIÓN DE DATOS DE MALTRATO =====
        if(idMaltrato!=1){
            MaltratoController maltratoController = new MaltratoController();
            maltratoController.modificarMaltrato(request, idValoracion);
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
        
        RequestDispatcher rd = request.getRequestDispatcher("/page8.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        
        request.setAttribute("sesion", sesion);
        
        RequestDispatcher rd = request.getRequestDispatcher("/page7.jsp");
        rd.forward(request, response);
    }
    
    protected void modificarServicioMedico(HttpServletRequest request, int idValoracion){
        // ===== DEVOLUACIÓN DE VALORES POR JSP =====
        DbConnection conn = new DbConnection();
        
        ServicioMedicoDao servicioMedicoDao = new ServicioMedicoDao(conn);
        ServicioMedico servicioMedico = servicioMedicoDao.getServicioMedico(idValoracion);
        List<String> derechohabientes = servicioMedicoDao.getDerechoHabientes(idValoracion);
        conn.disconnect();
        
        
        String imss="false", issste="false", seguro="false", gastosMedicos="no";
        List<String> derechohabientesExtra = new LinkedList<>();
        if(derechohabientes != null){
            for(String derechohabiente : derechohabientes){
                switch(derechohabiente){
                    case "IMSS":
                        imss = "true";
                        break;
                    case "ISSSTE":
                        issste = "true";
                        break;
                    case "Seguro Popular":
                        seguro = "true";
                        break;
                    default: derechohabientesExtra.add(derechohabiente);
                }
            }
        }
        
        if(servicioMedico.isSeguroGastosMedico()){
            gastosMedicos="si";
        }
        
        request.setAttribute("imss", imss);
        request.setAttribute("issste", issste);
        request.setAttribute("seguroPopular", seguro);
        request.setAttribute("derechohabientesExtra", derechohabientesExtra);
        request.setAttribute("gastosMedicos", gastosMedicos);
        request.setAttribute("observacion", servicioMedico.getObervacion());
    }
}
