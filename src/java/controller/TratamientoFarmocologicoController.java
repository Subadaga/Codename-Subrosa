
package controller;

import beans.SessionBean;
import dao.DbConnection;
import dao.RecursosDao;
import dao.TratamientoDao;
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
import model.TratamientoFarmocologico;
import model.UsuarioPaciente;
import model.Valoracion;


public class TratamientoFarmocologicoController extends HttpServlet {
    
    //bean de la sesion
    @EJB
    SessionBean sesion;
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.getSession();
        
        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int idValoracion = Integer.parseInt(request.getParameter("id"));
        String[]medicinaParam = request.getParameterValues("medicina");
        String[]administradoresParam = request.getParameterValues("administradores");
        String[]compradoresParam = request.getParameterValues("compradores");
        String[]transportesParam = request.getParameterValues("transportes");
        String observacionesParam = request.getParameter("observaciones");
        
        // ===== CREACIÓN DEL OBJETO =====
        TratamientoFarmocologico tratamiento = new TratamientoFarmocologico ();
        
        tratamiento.setMedicinas(medicinaParam);
        tratamiento.setAdministradores(administradoresParam);
        tratamiento.setCompradores(compradoresParam);
        tratamiento.setTransportes(transportesParam);
        tratamiento.setObservacion(observacionesParam);
        
        // ===== ALMACENAMIENTO DE LA BASE DE DATOS =====
        DbConnection conn = new DbConnection ();
        TratamientoDao tratamientoDao = new TratamientoDao(conn);
        
        int idTratamiento = tratamientoDao.insertIntoTratamiento(tratamiento);
        tratamientoDao.update(idValoracion, idTratamiento);
        if(tratamiento.getMedicinas()!=null){
            tratamientoDao.insertIntoTratamientoMedicina(idTratamiento, tratamiento.getMedicinas());
        }
        if(tratamiento.getAdministradores()!=null){
            tratamientoDao.insertIntoTratamientoAdministrador(idTratamiento, tratamiento.getAdministradores());
        }
        if(tratamiento.getCompradores()!=null){
            tratamientoDao.insertIntoTratamientoComprador(idTratamiento, tratamiento.getCompradores());
        }
        if(tratamiento.getTransportes()!=null){
            tratamientoDao.insertIntoTratamientoTransporte(idTratamiento, tratamiento.getTransportes());
        }
        
        // ===== OBTECIÓN DE ID RECURSOS =====
        RecursosDao recursosDao = new RecursosDao(conn);
        int idRecursos = recursosDao.getIdRecursos(idValoracion);
        
        conn.disconnect();
        
