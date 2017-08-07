package controller;

import dao.CuidadorDao;
import dao.DbConnection;
import dao.EvaluacionPacienteDao;
import dao.UsuarioPacienteDao;
import dao.ValoracionDao;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.EvaluacionPaciente;
import model.UsuarioPaciente;
import model.Valoracion;

public class PacienteController extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        
        DbConnection conn = new DbConnection();
        ValoracionDao valoracionDao;
        Valoracion valoracion = null;
                
        //HttpSession valoracionSession = request.getSession();
        
        switch(action){
            case "crear":
                valoracionDao = new ValoracionDao(conn);
                id = valoracionDao.crearValoracion(id);
            case "modificar":
                valoracionDao = new ValoracionDao(conn);
                valoracion = valoracionDao.getValoracion(id);
                UsuarioPacienteDao pacienteDao = new UsuarioPacienteDao(conn);
                UsuarioPaciente paciente = pacienteDao.getRegistro(id);
                request.setAttribute("paciente", paciente);
                request.setAttribute("valoracion", valoracion);
                conn.disconnect();
                modificarPaciente(request, id);
                break;
        }
        //valoracionSession.setAttribute("valoracion", valoracion);
        
        RequestDispatcher rd = request.getRequestDispatcher("/page1.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        
        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int idValoracion = Integer.parseInt(request.getParameter("id"));
        String[]auxiliaresParam = request.getParameterValues("utensilio");
        String[]lugarParam = request.getParameterValues("lugar");
        String[]actividadParam = request.getParameterValues("actividad");
        String[]perdidaParam = request.getParameterValues("perdida");
        String dependenciaParam = request.getParameter("dependencia");
        String[]diagnosticoMedicoParam = request.getParameterValues("diagnostico");
        String[]sindromeParam = request.getParameterValues("sindrome");
        String observacionParam = request.getParameter("observacion");
        
        // ===== CREACIÓN DEL OBJETO =====
        EvaluacionPaciente  evaluacionPaciente = new EvaluacionPaciente();
        
        evaluacionPaciente.setActividades(actividadParam);
        evaluacionPaciente.setAuxiliares(auxiliaresParam);
        evaluacionPaciente.setDiagnosticoMedico(diagnosticoMedicoParam);
        evaluacionPaciente.setSindromes(sindromeParam);
        evaluacionPaciente.setDependencia(dependenciaParam);
        evaluacionPaciente.setObservacion(observacionParam);
        if(lugarParam!=null){
            for(String lugar: lugarParam){
                if(lugar.equals("estancia")){
                    evaluacionPaciente.setAsisteEstanciaDeDia(true);
                }
                if(lugar.equals("institucion")){
                    evaluacionPaciente.setAsisteInstitucionCultutral(true);
                }
            }
        }
        if(perdidaParam!=null){
            for(String perdida: perdidaParam){
                if(perdida.equals("pareja")){
                    evaluacionPaciente.setPerdidaPareja(true);
                }
                if(perdida.equals("familiar")){
                    evaluacionPaciente.setPerdidaFamiliar(true);
                }
                if(perdida.equals("amistad")){
                    evaluacionPaciente.setPerdidaAmistad(true);
                }
                if(perdida.equals("mascota")){
                    evaluacionPaciente.setPerdidaMascota(true);
                }
            }
        } 
        
        // ===== ALMACENAMIENTO EN LA BASE DE DATOS =====
        DbConnection conn = new DbConnection();
        EvaluacionPacienteDao evaluacionPacienteDao = new EvaluacionPacienteDao(conn);
        
        int idPaciente = evaluacionPacienteDao.insertIntoPaciente(evaluacionPaciente);
        evaluacionPacienteDao.updatePaciente(idValoracion, idPaciente);
        
        if(evaluacionPaciente.getActividades()!=null){
            evaluacionPacienteDao.insertIntoPacienteActividad(evaluacionPaciente.getActividades(), idPaciente);
        }
        if(evaluacionPaciente.getAuxiliares()!=null){
            evaluacionPacienteDao.insertIntoPacienteAuxiliar(evaluacionPaciente.getAuxiliares(), idPaciente);
        }
        if(evaluacionPaciente.getDiagnosticoMedico()!=null){
            evaluacionPacienteDao.insertIntoPacienteDiagnosticoMedico(evaluacionPaciente.getDiagnosticoMedico(), idPaciente);
        }
        if(evaluacionPaciente.getSindromes()!=null){
            evaluacionPacienteDao.insertIntoPacienteSindrome(evaluacionPaciente.getSindromes(), idPaciente);
        }
        
        // ===== OBTECIÓN DE ID CUIDADOR =====
        CuidadorDao cuidadorDao = new CuidadorDao(conn);
        int idCuidador = cuidadorDao.getIdCuidador(idValoracion);
        
        conn.disconnect();
        
        // ===== OBTECIÓN DE DATOS DE CUIDADOR =====
        if(idCuidador!=1 && idCuidador!=0){
            CuidadorController cuidadorController = new CuidadorController();
            cuidadorController.modificarCuidador(request, idValoracion);
        }
        
        conn = new DbConnection();
        ValoracionDao valoracionDao = new ValoracionDao(conn);
        Valoracion valoracion = valoracionDao.getValoracion(idValoracion);
        UsuarioPacienteDao pacienteDao = new UsuarioPacienteDao(conn);
        UsuarioPaciente paciente = pacienteDao.getPacientePorRegisto(idValoracion);
        conn.disconnect();
        
        request.setAttribute("paciente", paciente);
        request.setAttribute("valoracion", valoracion);
        
        RequestDispatcher rd = request.getRequestDispatcher("/page2.jsp");
        rd.forward(request, response);
    }
    
    public void modificarPaciente(HttpServletRequest request, int idValoracion){
            
        // ===== OBTIENE TODOS LOS DATOS DEL PACIENTE ======
        DbConnection conn = new DbConnection();
        EvaluacionPacienteDao evaluacionPacienteDao = new EvaluacionPacienteDao(conn);
        EvaluacionPaciente  evaluacionPaciente = evaluacionPacienteDao.getEvaluacionPaciente(idValoracion);
        List<String> actividades = evaluacionPacienteDao.getActividades(idValoracion);
        List<String> auxiliares = evaluacionPacienteDao.getAuxiliar(idValoracion);
        List<String> diagnosticos = evaluacionPacienteDao.getDiagnostico(idValoracion);
        List<String> sindromes = evaluacionPacienteDao.getSindrome(idValoracion);
        conn.disconnect();
        
        String lentes = "false", marcha = "false", dental = "false", auditivo = "false", silla = "false";
        List<String> auxiliaresExtras = new LinkedList<>();
        if(auxiliares!=null){
            for(String auxiliar: auxiliares){
                switch(auxiliar){
                    case "lentes":
                        lentes = "true";
                        break;
                    case "auxiliar de la marcha":
                        marcha = "true";
                        break;
                    case "protesis dental":
                        dental = "true";
                        break;
                    case "aparato auditivo":
                        auditivo = "true";
                        break;
                    case "silla de ruedas":
                        silla = "true";
                        break;
                    default:
                        auxiliaresExtras.add(auxiliar);
                                    
                }
                
            }
        }

        // ===== ENVIA VALORES AL JSP =====
        request.setAttribute("dependencia", evaluacionPaciente.getDependencia());
        request.setAttribute("pareja", evaluacionPaciente.isPerdidaPareja());
        request.setAttribute("familiar", evaluacionPaciente.isPerdidaFamiliar());
        request.setAttribute("amistad", evaluacionPaciente.isPerdidaAmistad());
        request.setAttribute("mascota", evaluacionPaciente.isPerdidaMascota());
        request.setAttribute("institucion", evaluacionPaciente.isAsisteInstitucionCultutral());
        request.setAttribute("estancia", evaluacionPaciente.isAsisteEstanciaDeDia());
        request.setAttribute("observacion", evaluacionPaciente.getObservacion());
        request.setAttribute("actividades", actividades);
        request.setAttribute("lentes", lentes);
        request.setAttribute("marcha", marcha);
        request.setAttribute("dental", dental);
        request.setAttribute("auditivo", auditivo);
        request.setAttribute("silla", silla);
        request.setAttribute("auxiliares", auxiliares);
        request.setAttribute("auxiliaresExtras", auxiliaresExtras);
        request.setAttribute("diagnosticos", diagnosticos);
        request.setAttribute("sindromes", sindromes);
    }
}
