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
        
        switch("${relacion}"){
                case "apoyo total":
                    $('#apoyoTotal').prop('checked', true);
                    $('#apoyoTotalLabel').addClass('active');
                    break;
                case "unión familiar":
                    $('#unionFamiliar').prop('checked', true);
                    $('#unionFamiliarLabel').addClass('active');
                    break;
                case "preocupación por el enfermo":
                    $('#preocupacion').prop('checked', true);
                    $('#preocupacionLabel').addClass('active');
                    break;
                case "alteraciones en la dinámica familiar":
                    $('#alteraciones').prop('checked', true);
                    $('#alteracionesLabel').addClass('active');
                    break;
                 case "desintegración familiar":
                    $('#desintegración').prop('checked', true);
                    $('#desintegraciónLabel').addClass('active');
                    break;
                 case "conflicto familiar con el cuidador del enfermo":
                    $('#conflicto').prop('checked', true);
                    $('#conflictoLabel').addClass('active');
                    break;
                 case "otro":
                    $('#otro').prop('checked', true);
                    $('#otroLabel').addClass('active');
                break;
        }
        switch("${tipo}"){
                case "estructurada":
                    $('#estructurada').prop('checked', true);
                    $('#estructuradaLabel').addClass('active');
                    break;
                case "unipersonales":
                    $('#unipersonales').prop('checked', true);
                    $('#unipersonalesLabel').addClass('active');
                    break;
                case "adoptivas":
                    $('#adoptivas').prop('checked', true);
                    $('#adoptivasLabel').addClass('active');
                    break;
                case "uniparentales":
                    $('#uniparentales').prop('checked', true);
                    $('#uniparentalesLabel').addClass('active');
                    break;
                 case "consensual":
                    $('#consensual').prop('checked', true);
                    $('#consensualLabel').addClass('active');
                    break;
                 case "agregadas":
                    $('#agregadas').prop('checked', true);
                    $('#agregadasLabel').addClass('active');
                    break;
                 case "reestructurada":
                    $('#reestructurada').prop('checked', true);
                    $('#reestructuradaLabel').addClass('active');
                    break;
                 case "unidad doméstica":
                    $('#unidadDomestica').prop('checked', true);
                    $('#unidadDomesticaLabel').addClass('active');
                    break;
                 case "otra":
                    $('#otra').prop('checked', true);
                    $('#otraLabel').addClass('active');
                    break;
                
                
        }
        switch("${ciclo}"){
                case "formación de la pareja":
                    $('#formacionPareja').prop('checked', true);
                    $('#formacionParejaLabel').addClass('active');
                    break;
                case "nacimiento, crianza y formación a los hijos":
                    $('#nacimiento').prop('checked', true);
                    $('#nacimientoLabel').addClass('active');
                    break;
                case "hijos adolescentes":
                    $('#hijosAdolescentes').prop('checked', true);
                    $('#hijosAdolescentesLabel').addClass('active');
                    break;
                case "el reencuentro a la pareja (Sx del nido vacío)":
                    $('#reencuentroPareja').prop('checked', true);
                    $('#reencuentroParejaLabel').addClass('active');
                    break;
                 case "vejez":
                    $('#vejez').prop('checked', true);
                    $('#vejezLabel').addClass('active');
                    break;
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
                        <button type="button" class="btn btn-primary" onClick='saveForm()'>Guardar</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">No guardar</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
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
                        
                        <img src="img/011-collaboration.png" alt="device" class="img-header">
                        
                        <h3 class="text-muted">Estructura y Dinámica Familiar</h3>
                        <hr>

                        <form class="well form-horizontal" action="familia" method="post"  id="contact_form">
                            <div class="form-value-one">
                                <a href="http://aqtiva.cloudapp.net/test/familiograma-master/?idPaciente=${paciente.id}" target="_blank" class="btn btn-lg btn-success">Realizar familiograma</a>
                            </div>
                            
                            <fieldset>
                                
                                <!-- Text input-->
                                <div class="form-value-one">
                                    <p class="label-form">Problemas con la familia de origen</p>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarFamiliaOrigen()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" id="familiaOrigen" class="form-control input-short-form" placeholder="Agregue un conflicto" onkeypress="handleFamiliaOrigen(event)">
                                        
                                    </div>
                                </div>
                                
                                <!-- Checkbox Conyuge -->
                                
                                <div id="familiaOrigen_agregados">
                                    <c:forEach items="${problemasOrigen}" var="familiaOrigen">
                                        <div class="form-value-one">
                                            <button id="${familiaOrigen}" class="btn btn-danger btn-sm btn-space" onclick="eliminarFamiliaOrigen(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="familiaOrigen" value = "${familiaOrigen}" checked>${familiaOrigen}
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- Text input-->
                                <div class="form-value-one">
                                    <p class="label-form">Problemas conyugales y con hijos</p>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarConyugueHijos()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" id="conyugueHijos" class="form-control input-short-form" placeholder="Agregue un conflicto" onkeypress="handleConyugueHijos(event)">
                                        
                                    </div>
                                </div>
                                
                                <!-- Checkbox Hijos -->
                                
                                <div id="conyugueHijos_agregados">
                                    <c:forEach items="${problemasConyugales}" var="conyugeHijos">
                                        <div class="form-value-one">
                                            <button id="${conyugeHijos}" class="btn btn-danger btn-sm btn-space" onclick="eliminarConyugueHijos(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="conyugueHijos" value = "${conyugeHijos}" checked>${conyugeHijos}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                
                                
                                <!-- Checkbox Pregunta 47 -->
                                <div class="form-value-one">
                                    <p class="label-form">¿Qué ha sucedido últimamente en la familia en relación al padecimiento del paciente?</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "apoyoTotalLabel">
                                            <input type="radio" name="relacion" value="apoyo total" autocomplete="off" id = "apoyoTotal">Apoyo total
                                        </label>
                                        <label class="btn btn-default" id = "unionFamiliarLabel">
                                            <input type="radio" name="relacion" value="unión familiar" autocomplete="off" id = "unionFamiliar">Unión familiar
                                        </label>
                                        
                                        <label class="btn btn-default" id = "preocupacionLabel">
                                            <input type="radio" name="relacion" value="preocupación por el enfermo" autocomplete="off" id = "preocupacion">Preocupación por el enfermo
                                        </label>
                                    
                                    
                                        <label class="btn btn-default" id = "alteracionesLabel">
                                            <input type="radio" name="relacion" value="alteraciones en la dinámica familiar" autocomplete="off" id = "alteraciones">Alteraciones en la dinámica familiar
                                        </label>
                                    
                                   
                                        <label class="btn btn-default" id = "designacionLabel">
                                            <input type="radio" name="relacion" value="desintegración familiar" autocomplete="off" id = "designacion">Desintegración familiar
                                        </label>
                                    
                                        <label class="btn btn-default" id = "conflictoLabel">
                                            <input type="radio" name="relacion" value="conflicto familiar con el cuidador del enfermo" autocomplete="off" id = "conflicto">Conflicto familiar con el cuidador del enfermo
                                        </label>
                                   
                                    
                                        <label class="btn btn-default" id = "otroLabel">
                                            <input type="radio" name="relacion" value="otro" autocomplete="off" id = "otro">Otro
                                        </label>
                                    </div>
                                    
                                        
                                   
                                </div>
                                
                                <!-- Radio button estado civil -->
                                <div class="form-value-one">
                                    <p class="label-form">Tipo de Familia</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "estructuradaLabel">
                                            <input type="radio" name="tipo" value="estructurada" autocomplete="off" id = "estructurada">Estructurada
                                        </label>
                                        <label class="btn btn-default" id = "unipersonalesLabel">
                                            <input type="radio" name="tipo" value="unipersonales" autocomplete="off" id = "unipersonales">Unipersonales
                                        </label>
                                        <label class="btn btn-default" id = "adoptivasLabel">
                                            <input type="radio" name="tipo" value="adoptivas" autocomplete="off" id = "adoptivas">Adoptivas
                                        </label>
                                        <label class="btn btn-default" id = "uniparentalesLabel">
                                            <input type="radio" name="tipo" value="uniparentales" autocomplete="off" id = "uniparentales">Uniparentales
                                        </label>
                                        <label class="btn btn-default" id = "consensualLabel">
                                            <input type="radio" name="tipo" value="consensual" autocomplete="off" id = "consensual">Consensual
                                        </label>
                                        <label class="btn btn-default" id = "agregadaLabel">
                                            <input type="radio" name="tipo" value="agregada" autocomplete="off" id = "agregada">Agregada
                                        </label>
                                        <label class="btn btn-default" id = "reestructuradaLabel">
                                            <input type="radio" name="tipo" value="reestructurada" autocomplete="off" id = "reestructurada">Reestructurada
                                        </label>
                                        <label class="btn btn-default" id = "unidadDomesticaLabel">
                                            <input type="radio" name="tipo" value="unidad doméstica" autocomplete="off" id = "unidadDomestica">Unidad doméstica
                                        </label>
                                        <label class="btn btn-default" id = "otraLabel">
                                            <input type="radio" name="tipo" value="otra" autocomplete="off" id = "otra">Otra
                                        </label>
                                    </div>
                                </div>
                                <!-- Checkbox Pregunta 49 -->
                                <div class="form-value-one">
                                    <p class="label-form">Ciclo Vital de la Familia</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "formacionParejaLabel">
                                            <input type="radio" name="ciclo" value="formación de la pareja" autocomplete="off" id = "formacionPareja">Formación de la pareja
                                        </label>
                                        <label class="btn btn-default" id = "nacimientoLabel">
                                            <input type="radio" name="ciclo" value="nacimiento, crianza y formación a los hijos" autocomplete="off" id = "nacimiento">Nacimiento, crianza y formación a los hijos
                                        </label>
                                        <label class="btn btn-default" id = "hijosAdolescentesLabel"> 
                                            <input type="radio" name="ciclo" value="hijos adolescentes" autocomplete="off" id = "hijosAdolescentes">Hijos adolescentes 
                                        </label>
                                        <label class="btn btn-default" id = "reencuentroParejaLabel">
                                            <input type="radio" name="ciclo" value="el reencuentro a la pareja (Sx del nido vacío)" autocomplete="off" id = "reencuentroPareja">El reencuentro a la pareja (Sx del nido vacío)
                                        </label>
                                        <label class="btn btn-default" id = "vejezLabel">
                                            <input type="radio" name="ciclo" value="vejez" autocomplete="off" id = "vejez">Vejez
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
                                        <button type="submit" class="btn btn-save" name="id" value="${valoracion.id}">Guardar <span class="glyphicon glyphicon-floppy-disk"></span></button>
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

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

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
        function agregarFamiliaOrigen(){
            
            var familiaOrigen = document.getElementById("familiaOrigen").value;
            if(familiaOrigen!=""){
                document.getElementById("familiaOrigen").value = ""; //borra input del contenido
            
                var familiaOrigen_agregados = document.getElementById("familiaOrigen_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(familiaOrigen);
                var button = document.createElement("button");
                button.id = familiaOrigen;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarFamiliaOrigen(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "familiaOrigen";
                input.value = familiaOrigen;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                familiaOrigen_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarFamiliaOrigen(id){
            
            var familiaOrigen_agregados = document.getElementById("familiaOrigen_agregados");
            var btn = document.getElementById(id);
            familiaOrigen_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleFamiliaOrigen(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarFamiliaOrigen();
            }
        }
        
        
        
        function agregarConyugueHijos(){
            
            var conyugueHijos = document.getElementById("conyugueHijos").value;
            if(conyugueHijos!=""){
                document.getElementById("conyugueHijos").value = ""; //borra input del contenido
            
                var conyugueHijos_agregados = document.getElementById("conyugueHijos_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(conyugueHijos);
                var button = document.createElement("button");
                button.id = conyugueHijos;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarConyugueHijos(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "conyugueHijos";
                input.value = conyugueHijos;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                conyugueHijos_agregados.appendChild(div);   
            }
        }
        
        function eliminarConyugueHijos(id){
            
            var conyugueHijos_agregados = document.getElementById("conyugueHijos_agregados");
            var btn = document.getElementById(id);
            conyugueHijos_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleConyugueHijos(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarConyugueHijos();
            }
        }
        
               

        function formularioVacio(){
            var empty;
            $('input[type="text"]').each(function(){
                if($(this).val()!=""){
                    empty =true;
                }
            });
            $('input[type="number"]').each(function(){
                if($(this).val()!=""){
                    empty =true;
                }
            });
            $('input[type="tel"]').each(function(){
                if($(this).val()!=""){
                    empty =true;
                }
            });
            $('input[type="email"]').each(function(){
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
