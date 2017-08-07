<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <title>Histórico</title>
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/forms.css" rel="stylesheet">
        <!-- Javascript -->
    <script src="js/main.js"></script>
    <script src="js/bootstrap.js"></script>
    
    <script>
    $(document).ready(function(){
        $("#btn-eliminar").click(function(){
            $(".btn-remove").collapse("toggle");
        });
    });
        </script>
    </head>
    <body>
        
        <%
            if(session.getAttribute("user") == null)
            {
                response.sendRedirect("login.jsp");
            }

        %>
        <div class="container">
            <div>
                <a href="pagePacientes.jsp" class="btn-menu btn-lg btn-primary link-h"><span class="glyphicon glyphicon-chevron-left"></span></a>
                <img src="img/014-curriculum.png" alt="device" class="img-h">
                <h1 class="text-muted">Evaluación<small style=""> social y familiar</small>
                </h1>
                <h4 class="personal-h"><b><span style="color:steelblue">Paciente:</span> ${paciente.nombre}</b></h4>
                <p class="personal-h"><span style="color:steelblue"># de registro:</span> ${paciente.registro}</p>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12"><hr></div>
                <div class="col-md-9 col-sm-9">
                    <div class="">
                        <h2 class="h2-h">Histórico</h2>
                        <hr>
                    </div>
                    <c:forEach items="${paciente.valoraciones}" var="valoracion">
                        <div class="row">
                            <div class="col-md-10 col-sm-10 col-xs-10">
                                <div class="media">
                                    <div class="pull-left circleBase type1">
                                        <a href="paciente?action=modificar&id=${valoracion.id}" style="color:#fff">${valoracion.fecha}</a>
                                    </div>
                                    <div class="media-body">
                                        <p>${valoracion.abordaje}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <a href="valoracion?action=eliminar&idVal=${valoracion.id}&idUsr=${paciente.id}" class="btn btn-danger btn-remove collapse"><span class="glyphicon glyphicon-remove"></span></a>
                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                    
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="div-links">
                        <a href="paciente?action=crear&id=${paciente.id}" class="link-h btn btn-primary"><span class="glyphicon glyphicon-plus"></span>   Nueva valoración</a>
                        <a  class="link-h btn btn-danger" id="btn-eliminar"><span class="glyphicon glyphicon-remove"></span>   Eliminar valoración</a>
                        <a href="#" class="link-h btn btn-success"><span class="glyphicon glyphicon-print"></span>    Imprimir reporte</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
