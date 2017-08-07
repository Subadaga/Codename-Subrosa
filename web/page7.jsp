<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Geriatría</title>
    
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/simple-sidebar-a.css" rel="stylesheet">
    <link href="css/forms.css" rel="stylesheet">
    
    
    <!-- Javascript -->
    <script src="js/main.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>
     $(document).ready(function(){
         
            if("${imss}" == "true"){
                $('#imss').prop('checked', true);
                $('#imssLabel').addClass('active');
            }
            if("${issste}" == "true"){
                $('#issste').prop('checked', true);
                $('#isssteLabel').addClass('active');
            }
            if("${seguroPopular}" == "true"){
                $('#seguro').prop('checked', true);
                $('#seguroLabel').addClass('active');
            }
         
            if("${gastosMedicos}"=="si"){
                $('#option1').prop('checked', true);
                $('#siLabel').addClass('active');
            }
            else{
                $('#option2').prop('checked', true);
                $('#noLabel').addClass('active');
            }
         
         
         $('#observacion').val("${observacion}"); 
         
         
         
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

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                
                <img class="profile-img" src="img/007-user.png">
                
                <a href="#menu-toggle" class="btn-lg" id="menu-toggle-two"><span class="btn-responsive"><i class="glyphicon glyphicon-share-alt"></i></span></a>
                
                <li class="sidebar-brand titulo">
                    <h4>${paciente.nombre}</h4>
                    <p class="registro"># de registro: ${paciente.registro}</p>
                </li>
                <li class="sidebar-anchor">
                    
                    <a href="/socialis/cuidador?id=${valoracion.idEvaluacionPaciente}" class="link"><span class="icon"><img class="icon-image" src="img/018-boss.png"></span>Datos generales del paciente</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="/socialis/cuidador?id=${valoracion.idCuidador}" class="link"><span class="icon"><img class="icon-image" src="img/017-network.png"></span>Datos del cuidador primario</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="/socialis/cuidador?id=${valoracion.idTratamiento}" class="link"><span class="icon"><img class="icon-image" src="img/medico-2.png"></span>Tratamiento farmocológico</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="/socialis/cuidador?id=${valoracion.idRecursos}" class="link"><span class="icon"><img class="icon-image" src="img/015-flats.png"></span>Recursos sociales y comunitarios</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="/socialis/cuidador?id=${valoracion.idFamilia}" class="link"><span class="icon"><img class="icon-image" src="img/011-collaboration.png"></span>Estructura dinámica y familiar</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="/socialis/cuidador?id=${valoracion.idEconomia}" class="link"><span class="icon"><img class="icon-image" src="img/coins.png"></span>Condiciones económicas</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="/socialis/cuidador?id=${valoracion.idServicioMedico}" class="link"><span class="icon"><img class="icon-image" src="img/020-hospital.png"></span>Servicio médico</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="/socialis/cuidador?id=${valoracion.idMaltrato}" class="link"><span class="icon"><img class="icon-image" src="img/005-warning.png"></span>Maltrato hacia la persona adulta mayor</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="/socialis/cuidador?id=${valoracion.idVivienda}" class="link"><span class="icon"><img class="icon-image" src="img/001-house.png"></span>Condiciones de vivienda</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="/socialis/cuidador?id=${valoracion.idDiagnostico}" class="link"><span class="icon"><img class="icon-image" src="img/medico-4.png"></span>Diagnóstico social</a>
                </li>
                <li class="sidebar-anchor">
                    <a href="/socialis/cuidador?id=${valoracion.idAbordaje}" class="link"><span class="icon"><img class="icon-image" src="img/012-signing.png"></span>Abordaje social</a>
                </li>
                <li>
                    <a href="#" class="link">Finalizar valoración</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
        
        <!-- REGISTRO NO ALMACENADO -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Almacenamiento</h4>
                    </div>
                    <div class="modal-body">
                        <div class="main-contant">
                            <h4>No almacenaste el registro. ¿Deseas almacenar los datos?</h4>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">No guardar</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" onClick='formularioVacio()' class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <a href="#menu-toggle" class="btn-menu btn-lg" id="menu-toggle"><span class="btn-menu"><i class="glyphicon glyphicon-align-justify"></i></span></a>
                        <img src="img/020-hospital.png" alt="device" class="img-header">
                        <h3 class="text-muted">Servicio Médico</h3>
                        <hr>
                        <form class="well form-horizontal" action="servicio-medico" method="post"  id="contact_form">
                            <fieldset>
                                <!-- Checkbox -->
                                <div class="form-value-one">
                                    <p class="label-form">Derechohabiente</p>
                                    <div class="btn-group" data-toggle="buttons">

                                        <label class="btn btn-default" id = "imssLabel">
                                            <input type="checkbox" name="derechohabientes" value="IMSS" autocomplete="off" id = "imss">IMSS
                                        </label>

                                        <label class="btn btn-default" id = "isssteLabel">
                                            <input type="checkbox" name="derechohabientes" value="ISSSTE" autocomplete="off" id = "issste">ISSSTE
                                        </label>

                                        <label class="btn btn-default" id = "seguroLabel">
                                            <input type="checkbox" name="derechohabientes" value="Seguro Popular" autocomplete="off" id = "seguro">Seguro Popular
                                        </label>

                                        <button onClick="agregarCampoDerechohabiente()" class="btn btn-default">Otro
                                        </button>

                                    </div>
                                </div>
                                
                                
                                <!-- Text input parentesco-->
                                <div id="div_parentesco" class="form-value-one collapse hide">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarParentesco()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="parentesco" class="form-control input-short-form" placeholder="Vecino, Tío, Primo etc." onkeypress="handleParentesco(event)">
                                        
                                    </div>
                                </div>
                                
                            
                                   
                                
                                
                                
                                <!-- Text input-->
                                <div id="div_derechohabientes" class="form-value-one collapse">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarDerechohabiente()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="derechohabiente" class="form-control input-short-form" placeholder="Derechohabientes" onkeypress="handleDerechohabiente(event)">
                                        
                                    </div>
                                </div>
                                <!-- Checkbox Administradores -->
                                <div id="derechohabientes_agregados">
                                    <c:forEach items="${derechohabientesExtra}" var="derechohabiente">
                                        <div class="form-value-one">
                                            <button id="${derechohabiente}" class="btn btn-danger btn-sm btn-space" onclick="eliminarDerechohabiente(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="derechohabientes" value="${derechohabiente}" checked>${derechohabiente}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                <!-- Radio button estado civil -->
                                <div class="form-value-one">
                                    <p class="label-form">Seguro de gastos médicos mayores</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "siLabel">
                                            <input type="radio" name="gastosMedico" id="option1" value="si">Sí
                                        </label>
                                        <label class="btn btn-default" id = "noLabel">
                                            <input type="radio" name="gastosMedico" id="option2" value="no">No
                                        </label>
                                    </div>
                                </div>
                                <div class="form-value-one">
                                    <p class="label-form">Observaciones</p>
                                </div>
                                <!-- Text area -->
                                <div id="div_caidas" class="form-value-one">
                                    <textarea class="form-control" rows="5" name="observaciones" placeholder="Escriba las observaciones del paciente" id = "observacion"></textarea>
                                </div>
                                <!-- Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label"></label>
                                    <div class="col-md-4">
                                        <button type="submit" class="btn btn-primary" name="id" value="${valoracion.id}">Guardar <span class="glyphicon glyphicon-floppy-disk"></span></button>
                                    </div>
                                </div>
                                
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
    
    <!-- Menu Toggle Script -->
    <script>
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
        $("#menu-toggle-two").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>
    
    <script>
               
        function agregarDerechohabiente(){
            
            var derechohabiente = document.getElementById("derechohabiente").value;
            if(derechohabiente!=""){
                document.getElementById("derechohabiente").value = ""; //borra input del contenido
            
                var derechohabientes_agregados = document.getElementById("derechohabientes_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(derechohabiente);
                var button = document.createElement("button");
                button.id = derechohabiente;
                button.className = "btn btn-danger btn-md btn-space";
                button.setAttribute("onClick","eliminarDerechohabiente(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "derechohabientes";
                input.value = derechohabiente;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                derechohabientes_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarDerechohabiente(id){
            
            var derechohabientes_agregados = document.getElementById("derechohabientes_agregados");
            var btn = document.getElementById(id);
            derechohabientes_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleDerechohabiente(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarDerechohabiente();
            }
        }
        
        function agregarCampoDerechohabiente(){
            $("#div_derechohabientes").collapse("toggle");
        }
        
        

        function formularioVacio(){
            var empty;
            $('input[type="text"]').each(function(){
                if($(this).val()!=""){
                    empty =true;
                }
            });
            return empty;
        }
        
        
        
        $(document).ready(function(){
            $(".link").click(function(){
                var empty = formularioVacio();
                if($("input:checked").length!=0 || empty){
                    $("#myModal").modal();
                }
            });
        });
        
        function saveForm(){
            document.forms["form"].submit();
        }
    </script>

</body>

</html>
