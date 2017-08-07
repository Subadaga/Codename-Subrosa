/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.LocalizacionDao;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import model.Municipios;
import model.municipioJSON;

/**
 *
 * @author schna
 */
public class estadoMunicipio extends HttpServlet {
    
    @EJB
    LocalizacionDao localizacionDao;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet estadoMunicipio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet estadoMunicipio at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
            int estadoID = Integer.parseInt(request.getParameter("strUser"));
        
            String termTester = request.getParameter("qt");
            
            String municipios = getOptions(estadoID, termTester);           
                        
            response.getWriter().write(municipios);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    public String getOptions(int idMunicipio, String searchTerm){
        List<Municipios> municipios = localizacionDao.getMunicipiosEstado(idMunicipio);
        List<municipioJSON> municipiosJSON = new ArrayList();
        List<municipioJSON> municipiosFiltered = new ArrayList();
        
        for (Municipios municipio : municipios) {
            municipiosJSON.add(new municipioJSON(municipio.getMunicipiosPK().getIdEstado(), municipio.getNombreMunicipio()));
        }
        
        for (municipioJSON municipio : municipiosJSON) {
            if(municipio.text.contains(searchTerm)){
                municipiosFiltered.add(municipio);
            }
        }       
        
        String municipiosString = new Gson().toJson(municipiosFiltered);       
        
        return municipiosString;
    }

}


