
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminController extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // ===== OBTENCIÓN DE DATOS POR JSP =====
        String tipoParam = request.getParameter("tipo");
        String link = request.getParameter("link");
        request.setAttribute("currentUserType", tipoParam);

        switch (link) {
            case "menuAdministrador":
                request.getRequestDispatcher("/pageAdministrador.jsp").forward(request, response);
                break;

            case "menuTrabajador":
                request.getRequestDispatcher("/pageTrabajador.jsp").forward(request, response);
                break;

            case "menuPaciente":
                request.getRequestDispatcher("/pagePacientes.jsp").forward(request, response);
                break;
        }

    }

}
