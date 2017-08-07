package controller;

import dao.DbConnection;
import dao.UsuarioPacienteDao;
import dao.ValoracionDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UsuarioPaciente;

public class ValoracionController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        
        String action = request.getParameter("action");
        int idValoracion = Integer.parseInt(request.getParameter("idVal"));
        int idPaciente = Integer.parseInt(request.getParameter("idUsr"));
        if(action.equals("eliminar")){
            eliminarValoracion(idValoracion);
        }
        
        DbConnection conn = new DbConnection();
        UsuarioPacienteDao pacienteDao = new UsuarioPacienteDao(conn);
        UsuarioPaciente paciente = pacienteDao.getRegistro(idPaciente);
        conn.disconnect();
        
        request.setAttribute("paciente", paciente);
        
        RequestDispatcher rd = request.getRequestDispatcher("/pageHistorico.jsp");
        rd.forward(request, response);
        
    }
    
    private void eliminarValoracion(int id){
        DbConnection conn = new DbConnection();
        ValoracionDao valoracionDao = new ValoracionDao(conn);
        valoracionDao.eliminarValoracion(id);
        conn.disconnect();
    }
}
