<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lange="es">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Trabajadores</title>

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
                }
                catch(err) {
                    alert(err.message);
                }     
                
                var nombreParam = '${nombre}';
                var usuarioParam = '${usuario}';
                var passwordParam = '${password}';

                $('#nombre').val(nombreParam);
                $('#usuario').val("${usuario}");
                $('#password').val("${password}");

                switch ("${tipoTrabajador}") {
                    case "Administrador":
                        $('#administrador').prop('checked', true);
                        $('#AdministradorLabel').addClass('active');
                        break;
                    case "Trabajador":
                        $('#trabajador').prop('checked', true);
                        $('#TrabajadorLabel').addClass('active');
                        break;
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

            <!-- /#page-content-wrapper -->
            <div id="page-content-wrapper" >
                <p>


                </p>
                <div class="container-fluid" style="width: 800px">
                    <div class='row'>
                        <div class="col-lg-12">
                            <a href="#menu-toggle" class="btn-menu btn-lg" id="menu-toggle"><span class="btn-menu"><i class="glyphicon glyphicon-align-justify"></i></span></a>

                            <img src="img/017-network.png" alt="device" class="img-header">
                            <h3 class="text-muted">Trabajadores</h3>
                            <hr>

                            
                            <form name="regTrabajador" action="trabajador" method='get'  onsubmit="return validarBusqueda()" id="form">

                                <!-- Text input-->
                                <div class="form-group"style='width: 300px'>
                                    <label class="control-label">Buscar a un Trabajador</label>
                                    <div class="inputGroupContainer">
                                        <div class="input-group group-left">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                                            <input  name="buscar" placeholder="Buscar por usuario" class="form-control" value="${usuario}" type="text" id = "buscar">
                                        </div>
                                        <div class="input-group group-right">
                                            <button type="submit" style="margin-top: 10px" class="btn btn-save" >Buscar <span class="glyphicon glyphicon-search"></span></button>  
                                        </div>
                                    </div>
                                </div> 

                            </form>
                            <form action="trabajador" method='post' onsubmit="return validarBusqueda()" id="formBorrar">
                                
                                 <input type="hidden" id="borrarId" name="borrarId" value="${usuario}">
                                 <input type="hidden" name="metodo" value="borrar">
                                 <button type="submit" class="btn btn-save" >Borrar <span class="glyphicon glyphicon-trash"></span></button>
                                                                
                            </form>
                                 
                            <sql:setDataSource
                                    var="myDS"
                                    driver="com.mysql.jdbc.Driver"
                                    url="jdbc:mysql://localhost:3306/base_final"
                                    user="root" password="Valeria"
                                />

                                <sql:query var="listaTrabajadores" dataSource="${myDS}">
                                    SELECT * FROM trabajador;
                                </sql:query>

                                <div class="well form-horizontal">
                                    <table class="table table-responsive">
                                        <label class="control-label">Lista de trabajadores</label>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nombre</th>
                                            <th>Tipo de trabajador</th>
                                            <th>Nombre de Usuario</th>
                                        </tr>
                                        <c:forEach var="trabajador" items="${listaTrabajadores.rows}">
                                            <tr>
                                                <td><c:out value="${trabajador.id_trabajador}" /></td>
                                                <td><c:out value="${trabajador.nombre}" /></td>
                                                <td><c:out value="${trabajador.tipo_trabajador}" /></td>
                                                <td><c:out value="${trabajador.usuario}" /></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>

          
                            <form name="registroTrabajadores" class="well form-horizontal" action="trabajador" onsubmit="return validarInformacion()" method='post'  id="form">
                                
                                <input type="hidden" name="metodo"   value="guardar">
                                <label class="control-label">Agregar a un trabajador</label>
                                <!-- Text input-->
                                <div class="form-group">
                                    
                                    <label class="control-label">Nombre del Trabajador</label>
                                    <div class="inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input  name="nombre" placeholder="Nombre completo" value="${nombre}" class="form-control"  type="text" id = "nombre">
                                        </div>
                                    </div>
                                </div>


                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="control-label">Usuario</label>
                                    <div class="inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input  name="usuario" placeholder="Usuario del Trabajador" value="${usuario}" class="form-control"  type="text" id = "usuario">
                                        </div>
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="control-label">Contraseña</label>
                                    <div class="inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input  name="password" placeholder="Contraseña" class="form-control" value="${password}"  type="password" id = "password">
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="form-group">
                                    <label class="control-label">Escriba la contraseña de nuevo</label>
                                    <div class="inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input  name="passwordConf" placeholder="Contraseña" class="form-control" type="password" id = "passwordConf">
                                        </div>
                                    </div>
                                </div>                                        

                                <!-- Checkbox Tipo de Trabajador -->
                                <div class="form-value-one">
                                    <p class="label-form">Tipo de Trabajador</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "AdministradorLabel">
                                            <input type="radio" name="tipoTrabajador" value="Administrador" autocomplete="off" id = "administrador">Administrador
                                        </label>
                                        <label class="btn btn-default" id = "TrabajadorLabel">
                                            <input type="radio" name="tipoTrabajador" value="Trabajador" autocomplete="off" id = "trabajador">Trabajador
                                        </label>
                                    </div>
                                </div>

                                <!-- Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label"></label>
                                    <div class="col-md-4">
                                        <button type="submit" class="btn btn-save" >Guardar <span class="glyphicon glyphicon-floppy-disk"></span></button>

                                    </div>
                                </div>
                            </form>
                            

                        </div>
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


        <script>                                     
                    
            function validarBusqueda(){
                var x = document.forms["regTrabajador"]["buscar"].value.replace(/\s+/g, '');
                if(x == ""){
                    alert("Ingrese un número de registro a buscar");
                    return false;
                }
            }                         
                    
            function validarInformacion(){
                var nombre = document.forms["registroTrabajadores"]["nombre"].value.replace(/\s+/g, '');
                var user = document.forms["registroTrabajadores"]["usuario"].value.replace(/\s+/g, '');
                var password = document.forms["registroTrabajadores"]["password"].value.replace(/\s+/g, '');
                var confirmacionContrasena = document.forms["registroTrabajadores"]["passwordConf"].value.replace(/\s+/g, '');
                if(user == "" || password == "" || confirmacionContrasena == "" || nombre == ""){
                    alert("Los campos de Usuario, nombre o contraseña están vacíos");
                    return false;
                }else{
                    if(password != confirmacionContrasena){
                        alert("Las contraseñas no coinciden");
                        return false;
                    }
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
            
            $(document).ready(function(){
                var message = "${message}";
                if(message != ""){
                    alert(message);
                }
                
            });

            $(document).ready(function () {
                $(".btn-save").click(function () {
                    var empty = formularioVacio();
                    if ($("input:checked").length != 0 || empty) {
                        $("#myModal").modal();
                    }
                });
            });

            function saveForm() {
                document.forms["form"].submit();
            }
        </script>

    </body>
</html>

