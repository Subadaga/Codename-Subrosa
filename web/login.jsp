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

        <title>Inicio de Sesión</title>


        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/simple-sidebar-a.css" rel="stylesheet">
        <link href="css/forms.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet">


        <!-- Javascript -->
        <script src="js/main.js"></script>
        <script src="js/bootstrap.js"></script>

        
    </head>

    <body>
        
     <div class = bg >

        <div id="page-content" >
            <div class="container" style="width:500px">

                <h3 class="text-muted" style="text-align: center; font-size: xx-large; font-weight: bolder; color: #404856">SOCIALIS</h3>
                <hr>

                <div id="page-content-wrapper">

                    <form name="inicioSesion" class="well form-horizontal" action="login" onsubmit="return validarInformacion()" method='post' >
                        <input type='hidden' id='valido' name ='valido' >   

                        <fieldset>
                            <div class="form-value-one" style="text-align: center">
                                <p class="label-form">Usuario:</p>
                                <input type = "text" name = "Usuario"/><br></br>
                            </div>
                            <div class="form-value-one" style="text-align: center">
                                <p class="label-form">Contraseña:</p>
                                <input type = "password"  name = "Contraseña"/><br></br>
                            </div>

                            <!-- Button -->
                            <div class="form-group" style="text-align: center">
                                <label class="col-md-4 control-label"></label>
                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-primary" >Iniciar sesión      <span class="glyphicon glyphicon-log-in"></span></button>
                                </div>
                            </div>

                        </fieldset>


                    </form>



                </div>
            </div>
        </div>
            
      </div>
        <!-- /#page-content-wrapper -->

        <script>


            function validarInformacion(){
                var x = document.forms["inicioSesion"]["Usuario"].value.replace(/\s+/g, '');
                var y = document.forms["inicioSesion"]["Contraseña"].value.replace(/\s+/g, '');
                if(x == "" || y == ""){
                    alert("Los campos de Usuario y/o contraseña están vacíos");
                    return false;
                }
            }


            function formularioVacio() {
                var empty;
                $('input[type="text"]').each(function () {
                    if ($(this).val() != "") {
                        empty = true;
                    }
                });
                $('input[type="password"]').each(function () {
                    if ($(this).val() != "") {
                        empty = true;
                    }
                });
                return empty;
            }

            $(document).ready(function () {
                $(".link").click(function () {
                    var empty = formularioVacio();
                    if ($("input:checked").length != 0 || empty) {
                        $("#myModal").modal();
                    }
                });
            });

            function submitCredentials() {
                document.forms["form"].submit();
            }
            
            $(document).ready(function(){
                var message = "${messageLogin}";
                if(message != ""){
                    alert(message);
                }
            });            

        </script>
        

    </body>
</html>
