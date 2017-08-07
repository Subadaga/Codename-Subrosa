package controller;

import dao.DbConnection;
import dao.UsuarioPacienteDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UsuarioPaciente;

public class UsuarioPacienteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        
        DbConnection conn = new DbConnection();
        UsuarioPacienteDao pacienteDao = new UsuarioPacienteDao(conn);
        List<UsuarioPaciente> lista = pacienteDao.getPacientes();
        conn.disconnect();
        request.setAttribute("pacientes", lista);
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        
        String validate = request.getParameter("id_paciente");
        
        if (validate == null || validate.equals(""))
        {
            RequestDispatcher rd = request.getRequestDispatcher("/pagePacientes.jsp");
            rd.forward(request, response);
        }
        
        int id = Integer.parseInt(request.getParameter("id_paciente"));
        
        DbConnection conn = new DbConnection();
        UsuarioPacienteDao pacienteDao = new UsuarioPacienteDao(conn);
        UsuarioPaciente paciente = pacienteDao.getRegistro(id);
        conn.disconnect();
        
        request.setAttribute("paciente", paciente);
        RequestDispatcher rd= request.getRequestDispatcher("/pageHistorico.jsp");
        rd.forward(request, response);
    }
    
    
}
