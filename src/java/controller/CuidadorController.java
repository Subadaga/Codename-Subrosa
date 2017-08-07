
package controller;

import beans.SessionBean;
import dao.CuidadorDao;
import dao.DbConnection;
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
import model.Cuidador;
import model.UsuarioPaciente;
import model.Valoracion;

public class CuidadorController extends HttpServlet {
    
    //bean de la sesion
    @EJB
    SessionBean sesion;
            
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        request.getSession();
        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int idValoracion = Integer.parseInt(request.getParameter("id"));
        String nombreParam = request.getParameter("nombre");
        String nacimientoParam = request.getParameter("nacimiento");
        String ocupacionParam = request.getParameter("ocupacion");
        String telfonoUnoParam = request.getParameter("telefonoUno");
        String telefonoDosParam = request.getParameter("telefonoDos");
        String correoParam = request.getParameter("correo");
        String viveConElPacienteParam = request.getParameter("viveConElPaciente");
        String mesesParam = request.getParameter("cuidadoMeses");
        String aniosParam = request.getParameter("cuidadoAnios");
        String parentescoParam = request.getParameter("parentesco");
        String estadoCivilParam = request.getParameter("estadoCivil");
        String escolaridadParam = request.getParameter("escolaridad");
        String[]funcionesParam = request.getParameterValues("funciones");
        String[]conflictosGeneralesParam = request.getParameterValues("problemas");
        String escalaZaritParam = request.getParameter("zarit");
        String observacionParam = request.getParameter("observacion");
        
        // ===== CREACIÓN DEL OBJETO =====
        Cuidador  cuidador = new Cuidador();
        
        cuidador.setNombre(nombreParam);
        cuidador.setNacimiento(nacimientoParam);
        cuidador.setOcupacion(ocupacionParam);
        cuidador.setTelefonoUno(telfonoUnoParam);
        cuidador.setTelefonoDos(telefonoDosParam);
        cuidador.setCorreo(correoParam);
        cuidador.setTiempoCuidando(mesesParam, aniosParam);
        cuidador.setParentesco(parentescoParam);
        cuidador.setEstadoCivil(estadoCivilParam);
        cuidador.setEscolaridad(escolaridadParam);
        cuidador.setFunciones(funcionesParam);
        cuidador.setConflictosGenerales(conflictosGeneralesParam);
        cuidador.setEscalaZarit(escalaZaritParam);
        cuidador.setObservacion(observacionParam);
        if(viveConElPacienteParam!=null  && viveConElPacienteParam.equals("si")){
            cuidador.setViveConElPaciente(true);
        }
        else{
            cuidador.setViveConElPaciente(false);
        }
        
        // ===== ALMACENAMIENTO EN LA BASE DE DATOS =====
        DbConnection conn = new DbConnection();
        CuidadorDao cuidadorDao = new CuidadorDao(conn);
        int idCuidador = cuidadorDao.insertIntoCuidador(cuidador);
        cuidadorDao.update(idValoracion, idCuidador);
        if(cuidador.getFunciones()!=null){
            cuidadorDao.insertIntoCuidadorFuncion(cuidador.getFunciones(), idCuidador);
        }
        if(cuidador.getConflictosGenerales()!=null){
            cuidadorDao.insertIntoCuidadorConflicto(cuidador.getConflictosGenerales(), idCuidador);
        }
        
        // ===== OBTECIÓN DE ID TRATAMIENTO=====
        TratamientoDao tratamientoDao = new TratamientoDao(conn);
        int idTratamiento = tratamientoDao.getIdTratamiento(idValoracion);
        
        conn.disconnect();
        
