package controller;

import beans.SessionBean;
import dao.DbConnection;
import dao.EconomiaDao;
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
import model.Economia;
import model.UsuarioPaciente;
import model.Valoracion;

public class EconomiaController extends HttpServlet {
    
    //bean de la sesion
    @EJB
    SessionBean sesion;
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.getSession();
        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int idValoracion = Integer.parseInt(request.getParameter("id"));
        String situcionEconomicaParam = request.getParameter("economiaFamiliar");
        String[]proveedoresParam = request.getParameterValues("administradores");
        String[]institucionesParam = request.getParameterValues("compradores");
        String observacionParam = request.getParameter("observaciones");
        double ingresoPacienteParam = !request.getParameter("paciente").isEmpty() ? Double.parseDouble(request.getParameter("paciente")) : 0;
        double ingresoGobiernoParam = !request.getParameter("gobierno").isEmpty() ? Double.parseDouble(request.getParameter("gobierno")) : 0;
        double ingresoHogarParam = !request.getParameter("hogar").isEmpty() ? Double.parseDouble(request.getParameter("hogar")) : 0;
        double ingresoNoHogarParam = !request.getParameter("noHogar").isEmpty() ? Double.parseDouble(request.getParameter("noHogar")) : 0;
        double ingresoOtroParam = !request.getParameter("otro").isEmpty() ? Double.parseDouble(request.getParameter("otro")) : 0;
        
        // ===== CREACIÓN DEL OBJETO =====
        Economia economia = new Economia ();
        economia.setSituacionEconomica(situcionEconomicaParam);
        economia.setProveedores(proveedoresParam);
        economia.setIngresoPaciente(ingresoPacienteParam);
        economia.setIngresoGobierno(ingresoGobiernoParam);
        economia.setIngresoHogar(ingresoHogarParam);
        economia.setIngresoNoHogar(ingresoNoHogarParam);
        economia.setIngresoOtro(ingresoOtroParam);
        economia.setInstituciones(institucionesParam);
        economia.setObservacion(observacionParam);
        
        // ===== ALMACENAMIENTO EN LA BASE DE DATOS =====
        DbConnection conn = new DbConnection();
        EconomiaDao economiaDao = new EconomiaDao(conn);
        int idEconomia = economiaDao.insertIntoEconomia(economia);
        economiaDao.update(idValoracion, idEconomia);
        if(economia.getProveedores()!=null){
            economiaDao.insertIntoEconomiaProveedor(idEconomia, economia.getProveedores());
        }
        if(economia.getInstituciones()!=null){
            economiaDao.insertIntoEconomiaInstitucion(idEconomia, economia.getInstituciones());
        }
        
        // ===== OBTECIÓN DE ID TRATAMIENTO=====
        ServicioMedicoDao servicioMedicoDao = new ServicioMedicoDao(conn);
        int idServicio = servicioMedicoDao.getIdServicioMedico(idValoracion);
        
        conn.disconnect();
        
        // ===== OBTECIÓN DE DATOS DE TRATAMIENTO =====
        if(idServicio!=1){
            ServicioMedicoController servicioController = new ServicioMedicoController();
            servicioController.modificarServicioMedico(request, idValoracion);
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

        
        RequestDispatcher rd = request.getRequestDispatcher("/page7.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        
        request.setAttribute("sesion", sesion);
        
        RequestDispatcher rd = request.getRequestDispatcher("/page6.jsp");
        rd.forward(request, response);
    }
    
    protected void modificarEconomia(HttpServletRequest request, int idValoracion){
        // ===== DEVOLUACIÓN DE VALORES POR JSP =====
        DbConnection conn = new DbConnection();
        
        EconomiaDao economiaDao = new EconomiaDao(conn);
        Economia economia = economiaDao.getEconomia(idValoracion);
        List<String> instituciones = economiaDao.getInstituciones(idValoracion);
        List<String> proveedores = economiaDao.getProveedores(idValoracion);
        conn.disconnect();
        
        String conyuge = "false", hijo = "false", nieto = "false", hermano = "false", nuera = "false", yerno = "false", sobrino = "false", primo = "false";
        List<String> proveedoresExtra = new LinkedList<>();
        if(proveedores != null){
            for(String proveedor : proveedores){
                switch(proveedor){
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
                    case "primo":
                        primo = "true";
                        break;
                    default:
                        proveedoresExtra.add(proveedor);
                }
            }
        }
        
        String GDF = "true";
        List<String> institucionesExtra = new LinkedList<>();
        if(instituciones != null){
            for(String tipoApoyo : instituciones){
                switch(tipoApoyo){
                    case "GDF":
                        GDF = "true";
                        break;
                    default: institucionesExtra.add(tipoApoyo);
                }
            }
        }
        
        request.setAttribute("familiaProcedimiento", economia.getSituacionEconomica());
        request.setAttribute("conyuge", conyuge);
        request.setAttribute("hijo", hijo);
        request.setAttribute("nieto", nieto);
        request.setAttribute("hermano", hermano);
        request.setAttribute("nuera", nuera);
        request.setAttribute("yerno", yerno);
        request.setAttribute("sobrino", sobrino);
        request.setAttribute("primo", primo);
        request.setAttribute("proveedoresExtra", proveedoresExtra);
        request.setAttribute("mala", economia.getSituacionEconomica());
        request.setAttribute("ingresoPaciente", economia.getIngresoPaciente());
        request.setAttribute("ingresoGobierno", economia.getIngresoGobierno());
        request.setAttribute("aportacionesSi", economia.getIngresoHogar());
        request.setAttribute("aportacionesNo", economia.getIngresoNoHogar());
        request.setAttribute("ingresoTotal", economia.getIngresoTotal());
        request.setAttribute("otras", economia.getIngresoOtro());
        request.setAttribute("total", economia.getIngresoTotal());
        request.setAttribute("GDF", GDF);
        request.setAttribute("institucionesExtra", institucionesExtra);
        request.setAttribute("observacion", economia.getObservacion());
    }
}
