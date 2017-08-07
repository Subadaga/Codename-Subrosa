package controller;

import java.io.IOException;
import dao.TrabajadorDao;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Trabajador;

public class LoginController extends HttpServlet {

    //Si no tiene EJB el entity manager no se va a crear
    @EJB
    TrabajadorDao trabajadorDao;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String usuario = request.getParameter("Usuario");
        String pwd = request.getParameter("Contraseña");

        HttpSession session = request.getSession();
        session.setAttribute("user", null);
        
        try {
            
            Trabajador trabajador = trabajadorDao.getTrabajador(usuario);
                        
            if(trabajador != null && trabajadorDao.login(usuario, pwd)){                                          
                    session.setAttribute("user", trabajador.getUsuario());

                    String tipoDeTrabajador = trabajador.getTipoTrabajador();
                    request.setAttribute("currentUserType", tipoDeTrabajador);

                    if (tipoDeTrabajador.equals("Administrador")) {
                        session.setAttribute("credentials", "admin");
                        request.getRequestDispatcher("/pageAdministrador.jsp").forward(request, response);
                    } else if (tipoDeTrabajador.equals("Trabajador")) {
                        session.setAttribute("credentials", "user");
                        request.getRequestDispatcher("/pagePacientes.jsp").forward(request, response);
                    }                
            } else {
                              
                String messageLogin = "Usuario y/o contraseña equivocados";
                session.setAttribute("messageLogin", messageLogin);
                request.getRequestDispatcher("login.jsp").forward(request, response);               

            }

        } catch (Exception e) {

        }


    }

}