        // ===== OBTECIÓN DE DATOS DE TRATAMIENTO =====
        if(idTratamiento!=1){
            TratamientoFarmocologicoController tratamientoController = new TratamientoFarmocologicoController();
            tratamientoController.modificarTratamiento(request, idValoracion);
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
        
        RequestDispatcher rd = request.getRequestDispatcher("/page3.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        
        request.setAttribute("sesion", sesion);

        
        RequestDispatcher rd = request.getRequestDispatcher("/page2.jsp");
        rd.forward(request, response);
    }
    
    protected void modificarCuidador(HttpServletRequest request, int idValoracion){
        // ===== DEVOLUACIÓN DE VALORES POR JSP =====
        DbConnection conn = new DbConnection();
        
        CuidadorDao cuidadorDao = new CuidadorDao(conn);
        Cuidador cuidador = cuidadorDao.getCuidador(idValoracion);
        List<String> funciones = cuidadorDao.getFunciones(idValoracion);
        List<String> conflictos = cuidadorDao.getConflictosGenerales(idValoracion);
        conn.disconnect();
        
        String resCompania = "false", resABVD = "false", resAIVD = "false", resSalud = "false", resFinancieros = "false", resPsicologicos = "false", resFamiliares="false";
        
        
        List<String> parentescoExtra = new LinkedList<>();
        if(cuidador.getParentesco() != null){
            if(cuidador.getParentesco().equals("hijo") && cuidador.getParentesco().equals("cónyuge") && cuidador.getParentesco().equals("amigo") && cuidador.getParentesco().equals("nieto") && cuidador.getParentesco().equals("hermano") && cuidador.getParentesco().equals("nuera") && cuidador.getParentesco().equals("yerno") && cuidador.getParentesco().equals("sobrino")){
            }
            else{
                parentescoExtra.add(cuidador.getParentesco());
            }
        }
        
        
        List<String> funcionesExtras = new LinkedList<>();
        if(funciones != null){
            for(String valor : funciones){
                switch(valor){
                    case "compañía":
                        resCompania = "true";
                        break;
                    case "apoyo a las abvd":
                        resCompania = "true";
                        break;
                    case "apoyo a las aivd":
                        resAIVD = "true";
                        break;
                    default:
                        funcionesExtras.add(valor);
                }
            }
        }
        
        List<String> conflictosExtras = new LinkedList<>();
        if(conflictos != null){
            for(String valor : conflictos){
                switch(valor){
                    case "salud":
                        resSalud = "true";
                        break;
                    case "financieros":
                        resFinancieros = "true";
                        break;
                    case "psicológicos":
                        resPsicologicos = "true";
                        break;
                    case "familiares":
                        resFamiliares = "true";
                        break;
                    default:
                        conflictosExtras.add(valor);
                }
            }
        }
        
        request.setAttribute("nombreCuidador", cuidador.getNombre());
        request.setAttribute("fechaNacimiento", cuidador.getNacimiento());
        request.setAttribute("ocupacion", cuidador.getOcupacion());
        request.setAttribute("telefonico1", cuidador.getTelefonoUno());
        request.setAttribute("telefonico2", cuidador.getTelefonoDos());
        request.setAttribute("correo", cuidador.getCorreo());
        request.setAttribute("vive", cuidador.isViveConElPaciente());
        request.setAttribute("mes", cuidador.getMes());
        request.setAttribute("anio", cuidador.getAnio());
        request.setAttribute("parentesco", cuidador.getParentesco());
        request.setAttribute("estadoC", cuidador.getEstadoCivil());
        request.setAttribute("escolaridad", cuidador.getEscolaridad());
        request.setAttribute("zarit", cuidador.getEscalaZarit());
        request.setAttribute("observacion", cuidador.getObservacion());
        request.setAttribute("compania", resCompania);
        request.setAttribute("apoyoABVD", resABVD);
        request.setAttribute("apoyoAIVD", resAIVD);
        request.setAttribute("salud", resSalud);
        request.setAttribute("financieros", resFinancieros);
        request.setAttribute("psicologicos", resPsicologicos);
        request.setAttribute("familiares", resFamiliares);
        request.setAttribute("conflictosExtras", conflictosExtras);
        request.setAttribute("funcionesExtras", funcionesExtras);
    }
    
}
