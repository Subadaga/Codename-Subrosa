package controller;
import dao.TrabajadorDao;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Trabajador;
import security.Hash;

public class TrabajadorController extends HttpServlet {
    
    @EJB
    TrabajadorDao trabajadorDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            request.setCharacterEncoding("UTF-8");
            
            String buscarParam = request.getParameter("buscar");
            
            try{      
                
                Trabajador trabajadorResultado = trabajadorDao.getTrabajador(buscarParam);
                
                if(trabajadorResultado != null){
                    request.setAttribute("nombre", trabajadorResultado.getNombre());
                    request.setAttribute("usuario", trabajadorResultado.getUsuario());
                    request.setAttribute("tipoTrabajador", trabajadorResultado.getTipoTrabajador());
                }else{
                    String message = "El usuario a buscar no existe";
                    request.setAttribute("message", message);
                }
                
                RequestDispatcher red = request.getRequestDispatcher("/pageTrabajador.jsp");
                red.forward(request, response);
            
            
            }catch(Exception e){
            
            }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                request.setCharacterEncoding("UTF-8");
                HttpSession session = request.getSession();
        
                try{
                    
                    String nombreParam = request.getParameter("nombre");
                    String usuarioParam = request.getParameter("usuario");
                    String passwordParam = request.getParameter("password");
                    String tipoTrabajadorParam = request.getParameter("tipoTrabajador");     
                    
                    String method = request.getParameter("metodo");             
                    
                    if(method.equals("guardar")){
                        
                       Trabajador trabajador = new Trabajador();
                       trabajador.setNombre(nombreParam);
                       trabajador.setUsuario(usuarioParam);
                       trabajador.setPassword(Hash.hash(passwordParam));
                       trabajador.setTipoTrabajador(tipoTrabajadorParam); 
                       
                       trabajadorDao.insertTrabajador(trabajador);
                       
                        String message = "El usuario se ha guardado correctamente";
                        request.setAttribute("message", message);
                       
                       RequestDispatcher red = request.getRequestDispatcher("/pageTrabajador.jsp");
                       red.forward(request, response);

                    }else if (method.equals("borrar")){
                    
                        String borrarParam = request.getParameter("borrarId");

                        Trabajador trabajadorResultado = trabajadorDao.getTrabajador(borrarParam);

                        if(trabajadorResultado != null){
                            
                            trabajadorDao.removeTrabajador(trabajadorResultado);
                            String message = "El usuario se ha eliminado correctamente";
                            request.setAttribute("message", message);
                            
                        }else{
                            
                            String message = "El usuario a buscar no existe";
                            request.setAttribute("message", message);
                        }
                        
                        RequestDispatcher red = request.getRequestDispatcher("/pageTrabajador.jsp");
                        red.forward(request, response);
                        
                    }                
                }catch(Exception e){
                        
                }
                


    }

}
