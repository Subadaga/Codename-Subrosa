package controller;

import dao.DbConnection;
import dao.RegistroDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Registro;

public class HistoricoController extends HttpServlet {
        
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        
        request.setCharacterEncoding("UTF-8");
        
        int id_paciente = Integer.parseInt(request.getParameter("id_paciente"));
        DbConnection conn = new DbConnection();
        RegistroDao registroDao = new RegistroDao(conn);
        Registro registro = registroDao.getPaientePorId(id_paciente);
        conn.disconnect();
        
        request.setAttribute("registro", registro);
        RequestDispatcher rd = request.getRequestDispatcher("/historico.jsp");
        rd.forward(request, response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        int id = 4;
        RequestDispatcher rd = request.getRequestDispatcher("/historico.jsp");
        rd.forward(request, response);
    }
}
