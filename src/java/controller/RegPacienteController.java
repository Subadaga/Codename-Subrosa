package controller;
import dao.PacienteDao;
import dao.DbConnection;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Paciente;

public class RegPacienteController extends HttpServlet {
    
        @EJB
        PacienteDao pacienteDao;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");           

            String buscarParam = request.getParameter("buscar");

            //String method = request.getParameter("metodo");


            try {
                
                Paciente pacienteResultado = pacienteDao.getPaciente(buscarParam);
                
                if(pacienteResultado != null){  
                    
                    request.setAttribute("id_paciente", pacienteResultado.getIdPaciente());
                    request.setAttribute("no_cama", pacienteResultado.getNoCama());
                    request.setAttribute("codigo_postal", pacienteResultado.getCodigoPostal());
                    request.setAttribute("telefono_casa", pacienteResultado.getTelefonoCasa());
                    request.setAttribute("telefono_cel", pacienteResultado.getTelefonoCel());
                    request.setAttribute("fechaEval", pacienteResultado.getFechaEvaluacion());
                    request.setAttribute("fechaIngreso", pacienteResultado.getFechaIngreso());
                    request.setAttribute("consulta_externa", pacienteResultado.getConsultaExterna());
                    request.setAttribute("nombre_paciente", pacienteResultado.getNombre());
                    request.setAttribute("apellido_paterno", pacienteResultado.getApellidoMaterno());
                    request.setAttribute("apellido_materno", pacienteResultado.getApellidoPaterno());
                    request.setAttribute("nacimiento", pacienteResultado.getFechaNacimiento());
                    request.setAttribute("estado", pacienteResultado.getEstado());
                    request.setAttribute("municipio", pacienteResultado.getMunicipio());
                    request.setAttribute("colonia", pacienteResultado.getColonia());
                    request.setAttribute("calle", pacienteResultado.getCalle());
                    request.setAttribute("estado_civil", pacienteResultado.getEstadoCivil());
                    request.setAttribute("genero", pacienteResultado.getGenero());
                    request.setAttribute("sexo", pacienteResultado.getSexo());
                    request.setAttribute("religion", pacienteResultado.getReligion());
                    request.setAttribute("entrevista", pacienteResultado.getEntrevistaA()); 
                }

            } catch (Exception e) {

            }           
            RequestDispatcher red = request.getRequestDispatcher("/pagePacientes.jsp");
            red.forward(request, response);
       
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int noCama = 0;     
        
        if (!request.getParameter("no_cama").equals("")) 
        {
               noCama = Integer.parseInt(request.getParameter("no_cama"));
        }
            
        String idPaciente = request.getParameter("id_paciente");    
        String codigoPostal = request.getParameter("codigo_postal");
        String telCasa = request.getParameter("telefono_casa");
        String telCel = request.getParameter("telefono_cel");
        String fechaEval = request.getParameter("fechaEval");
        String fechaIngreso = request.getParameter("fechaIngreso");
        String consultaExt = request.getParameter("consulta_externa");
        String nombrePaciente = request.getParameter("nombre_paciente");
        String apellidoPat = request.getParameter("apellido_paterno");
        String apellidoMat = request.getParameter("apellido_materno");
        String nacimiento = request.getParameter("nacimiento");
        String estado = request.getParameter("estado");
        String municipio = request.getParameter("municipio");
        String colonia = request.getParameter("colonia");
        String calle = request.getParameter("calle");
        String edoCivil = request.getParameter("estado_civil");
        String genero = request.getParameter("genero");
        String sexo = request.getParameter("sexo");
        String religion = request.getParameter("religion");
        String entrevista = request.getParameter("entrevista");

        String method = request.getParameter("metodo");
        
        System.out.println(sexo);

        if (method.equals("guardar")) {

            try {

                Paciente paciente = new Paciente();

                paciente.setIdPaciente(idPaciente);
                paciente.setNoCama(noCama);
                paciente.setCodigoPostal(codigoPostal);
                paciente.setTelefonoCasa(telCasa);
                paciente.setTelefonoCel(telCel);
                paciente.setFechaEvaluacion(fechaEval);
                paciente.setFechaIngreso(fechaIngreso);
                paciente.setConsultaExterna(consultaExt);
                paciente.setNombre(nombrePaciente);
                paciente.setApellidoMaterno(apellidoMat);
                paciente.setApellidoPaterno(apellidoPat);
                paciente.setFechaNacimiento(nacimiento);
                paciente.setEstado(estado);
                paciente.setMunicipio(municipio);
                paciente.setColonia(colonia);
                paciente.setCalle(calle);
                paciente.setEstadoCivil(edoCivil);
                paciente.setGenero(genero);
                paciente.setSexo(sexo);
                paciente.setReligion(religion);
                paciente.setEntrevistaA(entrevista); 
                
                pacienteDao.insertIntoPaciente(paciente);

            } catch (Exception e) {

            } finally {

            }

            RequestDispatcher rd = request.getRequestDispatcher("/pagePacientes.jsp");
            rd.forward(request, response);

        } else if (method.equals("borrar")) {

            
        }

    }

}
