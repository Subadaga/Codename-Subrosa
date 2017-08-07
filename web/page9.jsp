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
            
			switch("${tendenciaVivienda}"){
                case "casa propia":
                    $('#casaPropia').prop('checked', true);
                    $('#casaPropiaLabel').addClass('active');
                    break;
                case "rentada":
                    $('#renta').prop('checked', true);
                    $('#rentaLabel').addClass('active');
                    break;
				case "prestada":
                    $('#prestada').prop('checked', true);
                    $('#prestadaLabel').addClass('active');
                    break;
                case "casa de un hijo":
                    $('#casaDeHijo').prop('checked', true);
                    $('#casaDeHijoLabel').addClass('active');
                    break;
            }
			
			switch("${tipoVivienda}"){
                case "casa sola":
                    $('#casaSola').prop('checked', true);
                    $('#casaSolaLabel').addClass('active');
                    break;
                case "departamento":
                    $('#departamento').prop('checked', true);
                    $('#departamentoLabel').addClass('active');
                    break;
                case "cuarto redondo":
                    $('#cuartoR').prop('checked', true);
                    $('#cuartoRLabel').addClass('active');
                    break;
                case "vecindad":
                    $('#vecindad').prop('checked', true);
                    $('#vecindadLabel').addClass('active');
                    break;
            }
            
        
        switch("${zona}"){
                case "urbana":
                    $('#urbana').prop('checked', true);
                    $('#urbanaLabel').addClass('active');
                    break;
                case "sub-urbana":
                    $('#suburbana').prop('checked', true);
                    $('#suburbanaLabel').addClass('active');
                    break;
				case "rural":
                    $('#rural').prop('checked', true);
                    $('#ruralLabel').addClass('active');
                    break;
            }
            
            switch(${dormitorioCompartido}){
                case "true":
                    $('#option1').prop('checked', true);
                    $('#option1Label').addClass('active');
                    break;
                case "false":
                    $('#option2').prop('checked', true);
                    $('#option2Label').addClass('active');
                    break;
            }
            
        switch("${ubicacionDormitorio}"){
                case "planta baja":
                    $('#plantabaja').prop('checked', true);
                    $('#plantaBajaLabel').addClass('active');
                    break;
                case "planta alta":
                    $('#plantaAlta').prop('checked', true);
                    $('#plantaAltaLabel').addClass('active');
                    break;
            }
            
        switch("${accesoBanio}"){
                case "true":
                    $('#option1Banio').prop('checked', true);
                    $('#option1BanioLabel').addClass('active');
                    break;
                case "false":
                    $('#option2Banio').prop('checked', true);
                    $('#option2BanioLabel').addClass('active');
                    break;
            }
			
            if("${elevador}"=="true"){
                $('#elevador').prop('checked', true);
                $('#elevadorLabel').addClass('active');
            }
            if("${escaleras}"=="true"){
                $('#escaleras').prop('checked', true);
                $('#escalerasLabel').addClass('active');
            }
            if("${alfombra}"=="true"){
                $('#alfombra').prop('checked', true);
                $('#alfombraLabel').addClass('active');
            }
            if("${desniveles}"=="true"){
                $('#desniveles').prop('checked', true);
                $('#desnivelesLabel').addClass('active');
            }
            if("${pasamanos}"=="true"){
                $('#pasamanos').prop('checked', true);
                $('#pasamanosLabel').addClass('active');
            }
            if("${obstaculos}"=="true"){
                $('#obstaculos').prop('checked', true);
                $('#obstaculosLabel').addClass('active');
            }
            
    
        switch("${caidas}"){
            case "true":
                $('#option3').prop('checked', true);
                $('#option3Label').addClass('active');
                break;
            case "false":
                $('#option4').prop('checked', true);
                $('#option4Label').addClass('active');
                break;
            }
            
            $('#observacion').val("${observacion}"); 
            
            $('#caidaEspecificacion').val("${caidaEspecificacion}");
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
                        <img src="img/001-house.png" alt="device" class="img-header">
                        <h3 class="text-muted">Condiciones de Vivienda</h3>
                        <hr>
                        <form class="well form-horizontal" action="vivienda" method="post"  id="contact_form">
                            <fieldset>
                                <!-- Tenencia de la vivienda -->
                                <div class="form-value-one">
                                    <p class="label-form">Tendencia de la vivienda</p>
                                    <div class="btn-group" id="tenencia-options" data-toggle="buttons">
                                        <label class="btn btn-default" id = "casaPropiaLabel">
                                            <input type="radio" name="tenencia" value="casa propia" autocomplete="off" id = "casaPropia">Casa propia
                                        </label>

                                        <label class="btn btn-default" id = "rentaLabel">
                                            <input type="radio" name="tenencia" value="rentada" autocomplete="off" id = "renta">Rentada
                                        </label>

                                        <label class="btn btn-default" id = "prestadaLabel">
                                            <input type="radio" name="tenencia" value="prestada" autocomplete="off" id = "prestada">Prestada
                                        </label>

                                        <label class="btn btn-default" id = "casaDeHijoLabel">
                                            <input type="radio" name="tenencia" value="casa de un hijo" autocomplete="off" id = "casaDeHijo">Casa de un hijo
                                        </label>

                                        <button id="btn-tenencia" onClick="agregarCampoTenencia()" class="btn btn-default" id = "otro">Otro
                                        </button>

                                    </div>
                                </div>
                                <!-- Text input tenencia-->
                                <div id="div_tenencia" class="form-value-one collapse">
                                     <div class="input-group">
                                         <span class = "input-group-btn">
                                             <button onClick="agregarTenencia()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>                     
                                         </span>
                                         <input type="text" value="" id="tenencia" class="form-control input-short-form" placeholder="Agregar otra tendencia" onkeypress="handleTenencia(event)">
                                       
            
                                        
                                    </div>
                                </div>
                                <!-- Checkbox tenencia -->
                                <div id="tenencia_agregada">
                                    <c:forEach items="${tenencias}" var="tenencia">
                                        <div class="form-value-one">
                                            <button id="${tenencia}" class="btn btn-danger btn-sm btn-space" onclick="eliminarTenencia(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="radio" name="tenencia" value="${tenencia}" checked="true">${tenencia}
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- Tipo de vivienda -->
                                <div class="form-value-one">
                                    <p class="label-form">Tipo de vivienda</p>
                                    <div class="btn-group" id="tipo-options" data-toggle="buttons">
                                        <label class="btn btn-default" id = "casaSolaLabel">
                                            <input type="radio" name="tipo" value="casa sola" autocomplete="off" id = "casaSola">Casa sola
                                        </label>

                                        <label class="btn btn-default" id = "departamentoLabel">
                                            <input type="radio" name="tipo" value="departamento" autocomplete="off" id = "departamento">Departamento
                                        </label>

                                        <label class="btn btn-default" id = "cuartoRLabel">
                                            <input type="radio" name="tipo" value="cuarto redondo" autocomplete="off" id = "cuarto">Cuarto redondo
                                        </label>

                                        <label class="btn btn-default" id = "vecindadLabel">
                                            <input type="radio" name="tipo" value="vecindad" autocomplete="off" id = "vecindad">Vecindad
                                        </label>

                                        <button id="btn-tenencia" onClick="agregarCampoTipo()" class="btn btn-default" id = "otro">Otro
                                        </button>

                                    </div>
                                </div>
                                <!-- Text input tipo-->
                                <div id="div_tipo" class="form-value-one collapse">
                                     <div class="input-group">
                                         <span class = "input-group-btn">
                                             <button onClick="agregarTipo()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>                     
                                         </span>
                                         <input type="text" value="" id="tipo" class="form-control input-short-form" placeholder="Agregar otro tipo" onkeypress="handleTipo(event)">
                                       
            
                                        
                                    </div>
                                </div>
                                <!-- Checkbox tipo -->
                                <div id="tipo_agregado">
                                    
                                    <c:forEach items="${tipos}" var="tipo">
                                        <div class="form-value-one">
                                            <button id="${tipo}" class="btn btn-danger btn-sm btn-space" onclick="eliminarTipo(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="radio" name="tipo" value="${tipo}" checked="true">${tipo}
                                        </div>
                                    </c:forEach>
                                    
                                </div>
                                <!-- Radio button zona -->
                                <div class="form-value-one">
                                    <p class="label-form">Zona</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "urbanaLabel">
                                            <input type="radio" name="zona" value="urbana" autocomplete="off" id = "urbana">Urbana
                                        </label>

                                        <label class="btn btn-default" id = "suburbanaLabel">
                                            <input type="radio" name="zona" value="sub-urbana" autocomplete="off" id = "suburbana">Sub-urbana
                                        </label>

                                        <label class="btn btn-default" id = "ruralLabel">
                                            <input type="radio" name="zona" value="rural" autocomplete="off" id = "rural">Rural
                                        </label>

                                    </div>
                                </div>
                                <!-- radio checks comaprte -->  
                                <div class="form-value-one">
                                    <p class="label-form">El paciente comparte el dormitorio</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "option1Label">
                                            <input type="radio" name="comparteDormitorio" id="option1" value="si">Sí
                                        </label> 
                                        <label class="btn btn-default active" id = "option2Label">
                                            <input type="radio" name="comparteDormitorio" id="option2" value="no" checked>No
                                        </label>
                                    </div>
                                </div>
                                <!-- Text input comparte-->
                                <div id="div_companiero" class="form-value-one collapse">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarCompaniero()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="companiero" class="form-control input-short-form" placeholder="¿Con quién comparte el dormitorio?" onkeypress="handleCompaniero(event)">
                                        
                                    </div>
                                </div>
                                <!-- Checkbox tipo -->
                                <div id="companieros_agregados">
                                    <c:forEach items="${companieros}" var="companiero">
                                        <div class="form-value-one">
                                            <button id="${companiero}" class="btn btn-danger btn-sm btn-space" onclick="eliminarCompaniero(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="companiero" value="${companiero}" checked>${companiero}
                                        </div>

                                    </c:forEach>
                                
                                </div>
                                
                                
                                <div class="form-value-one">
                                    <p class="label-form">Su dormitorio se encuentra en la...</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "plantaBajaLabel">
                                            <input type="radio" name="planta" value="planta baja" id = "plantabaja">planta baja
                                        </label> 
                                        <label class="btn btn-default" id = "plantaAltaLabel">
                                            <input type="radio" name="planta" value="planta alta" id = "plantaalta">planta alta
                                        </label>
                                    </div>
                                </div>
                                <div class="form-value-one">
                                    <p class="label-form">El paciente tiene fácil acceso al baño</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "option1BanioLabel">
                                            <input type="radio" name="banio" value="si" id = "option1Banio">Sí
                                        </label> 
                                        <label class="btn btn-default" id = "option2BanioLabel">
                                            <input type="radio" name="banio" value="no" id = "option2Banio">No
                                        </label>
                                    </div>
                                </div>
                                <!-- Checkbox -->
                                <div class="form-value-one">
                                    <p class="label-form">En la vivienda hay...</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "elevadorLabel">
                                            <input type="checkbox" name="objetosVivienda" value="elevador" autocomplete="off" id = "elevador">Elevador
                                        </label>
                                        <label class="btn btn-default" id = "escalerasLabel">
                                            <input type="checkbox" name="objetosVivienda" value="escaleras" autocomplete="off" id = "escaleras">Escaleras
                                        </label>
                                        <label class="btn btn-default" id = "alfombraLabel">
                                            <input type="checkbox" name="objetosVivienda" value="alfombra" autocomplete="off" id = "alfombra">Alfombra
                                        </label>
                                        <label class="btn btn-default" id = "desnivelesLabel">
                                            <input type="checkbox" name="objetosVivienda" value="desniveles" autocomplete="off" id = "desniveles">Desniveles
                                        </label>
                                        <label class="btn btn-default" id = "pasamanosLabel">
                                            <input type="checkbox" name="objetosVivienda" value="pasamanos" autocomplete="off" id = "pasamanos">Pasamanos
                                        </label>
                                        <label class="btn btn-default" id = "obstaculosLabel">
                                            <input type="checkbox" name="objetosVivienda" value="obstaculo" autocomplete="off" id = "obstaculos">Obstáculos que impiden la ambulación
                                        </label>
                                    </div>
                                </div>
                                <div class="form-value-one">
                                    <p class="label-form">Caidas en el último año</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "option3Label">
                                        <input type="radio" name="caidas" value="si" id = "option3">Sí
                                        </label>
                                        <label class="btn btn-default active" id = "option4Label">
                                            <input type="radio" name="caidas" value="no" checked id = "option4">No
                                        </label>
                                    </div>
                                </div>
                                <!-- Text area -->
                                <div id="div_caidas" class="form-value-one collapse">
                                    <textarea class="form-control" rows="2" name="caidaEspecificacion" placeholder="Especifíque" id = "caidaEspecificacion"></textarea>
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
        
        //arregla error al cerrar y abrir
        $("#div_tenencia").collapse({toggle:false});
        $("#div_tipo").collapse({toggle:false});
        $("#div_caidas").collapse({toggle:false});
    </script>
    
    <script>
        

        
        function agregarTenencia(){
            
            var tenencia = document.getElementById("tenencia").value;
            if(tenencia!=""){
                document.getElementById("tenencia").value = ""; //borra input del contenido
            
                var tenencia_agregada = document.getElementById("tenencia_agregada");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(tenencia);
                var button = document.createElement("button");
                button.id = "id-tenencia";
                button.className = "btn btn-danger btn-md btn-space";
                button.setAttribute("onClick","eliminarTenencia(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "radio";
                input.name = "tenencia";
                input.value = tenencia;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                tenencia_agregada.appendChild(div);
                $("#div_tenencia").addClass("hide");
                $("#div_tenencia").collapse('hide');
                $("#btn-tenencia").css({"color": "#fff","background-color": "#1ac","border-color": "#19b"});
            }
        
        }
        
        function eliminarTenencia(){
            
            var tenencia_agregada = document.getElementById("tenencia_agregada");
            var btn = document.getElementById("id-tenencia");
            tenencia_agregada.removeChild(btn.parentElement);
            $("#btn-tenencia").css({"color": "","background-color": "","border-color": ""});
            var activeRemove = document.querySelector('#btn-tenencia.active');
            activeRemove.classList.remove('active');
        }
        
        function handleTenencia(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarTenencia();
            }
        }
        
        function agregarCampoTenencia(){
            var id_tenencia = document.getElementById("id-tenencia");
            if(id_tenencia == null){
                $("#tenencia-options > label").removeClass("active");
                $("#div_tenencia").removeClass("hide");
                $("#div_tenencia").collapse('toggle');
            }
        }
        
        $("#tenencia-options > label").click(function(){
            var id_tenencia = document.getElementById("id-tenencia");
            if(id_tenencia != null){
                eliminarTenencia();
            }
            $("#div_tenencia").collapse("hide");
        });
        
        
        
        
        
           
        function agregarTipo(){
            
            var tipo = document.getElementById("tipo").value;
            if(tipo!=""){
                document.getElementById("tipo").value = ""; //borra input del contenido
            
                var tipo_agregado = document.getElementById("tipo_agregado");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(tipo);
                var button = document.createElement("button");
                button.id = "id-tipo";
                button.className = "btn btn-danger btn-md btn-space";
                button.setAttribute("onClick","eliminarTipo(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "radio";
                input.name = "tipo";
                input.value = tipo;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                tipo_agregado.appendChild(div);
                $("#div_tipo").addClass("hide");
                $("#div_tipo").collapse('hide');
                $("#btn-tipo").css({"color": "#fff","background-color": "#1ac","border-color": "#19b"});
            }
        
        }
        
        function eliminarTipo(){
            
            var tipo_agregado = document.getElementById("tipo_agregado");
            var btn = document.getElementById("id-tipo");
            tipo_agregado.removeChild(btn.parentElement);
            $("#btn-tipo").css({"color": "","background-color": "","border-color": ""});
            document.querySelector('#btn-tipo.active').classList.remove('active');
        }
        
        function handleTipo(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarTipo();
            }
        }
        
        function agregarCampoTipo(){
            var id_tipo = document.getElementById("id-tipo");
            if(id_tipo == null){
                $("#tipo-options > label").removeClass("active");
                $("#div_tipo").removeClass("hide");
                $("#div_tipo").collapse('toggle');
            }
        }
        
        $("#tipo-options > label").click(function(){
            var id_tipo = document.getElementById("id-tipo");
            if(id_tipo != null){
                eliminarTipo();
            }
            $("#div_tipo").collapse("hide");
        });
        
        
        
        /* COLLAPSE COMPANIERO */
        $(document).ready(function() {
            $('input[type=radio][name=comparteDormitorio]').change(function() {
                if (this.value == 'si') {
                    $("#div_companiero").collapse('show');
                }
                else if (this.value == 'no') {
                    $("#div_companiero").collapse('hide');
                }
            });
        });
             
        
        function agregarCompaniero(){
            
            var companiero = document.getElementById("companiero").value;
            if(companiero!=""){
                document.getElementById("companiero").value = ""; //borra input del contenido
            
                var companieros_agregados = document.getElementById("companieros_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(companiero);
                var button = document.createElement("button");
                button.id = companiero;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarCompaniero(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "companiero";
                input.value = companiero;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                companieros_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarCompaniero(id){
            
            var companieros_agregados = document.getElementById("companieros_agregados");
            var btn = document.getElementById(id);
            companieros_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleCompaniero(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarCompaniero();
            }
        }
        
        
        /* COLLAPSE CAIDAS */
        $(document).ready(function() {
            $('input[type=radio][name=caidas]').change(function() {
                if (this.value == 'si') {
                    $("#div_caidas").collapse('show');
                }
                else if (this.value == 'no') {
                    $("#div_caidas").collapse('hide');
                }
            });
        });
        
        

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
