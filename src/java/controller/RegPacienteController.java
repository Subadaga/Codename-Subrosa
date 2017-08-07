package controller;
import dao.PacienteDao;
import dao.DbConnection;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Paciente;

public class RegPacienteController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String validate = request.getParameter("buscar");
                
        if (request.getParameter("buscar") == null || validate.equals("") ) {
            RequestDispatcher rd = request.getRequestDispatcher("/pagePacientes.jsp");
            rd.forward(request, response);
        } else {
            // ===== OBTENCIÓN DE DATOS POR JSP =====
            int buscarParam = Integer.parseInt(request.getParameter("buscar"));

            String method = request.getParameter("metodo");

            // ===== OBTIENE TODOS LOS DATOS DEL TRABAJADOR ======
            DbConnection conn = new DbConnection();
            PacienteDao pacienteDao = new PacienteDao(conn);

            // ===== CREACIÓN DEL OBJETO =====
            Paciente paciente = new Paciente();

            try {
                paciente = pacienteDao.findOneById(buscarParam);
                
                
                // ===== ENVIA VALORES AL JSP =====
                request.setAttribute("id_paciente", paciente.getId_paciente());
                request.setAttribute("no_cama", paciente.getNum_cama());
                request.setAttribute("codigo_postal", paciente.getCodigo_postal());
                request.setAttribute("telefono_casa", paciente.getTelefono_casa());
                request.setAttribute("telefono_cel", paciente.getTeltefno_cel());
                request.setAttribute("fechaEval", paciente.getFecha_evaluacion());
                request.setAttribute("fechaIngreso", paciente.getFecha_ingreso());
                request.setAttribute("consulta_externa", paciente.getConsulta_externa());

                request.setAttribute("nombre_paciente", paciente.getNombre_paciente());
                request.setAttribute("apellido_paterno", paciente.getApellido_paterno_paciente());
                request.setAttribute("apellido_materno", paciente.getApellido_materno_paciente());
                request.setAttribute("nacimiento", paciente.getFecha_nacimiento());
                request.setAttribute("estado", paciente.getEstado());
                request.setAttribute("municipio", paciente.getMunicipio());
                request.setAttribute("colonia", paciente.getColonia());
                request.setAttribute("calle", paciente.getCalle());
                request.setAttribute("estado_civil", paciente.getEstado_civil());

                request.setAttribute("genero", paciente.getGenero());
                request.setAttribute("sexo", paciente.getSexo());
                request.setAttribute("religion", paciente.getReligion());

                request.setAttribute("entrevista", paciente.getEntrevista());

            } catch (Exception e) {

            } finally {
                conn.disconnect();
            }

            RequestDispatcher red = request.getRequestDispatcher("/pagePacientes.jsp");
            red.forward(request, response);

        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ===== ALMACENAMIENTO EN LA BASE DE DATOS =====
        DbConnection conn = new DbConnection();
        PacienteDao pacienteDao = new PacienteDao(conn);

        // ===== OBTENCIÓN DE DATOS POR JSP =====
        int noCama = 0;
        
        
        int id_paciente = Integer.parseInt(request.getParameter("id_paciente"));
        
        if (!request.getParameter("no_cama").equals("")) 
        {
               noCama = Integer.parseInt(request.getParameter("no_cama"));
        }
     
        
   
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
                // ===== CREACIÓN DEL OBJETO =====
                Paciente paciente = new Paciente();

                paciente.setId_paciente(id_paciente);
                paciente.setNum_cama(noCama);
                paciente.setCodigo_postal(codigoPostal);
                paciente.setTelefono_casa(telCasa);
                paciente.setTeltefno_cel(telCel);
                paciente.setFecha_evaluacion(fechaEval);
                paciente.setFecha_ingreso(fechaIngreso);
                paciente.setConsulta_externa(consultaExt);

                paciente.setNombre_paciente(nombrePaciente);
                paciente.setApellido_paterno_paciente(apellidoPat);
                paciente.setApellido_materno_paciente(apellidoMat);
                paciente.setFecha_nacimiento(nacimiento);
                paciente.setEstado(estado);
                paciente.setMunicipio(municipio);
                paciente.setColonia(colonia);
                paciente.setCalle(calle);
                paciente.setEstado_civil(edoCivil);
                paciente.setGenero(genero);
                paciente.setSexo(sexo);
                paciente.setReligion(religion);
                paciente.setEntrevista(entrevista);

                Paciente pExistente = new Paciente();

                pExistente = pacienteDao.findOneById(id_paciente);
                if (pExistente == null) {
                    int idTrabajador = pacienteDao.insertIntoPaciente(paciente);
                } else {
                    paciente.setId_paciente(pExistente.getId_paciente());
                    pacienteDao.updatePaciente(paciente);
                }

                conn.disconnect();

            } catch (Exception e) {

            } finally {

            }

            RequestDispatcher rd = request.getRequestDispatcher("/pagePacientes.jsp");
            rd.forward(request, response);

        } else if (method.equals("borrar")) {

            int registro = Integer.parseInt(request.getParameter("id_paciente"));
            pacienteDao.deletePaciente(registro);

            // ===== ENVIA VALORES AL JSP =====
            request.setAttribute("id_paciente", "");
            request.setAttribute("no_cama", "");
            request.setAttribute("codigo_postal", "");
            request.setAttribute("telefono_casa", "");
            request.setAttribute("telefono_cel", "");
            request.setAttribute("fechaEval", "");
            request.setAttribute("fechaIngreso", "");
            request.setAttribute("consulta_externa", "");

            request.setAttribute("nombre_paciente", "");
            request.setAttribute("apellido_paterno", "");
            request.setAttribute("apellido_materno", "");
            request.setAttribute("nacimiento", "");
            request.setAttribute("estado", "");
            request.setAttribute("municipio", "");
            request.setAttribute("colonia", "");
            request.setAttribute("calle", "");
            request.setAttribute("estado_civil", "");

            request.setAttribute("genero", "");
            request.setAttribute("sexo", "");
            request.setAttribute("religion", "");

            request.setAttribute("entrevista", "");

            conn.disconnect();

            RequestDispatcher rd = request.getRequestDispatcher("/pagePacientes.jsp");
            rd.forward(request, response);
        }

    }

}
