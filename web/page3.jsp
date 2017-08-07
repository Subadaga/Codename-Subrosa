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
            
            if("${pacienteAdmin}" == "true"){
                $('#paciente').prop('checked', true);
                $('#pacienteLabel').addClass('active');
            }
            if("${conyuge}" == "true"){
                $('#conyuge').prop('checked', true);
                $('#conyugeLabel').addClass('active');
            }
            if("${hijo}" == "true"){
                $('#hijo').prop('checked', true);
                $('#hijoLabel').addClass('active');
            }
            if("${nieto}" == "true"){
                $('#nieto').prop('checked', true);
                $('#nietoLabel').addClass('active');
            }
            if("${hermano}" == "true"){
                $('#hermano').prop('checked', true);
                $('#hermanoLabel').addClass('active');
            }
            if("${nuera}" == "true"){
                $('#nuera').prop('checked', true);
                $('#nueraLabel').addClass('active');
            }
            if("${yerno}" == "true"){
                $('#yerno').prop('checked', true);
                $('#yernoLabel').addClass('active');
            }
            if("${sobrino}" == "true"){
                $('#sobrino').prop('checked', true);
                $('#sobrinoLabel').addClass('active');
            }
            
            
            if("${pacienteCompra}" == "true"){
                $('#pacienteCompra').prop('checked', true);
                $('#pacienteCompraLabel').addClass('active');
            }
            if("${conyugeCompra}" == "true"){
                $('#conyugeCompra').prop('checked', true);
                $('#conyugeCompraLabel').addClass('active');
            }
            if("${hijoCompra}" == "true"){
                $('#hijoCompra').prop('checked', true);
                $('#hijoCompraLabel').addClass('active');
            }
            if("${nietoCompra}" == "true"){
                $('#nietoCompra').prop('checked', true);
                $('#nietoCompraLabel').addClass('active');
            }
            if("${hermanoCompra}" == "true"){
                $('#hermanoCompra').prop('checked', true);
                $('#hermanoCompraLabel').addClass('active');
            }
            if("${nueraCompra}" == "true"){
                $('#nueraCompra').prop('checked', true);
                $('#nueraCompraLabel').addClass('active');
            }
            if("${sobrinoCompra}" == "true"){
                $('#sobrinoCompra').prop('checked', true);
                $('#sobrinoCompraLabel').addClass('active');
            }
            
            
            if("${autobusUrbano}" == "true"){
                $('#autobusUrbano').prop('checked', true);
                $('#autobusUrbanoLabel').addClass('active');
            }
            if("${colectivo}" == "true"){
                $('#colectivo').prop('checked', true);
                $('#colectivoLabel').addClass('active');
            }
            if("${metro}" == "true"){
                $('#metro').prop('checked', true);
                $('#metroLabel').addClass('active');
            }
            if("${particular}" == "true"){
                $('#particular').prop('checked', true);
                $('#particularLabel').addClass('active');
            }
            if("${autobusForaneo}" == "true"){
                $('#autobusForaneo').prop('checked', true);
                $('#autobusForaneoLabel').addClass('active');
            }
            if("${taxi}" == "true"){
                $('#taxi').prop('checked', true);
                $('#taxiLabel').addClass('active');
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
                        
                        <img src="img/medico-2.png" alt="device" class="img-header">
                        
                        <h3 class="text-muted">Tratamiento farmocológico</h3>
                        <hr>

                        <form class="well form-horizontal form-save" action="tratamiento-farmocologico" method="post"  id="form">
                            <fieldset>
                                
                                <!-- Text input-->
                                <div class="form-value-one">
                                    <p class="label-form">Medicamentos que se le administran al paciente</p>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarMedicamento()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="nombre_medicamento" class="form-control input-short-form" placeholder="Medicamento" onkeypress="handleMedicamento(event)">
                                        
                                    </div>
                                </div>
                                <!-- Checkbox Medicamentos -->
                                <div id="medicamentos_agregados">
                                    <c:forEach items="${medicinas}" var="medicina">
                                        <div class="form-value-one">
                                            <button id="${medicina}" class="btn btn-danger btn-sm btn-space" onclick="eliminarMedicamento(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="medicina" value="${medicina}" checked>${medicina}
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- Checkbox -->
                                <div class="form-value-one">
                                    <p class="label-form">¿Quién administra los fármacos?</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "pacienteLabel">
                                            <input type="checkbox" name="administradores" value="paciente" autocomplete="off" id = "paciente">Paciente
                                        </label>

                                        <label class="btn btn-default" id = "conyugeLabel">
                                            <input type="checkbox" name="administradores" value="cónyuge" autocomplete="off" id = "conyuge">Cónyuge
                                        </label>

                                        <label class="btn btn-default" id = "hijoLabel">
                                            <input type="checkbox" name="administradores" value="hijo" autocomplete="off" id = "hijo">Hijo
                                        </label>

                                        <label class="btn btn-default" id = "nietoLabel">
                                            <input type="checkbox" name="administradores" value="nieto" autocomplete="off" id = "nieto">Nieto
                                        </label>

                                        <label class="btn btn-default" id = "hermanoLabel">
                                            <input type="checkbox" name="administradores" value="hermano" autocomplete="off" id = "hermano">Hermano
                                        </label>

                                        <label class="btn btn-default" id = "nueraLabel">
                                            <input type="checkbox" name="administradores" value="nuera" autocomplete="off" id = "nuera">Nuera
                                        </label>
                                        
                                        <label class="btn btn-default" id = "yernoLabel">
                                            <input type="checkbox" name="administradores" value="yerno" autocomplete="off" id = "yerno">Yerno
                                        </label>

                                        <label class="btn btn-default" id = "sobrinoLabel">
                                            <input type="checkbox" name="administradores" value="sobrino" autocomplete="off" id = "sobrino">Sobrino
                                        </label>

                                        <button onClick="agregarCampoAdministrador()" class="btn btn-default" id="otro">Otro
                                        </button>

                                    </div>
                                </div>
                                
                                <!-- Text input-->
                                <div id="div_administradores" class="form-value-one collapse">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarAdministrador()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="administrador" class="form-control input-short-form" placeholder="Amigo, Tío, Primo etc." onkeypress="handleAdministrador(event)">
                                        
                                    </div>
                                </div>
                                
                                <!-- Checkbox Administradores -->
                                
                                <div id="administradores_agregados">
                                    <c:forEach items="${administradoresExtras}" var="administrador">
                                        <div class="form-value-one">
                                            <button id="${administrador}" class="btn btn-danger btn-sm btn-space" onclick="eliminarAdministrador(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="administradores" value="${administrador}" checked>${administrador}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                
                                <!-- Checkbox -->
                                <div class="form-value-one">
                                    <p class="label-form">¿Quién compra los fármacos?</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "pacienteCompraLabel">
                                            <input type="checkbox" name="compradores" value="paciente" autocomplete="off" id = "pacienteCompra">Paciente
                                        </label>

                                        <label class="btn btn-default" id = "conyugeCompraLabel">
                                            <input type="checkbox" name="compradores" value="cónyuge" autocomplete="off" id = "conyugeCompra">Cónyuge
                                        </label>

                                        <label class="btn btn-default" id = "hijoCompraLabel">
                                            <input type="checkbox" name="compradores" value="hijo" autocomplete="off" id = "hijoCompra">Hijo
                                        </label>

                                        <label class="btn btn-default" id = "nietoCompraLabel">
                                            <input type="checkbox" name="compradores" value="nieto" autocomplete="off" id = "nietoCompra">Nieto
                                        </label>

                                        <label class="btn btn-default" id = "hermanoCompraLabel">
                                            <input type="checkbox" name="compradores" value="hermano" autocomplete="off" id = "hermanoCompra">Hermano
                                        </label>

                                        <label class="btn btn-default" id = "nueraCompraLabel">
                                            <input type="checkbox" name="compradores" value="nuera" autocomplete="off" id = "nueraCompra">Nuera
                                        </label>
                                        
                                        <label class="btn btn-default" id = "yernoCompraLabel">
                                            <input type="checkbox" name="compradores" value="yerno" autocomplete="off" id = "yernoCompra">Yerno
                                        </label>

                                        <label class="btn btn-default" id = "sobrinoCompraLabel">
                                            <input type="checkbox" name="compradores" value="sobrino" autocomplete="off" id = "sobrinoCompra">Sobrino
                                        </label>

                                        <button onClick="agregarCampoComprador()" class="btn btn-default" id="otro">Otro
                                        </button>

                                    </div>
                                </div>
                                
                                <!-- Text input-->
                                <div id="div_compradores" class="form-value-one collapse">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarComprador()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="comprador" class="form-control input-short-form" placeholder="Amigo, Tío, Primo etc." onkeypress="handleComprador(event)">
                                        
                                    </div>
                                </div>
                                
                                <!-- Checkbox Compradores -->
                                
                                <div id="compradores_agregados">
                                    <c:forEach items="${compradoresExtras}" var="comprador">
                                        <div class="form-value-one">
                                            <button id="${comprador}" class="btn btn-danger btn-sm btn-space" onclick="eliminarComprador(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="compradores" value="${comprador}" checked>${comprador}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                
                                <!-- Checkbox -->
                                <div class="form-value-one">
                                    <p class="label-form">Sistema de transporte habitual</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "autobusUrbanoLabel">
                                            <input type="checkbox" name="transportes" value="autobús urbano" autocomplete="off" id = "autobusUrbano">Autobús urbano
                                        </label>

                                        <label class="btn btn-default" id = "colectivoLabel">
                                            <input type="checkbox" name="transportes" value="colectivo" autocomplete="off" id = "colectivo">Colectivo
                                        </label>

                                        <label class="btn btn-default" id = "metroLabel">
                                            <input type="checkbox" name="transportes" value="metro" autocomplete="off" id = "metro">Metro
                                        </label>

                                        <label class="btn btn-default" id = "particularLabel">
                                            <input type="checkbox" name="transportes" value="particular" autocomplete="off" id = "particular">Particular
                                        </label>

                                        <label class="btn btn-default" id = "autobusForaneoLabel">
                                            <input type="checkbox" name="transportes" value="autobús foráneo" autocomplete="off" id = "autobusForaneo">Autobús foráneo
                                        </label>

                                        <label class="btn btn-default" id = "taxiLabel">
                                            <input type="checkbox" name="transportes" value="taxi" autocomplete="off" id = "taxi">Taxi
                                        </label>

                                        <button onClick="agregarCampoTransporte()" class="btn btn-default" id="otro">Otro
                                        </button>

                                    </div>
                                </div>
                                
                                <!-- Text input-->
                                <div id="div_transportes" class="form-value-one collapse">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarTransporte()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="transporte" class="form-control input-short-form" placeholder="Tren ligero, Metrobus etc." onkeypress="handleTransporte(event)">
                                        
                                    </div>
                                </div>
                                
                                <!-- Checkbox Transporte -->
                                
                                <div id="transportes_agregados">
                                    <c:forEach items="${transportesExtras}" var="transporte">
                                        <div class="form-value-one">
                                            <button id="${transporte}" class="btn btn-danger btn-sm btn-space" onclick="eliminarTransporte(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="transportes" value="${transporte}" checked>${transporte}
                                        </div>
                                    </c:forEach>
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
                                        <button type="submit" class="btn btn-primary-4" name="id" value="${valoracion.id}">Guardar <span class="glyphicon glyphicon-floppy-disk"></span></button>
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
        function agregarMedicamento(){
            var nombre_medicamento = document.getElementById("nombre_medicamento").value;
            if(nombre_medicamento!=""){
                document.getElementById("nombre_medicamento").value = ""; //borra input del contenido
            
                var medicamentos_agregados = document.getElementById("medicamentos_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(nombre_medicamento);
                var button = document.createElement("button");
                button.id = nombre_medicamento;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarMedicamento(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "medicina";
                input.value = nombre_medicamento;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                medicamentos_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarMedicamento(id){
            
            var medicamentos_agregados = document.getElementById("medicamentos_agregados");
            var btn = document.getElementById(id);
            medicamentos_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleMedicamento(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarMedicamento();
            }
        }
        
        
        function agregarAdministrador(){
            
            var administrador = document.getElementById("administrador").value;
            if(administrador!=""){
                document.getElementById("administrador").value = ""; //borra input del contenido
            
                var administradores_agregados = document.getElementById("administradores_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(administrador);
                var button = document.createElement("button");
                button.id = administrador;
                button.className = "btn btn-danger btn-md btn-space";
                button.setAttribute("onClick","eliminarAdministrador(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "administradores";
                input.value = administrador;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                administradores_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarAdministrador(id){
            
            var administradores_agregados = document.getElementById("administradores_agregados");
            var btn = document.getElementById(id);
            administradores_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleAdministrador(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarAdministrador();
            }
        }
        
        function agregarCampoAdministrador(){
            $("#div_administradores").collapse("toggle");
        }
        
        
        
        function agregarComprador(){
            
            var comprador = document.getElementById("comprador").value;
            if(comprador!=""){
                document.getElementById("comprador").value = ""; //borra input del contenido
            
                var compradores_agregados = document.getElementById("compradores_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(comprador);
                var button = document.createElement("button");
                button.id = comprador;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarComprador(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "compradores";
                input.value = comprador;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                compradores_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarComprador(id){
            
            var compradores_agregados = document.getElementById("compradores_agregados");
            var btn = document.getElementById(id);
            compradores_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleComprador(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarComprador();
            }
        }
        
        function agregarCampoComprador(){
            $("#div_compradores").collapse("toggle");
        }
        
        
        
        function agregarTransporte(){
            
            var transporte = document.getElementById("transporte").value;
            if(transporte!=""){
                document.getElementById("transporte").value = ""; //borra input del contenido
            
                var transportes_agregados = document.getElementById("transportes_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(transporte);
                var button = document.createElement("button");
                button.id = transporte;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarTransporte(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "transportes";
                input.value = transporte;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                transportes_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarTransporte(id){
            
            var transportes_agregados = document.getElementById("transportes_agregados");
            var btn = document.getElementById(id);
            transportes_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleTransporte(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarTransporte();
            }
        }
        
        function agregarCampoTransporte(){
            $("#div_transportes").collapse("toggle");
        }
        
        //-- verificar si el formularios está vació
        function formularioVacio(){
            
            var modal = document.getElementById('myModal');
            var cont=0, noCont=0;
            var inputs = document.querySelectorAll("input[type=text]");
            for(var k=0; k<inputs.length; k++){
                if(inputs[k].value==""){
                    cont++;
                }
                else{
                    noCont++;
                }
            }
            
            
            var n = $("input:checked").length;
            alert("inputs:"+cont+" noCont: "+noCont+" check: "+n);
            
            if(n!=0){
                
                /*
                modal.style.display = "block";
                modal.className= "in";
                modal.arial-hidden= "in";*/
                alert("Entro");
                    $("#myModal").modal();
            }
            else{
                alert("no Entro");
            }
        }
        
        $(document).ready(function(){
            $(".link").click(function(){
                if($("input:checked").length!=0){
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
