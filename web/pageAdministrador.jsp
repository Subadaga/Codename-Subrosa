<%-- 
    Document   : login
    Created on : 11-may-2017, 21:07:25
    Author     : Andrea Osorio Aguilar
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lange="es"n >
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Menú de Administrador</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/simple-sidebar-a.css" rel="stylesheet">
        <link href="css/forms.css" rel="stylesheet">


        <!-- Javascript -->
        <script src="js/main.js"></script>
        <script src="js/bootstrap.js"></script>

        <script>

            $(document).ready(function () {
                
                try {
                    var tipoParam = '${currentUserType}';
                    $("#tipo").val(tipoParam);
                } catch (err) {
                    alert(err.message);
                }
            });
            
            function menuAdministrador(){
           
                postForm("menuAdministrador");
               
            }
              function menuTrabajador(){
           
                postForm("menuTrabajador");
               
            }
            
            function menuPaciente(){
                postForm("menuPaciente");
    
            }
            
             function postForm(tipo){
                 
                var tipoParam = '${currentUserType}';
                $("#tipo").val(tipoParam);
                 $("#link").val(tipo);
               $("#administrador").submit();
             }

        </script>

    </head>

    <!-- /#page-content-wrapper -->
    <body>
        <%
            if(session.getAttribute("user") == null)
            {
                response.sendRedirect("login.jsp");
            }else if(session.getAttribute("credentials").equals("user")){
                response.sendRedirect("login.jsp");
            }

        %>

        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">

                    
                    <img class="profile-img" src="img/020-hospital.png">

                    <a href="#menu-toggle" class="btn-lg" id="menu-toggle-two"><span class="btn-responsive"><i class="glyphicon glyphicon-share-alt"></i></span></a>
                    <li class="sidebar-brand titulo">
                        <h4>Bienvenido</h4>
                    </li>
                    <form name='administrador' id='administrador' action='administrador' method='post'>
                        <input type='hidden' id='tipo' name ='tipo' >       
                        <input type='hidden' id='link' name ='link' > 
                        <li class="sidebar-anchor">
                            <a onclick="menuAdministrador()" href='#' class="link"><span class="icon"><img class="icon-image" src="img/011-collaboration.png" ></span>Menú Administrador</a>
                        </li>

                        <li class="sidebar-anchor">
                            <a onclick='menuTrabajador()' href="#" class="link"><span class="icon"><img class="icon-image" src="img/017-network.png"></span>Ir a Trabajadores</a>
                        </li>
                        
                        <li class="sidebar-anchor">
                            <a onclick="menuPaciente()" href="#" class="link"><span class="icon"><img class="icon-image" src="img/medico-4.png"></span>Ir a Pacientes</a>
                        </li>
                    </form>
                   

                    <li>
                        <a href="login.jsp" class="link">Cerrar sesión</a>
                    </li>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->

            <div id="page-content" >
                <div class="container" style="width:800px">

                    <a href="#menu-toggle" class="btn-menu btn-lg" id="menu-toggle"><span class="btn-menu"><i class="glyphicon glyphicon-align-justify"></i></span></a>

                    <img src="img/011-collaboration.png" alt="device" style = "margin-top: 10px" class="img-header">    
                    <h3 class="text-muted" style="margin-top: 25px">Administrador</h3>
                    <hr>

                    <div id="page-content-wrapper">

                        <form class="well form-horizontal" action="login">

                            <fieldset>
                                <!-- Button -->
                                <div class="form-group" style="text-align: center">
                                    <label class="col-md-4 control-label"></label>
                                    <div class="col-md-4">
                                        <a href="pagePacientesAdmin.jsp" class="link-h btn btn-primary"><span class="glyphicon glyphicon-file"></span>   Ir a Pacientes</a>
                                        <a href="pageTrabajador.jsp" class="link-h btn btn-primary"><span class="glyphicon glyphicon-user"></span>   Ir a Trabajadores</a>

                                    </div>
                                </div>

                            </fieldset>


                        </form>



                    </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>

        <!-- Menu Toggle Script -->
        <script>

            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
            $("#menu-toggle-two").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });

        </script>

    </body>
</html>