        // ===== OBTECIÓN DE DATOS DE RECURSOS =====
        if(idRecursos!=1){
            RecursosController recursosController = new RecursosController();
            recursosController.modificarRecursos(request, idValoracion);
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
        
        RequestDispatcher rd = request.getRequestDispatcher("/page4.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        
        request.getParameter("id");
        
        request.setAttribute("valoracion", sesion);
        
        RequestDispatcher rd = request.getRequestDispatcher("/page3.jsp");
        rd.forward(request, response);
    }
    
    protected void modificarTratamiento(HttpServletRequest request, int idValoracion){
        // ===== DEVOLUACIÓN DE VALORES POR JSP =====
        DbConnection conn = new DbConnection();
        
        TratamientoDao tratamientoDao = new TratamientoDao(conn);
        TratamientoFarmocologico tratamiento = tratamientoDao.getTratamiento(idValoracion);
        List<String> medicinas = tratamientoDao.getMedicinas(idValoracion);
        List<String> administradores = tratamientoDao.getAdministradores(idValoracion);
        List<String> compradores = tratamientoDao.getCompradores(idValoracion);
        List<String> transportes = tratamientoDao.getTransportes(idValoracion);
        conn.disconnect();
        
        
        String paciente = "false", conyuge = "false", hijo = "false", nieto = "false", hermano = "false", nuera = "false", yerno = "false", sobrino = "false";
        List<String> administradoresExtras = new LinkedList<>();
        if(administradores != null){
            for(String administrador: administradores){
                switch(administrador){
                    case "paciente":
                        paciente = "true";
                        break;
                    case "cónyuge":
                        conyuge = "true";
                        break;
                    case "hijo":
                        hijo = "true";
                        break;
                    case "nieto":
                        nieto = "true";
                        break;
                    case "hermano":
                        hermano = "true";
                        break;
                    case "nuera":
                        nuera = "true";
                        break;
                    case "yerno":
                        yerno = "true";
                        break;
                    case "sobrino":
                        sobrino = "true";
                        break;
                    default:
                        administradoresExtras.add(administrador);
                }
            }
        }
        
        String pacienteCompra = "false", conyugeCompra = "false", hijoCompra = "false", nietoCompra = "false", hermanoCompra = "false", nueraCompra = "false", yernoCompra = "false", sobrinoCompra = "false";
        List<String> compradoresExtras = new LinkedList<>();
        if(compradores != null){
            for(String comprador: compradores){
                switch(comprador){
                    case "paciente":
                        pacienteCompra = "true";
                        break;
                    case "cónyuge":
                        conyugeCompra = "true";
                        break;
                    case "hijo":
                        hijoCompra = "true";
                        break;
                    case "nieto":
                        nietoCompra = "true";
                        break;
                    case "hermano":
                        hermanoCompra = "true";
                        break;
                    case "nuera":
                        nueraCompra = "true";
                        break;
                    case "yerno":
                        yernoCompra = "true";
                        break;
                    case "sobrino":
                        sobrinoCompra = "true";
                        break;
                    default:
                        compradoresExtras.add(comprador);
                }
            }
        }
        
        String autobusUrbano = "false", colectivo = "false", metro = "false", particular = "false", autobusForaneo = "false", taxi = "false";
        List<String> transportesExtras = new LinkedList<>();
        if(transportes != null){
            for(String transporte: transportes){
                switch(transporte){
                    case "autobús urbano":
                        autobusUrbano = "true";
                        break;
                    case "colectivo":
                        colectivo = "true";
                        break;
                    case "metro":
                        metro = "true";
                        break;
                    case "particular":
                        particular = "true";
                        break;
                    case "autobús foráneo":
                        autobusForaneo = "true";
                        break;
                    case "taxi":
                        taxi = "true";
                        break;
                    default:
                        transportesExtras.add(transporte);
                }
            }
        }
        
        request.setAttribute("pacienteAdmin", paciente);
        request.setAttribute("conyuge", conyuge);
        request.setAttribute("hijo", hijo);
        request.setAttribute("nieto", nieto);
        request.setAttribute("hermano", hermano);
        request.setAttribute("nuera", nuera);
        request.setAttribute("yerno", yerno);
        request.setAttribute("sobrino", sobrino);
        request.setAttribute("administradoresExtras", administradoresExtras);
        request.setAttribute("pacienteCompra", pacienteCompra);
        request.setAttribute("conyugeCompra", conyugeCompra);
        request.setAttribute("hijoCompra", hijoCompra);
        request.setAttribute("nietoCompra", nietoCompra);
        request.setAttribute("hermanoCompra", hermanoCompra);
        request.setAttribute("nueraCompra", nueraCompra);
        request.setAttribute("sobrinoCompra", sobrinoCompra);
        request.setAttribute("compradoresExtras", compradoresExtras);
        request.setAttribute("autobusUrbano", autobusUrbano);
        request.setAttribute("colectivo", colectivo);
        request.setAttribute("metro", metro);
        request.setAttribute("particular", particular);
        request.setAttribute("autobusForaneo", autobusForaneo);
        request.setAttribute("taxi", taxi);
        request.setAttribute("transportesExtras", transportesExtras);
        request.setAttribute("medicinas", medicinas);
        request.setAttribute("observacion", tratamiento.getObservacion());
    }

}
