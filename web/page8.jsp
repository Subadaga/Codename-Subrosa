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
        
        
            if("${psicoEmocional}" == "true"){
                $('#psicoEmocional').prop('checked', true);
                $('#psicoEmocionalLabel').addClass('active');
            }
            if("${fisico}" == "true"){
                $('#fisico').prop('checked', true);
                $('#fisicoLabel').addClass('active');
            }
            if("${negligencia}" == "true"){
                $('#negligencia').prop('checked', true);
                $('#negligenciaLabel').addClass('active');
            }
            if("${sexual}" == "true"){
                $('#sexual').prop('checked', true);
                $('#sexualLabel').addClass('active');
            }
            if("${financiero}" == "true"){
                $('#financiero').prop('checked', true);
                $('#financieroLabel').addClass('active');
            }
            if("${patrimonial}" == "true"){
                $('#patrimonial').prop('checked', true);
                $('#patrimonialLabel').addClass('active');
            }
            if("${abandono}" == "true"){
                $('#abandono').prop('checked', true);
                $('#abandonoLabel').addClass('active');
            }
        
        
            if("${hijo}" == "true"){
                $('#hijo').prop('checked', true);
                $('#hijoLabel').addClass('active');
            }
            if("${conyuge}" == "true"){
                $('#conyuge').prop('checked', true);
                $('#conyugeLabel').addClass('active');
            }
            if("${nieto}" == "true"){
                $('#nieto').prop('checked', true);
                $('#nietoLabel').addClass('active');
            }
            if("${hermano}" == "true"){
                $('#hermano').prop('checked', true);
                $('#hermanoLabel').addClass('active');
            }
            
            
            if("${deteccionMaltrato}" == "si"){
                $('#option1').prop('checked', true);
                $('#option1Label').addClass('active');
                $(".cuestionario").collapse('show');
            }
            else{
                $('#option2').prop('checked', true);
                $('#option2Label').addClass('active');
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
                        <img src="img/005-warning.png" alt="device" class="img-header">
                        <h3 class="text-muted">Maltrato hacia la persona adulta mayor</h3>
                        <hr>
                        <form class="well form-horizontal" action="maltrato" method="post"  id="form">
                            <!-- radio checks -->  
                            <div class="form-value-one">
                                <p class="label-form">Detección de maltrato</p>
                                
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default" id = "option1Label">
                                        <input type="radio" name="deteccionDeMaltrato" id="option1" value="si">Sí
                                    </label> 
                                    <label class="btn btn-default" id = "option2Label">
                                        <input type="radio" name="deteccionDeMaltrato" id="option2" value="no">No
                                    </label>
                                </div>
                            </div>
                            
                            <fieldset class="collapse cuestionario">
                                <!-- Checkbox -->
                                <div class="form-value-one" id="camposMaltrato">
                                    <p class="label-form">Clasificación de maltrato</p>
                                    <div disabled class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id="psicoEmocionalLabel">
                                            <input type="checkbox" name="clasificacionDeMaltrato" value="psico-emocional" autocomplete="off" id="psicoEmocional">Psico-emocional
                                        </label>

                                        <label class="btn btn-default" id="fisicoLabel">
                                            <input type="checkbox" name="clasificacionDeMaltrato" value="físico" autocomplete="off" id="fisico">Físico
                                        </label>

                                        <label class="btn btn-default" id="negligenciaLabel">
                                            <input type="checkbox" name="clasificacionDeMaltrato" value="negligencia" autocomplete="off" id="negligencia">Negligencia
                                        </label>

                                        <label class="btn btn-default" id="sexualLabel">
                                            <input type="checkbox" name="clasificacionDeMaltrato" value="sexual" autocomplete="off" id="sexual">Sexual
                                        </label>

                                        <label class="btn btn-default" id="financieroLabel">
                                            <input type="checkbox" name="clasificacionDeMaltrato" value="financiero" autocomplete="off" id="financiero">Financiero
                                        </label>

                                        <label class="btn btn-default" id="patrimonialLabel">
                                            <input type="checkbox" name="clasificacionDeMaltrato" value="patrimonial" autocomplete="off" id="patrimonial">Patrimonial
                                        </label>
                                        
                                        <label class="btn btn-default" id="abandonoLabel">
                                            <input type="checkbox" name="clasificacionDeMaltrato" value="abandono" autocomplete="off" id="abandono">Abandono
                                        </label>

                                        <button id="btn-maltrato" onClick="agregarCampoMaltrato()" class="btn btn-default" id="otro" >Otro
                                        </button>

                                    </div>
                                </div>
                                <!-- Text input-->
                                <div id="div_maltrato" class="form-value-one hide">
                                    <p class="label-form">Tipos de Maltrato</p>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarCampoMaltrato()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" id="maltrato" class="form-control input-short-form" placeholder="Escribir tipo de Maltrato" onkeypress="handleMaltrato(event)">
                                        
                                    </div>
                                </div>
                                <!-- Checkbox Otros Tipos de Maltrato -->
                                <div id="maltratos_agregados">
                                    <c:forEach items="${clasificacionesExtras}" var="clasificacionDeMaltrato">
                                        <div class="form-value-one">
                                            <button id="${clasificacionDeMaltrato}" class="btn btn-danger btn-sm btn-space" onclick="eliminarMaltrato(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="clasificacionDeMaltrato" value = "${clasificacionDeMaltrato}" checked>${clasificacionDeMaltrato}
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- Checkbox -->
                                <div class="form-value-one">
                                    <p class="label-form">Generador del maltrato</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id="hijoLabel">
                                            <input type="checkbox" name="generadorDeMaltrato" value="hijo" autocomplete="off" id="hijo">Hijo
                                        </label>

                                        <label class="btn btn-default" id="conyugeLabel">
                                            <input type="checkbox" name="generadorDeMaltrato" value="cónyuge" autocomplete="off" id="conyuge">Cónyuge
                                        </label>

                                        <label class="btn btn-default" id="nietoLabel">
                                            <input type="checkbox" name="generadorDeMaltrato" value="nieto" autocomplete="off" id="nieto">Nieto
                                        </label>

                                        <label class="btn btn-default" id="hermanoLabel">
                                            <input type="checkbox" name="generadorDeMaltrato" value="hermano" autocomplete="off" id="hermano">Hermano
                                        </label>

                                        <button onClick="agregarCampoGeneradorMaltrato()" class="btn btn-default" id="otro">Otro
                                        </button>

                                    </div>
                                </div>
                                <!-- Text input-->
                                <div id="div_generadoresMaltrato" class="form-value-one hide">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarGeneradorMaltrato()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" id="generadorMaltrato" class="form-control input-short-form" placeholder="Nuera, Yerno, Sobrino, etc." onkeypress="handleGeneradorMaltrato(event)">
                                        
                                    </div>
                                </div>
                                <!-- Checkbox Transportes -->
                                <div id="generadoresMaltrato_agregados">
                                    <c:forEach items="${generadoresExtras}" var="generadorDeMaltrato">
                                        <div class="form-value-one">
                                            <button id="${generadorDeMaltrato}" class="btn btn-danger btn-sm btn-space" onclick="eliminarGeneradorMaltrato(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="generadorDeMaltrato" value = "${generadorDeMaltrato}" checked>${generadorDeMaltrato}
                                        </div>
                                    </c:forEach>
                                </div>
                            </fieldset>
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
        
        //arregla error al cerrar y abrir
        $(".cuestionario").collapse({toggle:false});
        
        /* COLLAPSE FIELDSET */
        $(document).ready(function() {
            $('input[type=radio][name=deteccionDeMaltrato]').change(function() {
                if (this.value == 'si') {
                    $(".cuestionario").collapse('show');
                }
                else if (this.value == 'no') {
                    $(".cuestionario").collapse('hide');
                }
            });
        });
        
        
        
        function agregarMaltrato(){
            
            var maltrato = document.getElementById("maltrato").value;
            if(maltrato!=""){
                document.getElementById("maltrato").value = ""; //borra input del contenido
            
                var maltratos_agregados = document.getElementById("maltratos_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(maltrato);
                var button = document.createElement("button");
                button.id = maltrato;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarMaltrato(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "clasificacionDeMaltrato";
                input.value = maltrato;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                maltratos_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarMaltrato(id){
            
            var maltratos_agregados = document.getElementById("maltratos_agregados");
            var btn = document.getElementById(id);
            maltratos_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleMaltrato(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarMaltrato();
            }
        }
        
        function agregarCampoMaltrato(){
            $("#div_maltrato").removeClass("hide");
            $("#div_maltrato").collapse('toggle');
            
        }
        
        
        
        function agregarGeneradorMaltrato(){
            
            var generadorMaltrato = document.getElementById("generadorMaltrato").value;
            if(generadorMaltrato!=""){
                document.getElementById("generadorMaltrato").value = ""; //borra input del contenido
            
                var generadoresMaltrato_agregados = document.getElementById("generadoresMaltrato_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(generadorMaltrato);
                var button = document.createElement("button");
                button.id = generadorMaltrato;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarGeneradorMaltrato(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "generadorDeMaltrato";
                input.value = generadorMaltrato;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                generadoresMaltrato_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarGeneradorMaltrato(id){
            
            var generadoresMaltrato_agregados = document.getElementById("generadoresMaltrato_agregados");
            var btn = document.getElementById(id);
            generadoresMaltrato_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleGeneradorMaltrato(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarGeneradorMaltrato();
            }
        }
        
        function agregarCampoGeneradorMaltrato(){
            $("#div_generadoresMaltrato").removeClass("hide");
            $("#div_generadoresMaltrato").collapse('toggle');
        }
        
        
        $(document).ready(function(){
            $(".link").click(function(){
                if($("input:checked").length!=0 && $('input[name="deteccionDeMaltrato"]:checked').val() == "si"){
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
