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
            
            if("${lentes}"=="true"){
                $('#lentes').prop('checked', true);
                $('#lentesLabel').addClass('active');
            }
            if("${marcha}"=="true"){
                $('#marcha').prop('checked', true);
                $('#marchaLabel').addClass('active');
            }
            if("${dental}"=="true"){
                $('#dental').prop('checked', true);
                $('#dentalLabel').addClass('active');
            }
            if("${auditivo}"=="true"){
                $('#auditivo').prop('checked', true);
                $('#auditivoLabel').addClass('active');
            }
            if("${silla}"=="true"){
                $('#silla').prop('checked', true);
                $('#sillaLabel').addClass('active');
            }
            
            
            if("${institucion}"=="true"){
                $('#institucion').prop('checked', true);
                $('#institucionLabel').addClass('active');
            }
            if("${estancia}"=="true"){
                $('#estancia').prop('checked', true);
                $('#estanciaLabel').addClass('active');
            }
            
            
            switch("${dependencia}"){
                case "independiente":
                    $('#independiente').prop('checked', true);
                    $('#independienteLabel').addClass('active');
                    break;
                case "parcialmente independiente":
                    $('#parcialmente').prop('checked', true);
                    $('#parcialmenteLabel').addClass('active');
                    break;
                case "inicialmente dependiente":
                    $('#inicialmente').prop('checked', true);
                    $('#inicialmenteLabel').addClass('active');
                    break;
                case "dependiente":
                    $('#dependiente').prop('checked', true);
                    $('#dependienteLabel').addClass('active');
                    break;
            }
            
            if("${pareja}"=="true"){
                $('#pareja').prop('checked', true);
                $('#parejaLabel').addClass('active');
            }
            if("${familiar}"=="true"){
                $('#familiar').prop('checked', true);
                $('#familiarLabel').addClass('active');
            }
            if("${amistad}"=="true"){
                $('#amistad').prop('checked', true);
                $('#amistadLabel').addClass('active');
            }
            if("${mascota}"=="true"){
                $('#mascota').prop('checked', true);
                $('#mascotaLabel').addClass('active');
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
                    <a href="/socialis/cuidador?action=finalizar&id=${valoracion.id}" class="link">Finalizar valoración</a>
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
                        
                        <img src="img/018-boss.png" alt="device" class="img-header">
                        
                        <h3 class="text-muted">Datos generales del paciente</h3>
                        <hr>

                        <form class="well form-horizontal" action="paciente" method="post"  id="contact_form">
                            <fieldset>
                                <div class="form-value-one">
                                    <p class="label-form">El paciente usa..</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id="lentesLabel">
                                            <input type="checkbox" name="utensilio" value="lentes" autocomplete="off" id="lentes">Lentes
                                        </label>
                                        <label class="btn btn-default" id = "marchaLabel">
                                            <input type="checkbox" name="utensilio" value="auxiliar de la marcha" autocomplete="off" id = "marcha">Auxiliar de la marcha
                                        </label>
                                        <label class="btn btn-default" id = "dentalLabel">
                                            <input type="checkbox" name="utensilio" value="protesis dental" autocomplete="off" id = "dental">Protesis dental
                                        </label>

                                        <label class="btn btn-default" id = "auditivoLabel">
                                            <input type="checkbox" name="utensilio" value="aparato auditivo" autocomplete="off" id = "auditivo">Aparato auditivo
                                        </label>

                                        <label class="btn btn-default" id="sillaLabel">
                                            <input type="checkbox" name="utensilio" value="silla de ruedas" autocomplete="off" id="silla">Silla de ruedas
                                        </label>

                                        <button onClick="agregarCampoUtensilio()" class="btn btn-default" id="otro">Otro
                                        </button>

                                    </div>
                                </div>
                                <div id="div_utensilio" class="form-value-one collapse">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarUtensilio()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="utensilio" class="form-control input-short-form" placeholder="Agregar otro utensilio" onkeypress="handleUtensilio(event)">
                                        
                                    </div>
                                </div>
                                
                                <div id="utensilios_agregados">
                                    <c:forEach items="${auxiliaresExtras}" var="auxiliar">
                                        <div class="form-value-one">
                                            <button id="${auxiliar}" class="btn btn-danger btn-sm btn-space" onclick="eliminarUtensilio(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="utensilio" value="${auxiliar}" checked>${auxiliar}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                <div class="form-value-one">
                                    <p class="label-form">El paciente asiste a..</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id="institucionLabel">
                                            <input type="checkbox" name="lugar" value="institucion" autocomplete="off" id="institucion">Una institución a realizar acitividades
                                        </label>
                                        <label class="btn btn-default" id="estanciaLabel">
                                            <input type="checkbox" name="lugar" value="estancia" autocomplete="off" id="estancia">Estancia de Día
                                        </label>
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="form-value-one">
                                    <p class="label-form">Actividades principales</p>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarActividad()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="actividad" class="form-control input-short-form" placeholder="Caminar, bailar, ver la televisión, etc." onkeypress="handleActividad(event)">
                                        
                                    </div>
                                </div>
                                
                                <div id="actividades_agregadas">
                                    <c:forEach items="${actividades}" var="actividad">
                                        <div class="form-value-one">
                                            <button id="${actividad}" class="btn btn-danger btn-sm btn-space" onclick="eliminarActividad(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="actividad" value="${actividad}" checked>${actividad}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                <div class="form-value-one">
                                    <p class="label-form">Perdidas recientes</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id="parejaLabel">
                                            <input type="checkbox" name="perdida" value="pareja" id="pareja" autocomplete="off">Pareja
                                        </label>
                                        <label class="btn btn-default" id="familiarLabel">
                                            <input type="checkbox" name="perdida" value="familiar" id="familiar" autocomplete="off">Familiar
                                        </label>

                                        <label class="btn btn-default" id="amistadLabel">
                                            <input type="checkbox" name="perdida" value="amistad" id="amistad" autocomplete="off">Amistad
                                        </label>

                                        <label class="btn btn-default" id="mascotaLabel">
                                            <input type="checkbox" name="perdida" value="mascota" id="mascota" autocomplete="off">Mascota
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="form-value-one">
                                    <p class="label-form">Grado de dependencia</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id="independienteLabel">
                                            <input type="radio" name="dependencia" value="independiente" id="independiente" autocomplete="off">Independiente
                                        </label>
                                        <label class="btn btn-default" id="parcialmenteLabel">
                                            <input type="radio" name="dependencia" value="parcialmente independiente" id="parcialmente"  autocomplete="off">Parcialmente independiente
                                        </label>

                                        <label class="btn btn-default" id="inicialmenteLabel">
                                            <input type="radio" name="dependencia" value="inicialmente dependiente" id="inicialmente"  autocomplete="off">Inicialmente dependiente
                                        </label>

                                        <label class="btn btn-default" id="dependienteLabel">
                                            <input type="radio" name="dependencia" value="dependiente" id="dependiente"  autocomplete="off">Dependiente
                                        </label>
                                    </div>
                                </div>
                                <div class="form-value-one">
                                    <p class="label-form">Diagnóstico médico</p>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarDiagnostico()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="diagnostico" class="form-control input-short-form" placeholder="Agregar diagnóstico médico" onkeypress="handleDiagnostico(event)">
                                    </div>
                                </div>
                                <!-- Checkbox Medicamentos -->
                                <div id="diagnosticos_agregados">
                                    <c:forEach items="${diagnosticos}" var="diagnosticoItem">
                                        <div class="form-value-one">
                                            <button id="${diagnosticoItem}" class="btn btn-danger btn-sm btn-space" onclick="eliminarDiagnostico(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="diagnostico" value="${diagnosticoItem}" checked />${diagnosticoItem}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                <div class="form-value-one">
                                    <p class="label-form">Síndromes geriátricos</p>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarSindrome()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="sindrome" class="form-control input-short-form" placeholder="Agregar síndromes geriátricos" onkeypress="handleSindrome(event)">
                                    </div>
                                </div>
                                <div id="sindromes_agregados">
                                    <c:forEach items="${sindromes}" var="sindrome">
                                        <div class="form-value-one">
                                            <button id="${sindrome}" class="btn btn-danger btn-sm btn-space" onclick="eliminarSindrome(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="sindrome" value = "${sindrome}" checked>${sindrome}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                 <div class="form-value-one">
                                    <p class="label-form">Observaciones</p>
                                </div>
                                <!-- Text area -->
                                <div id="div_caidas" class="form-value-one">
                                    <textarea class="form-control" rows="5" name="observacion" placeholder="Escriba las observaciones del paciente" id="observacion"></textarea>
                                </div>
                                
                                <!-- Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label"></label>
                                    <div class="col-md-4">
                                        <button type="submit" class="btn btn-primary" name="id" value="${valoracion.id}" >Guardar <span class="glyphicon glyphicon-floppy-disk"></span></button>
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
        $("#div_parentesco").collapse({toggle:false});
    </script>
    
    <script>
        function agregarActividad(){
            var actividad = document.getElementById("actividad").value;
            if(actividad!=""){
                document.getElementById("actividad").value = ""; //borra input del contenido
            
                var actividades_agregadas = document.getElementById("actividades_agregadas");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(actividad);
                var button = document.createElement("button");
                button.id = actividad;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarActividad(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "actividad";
                input.value = actividad;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                actividades_agregadas.appendChild(div);   
            }
        }
        
        function eliminarActividad(id){
            var actividades_agregadas = document.getElementById("actividades_agregadas");
            var btn = document.getElementById(id);
            actividades_agregadas.removeChild(btn.parentElement);
        }
        
        function handleActividad(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarActividad();
            }
        }
        
        function agregarUtensilio(){
            
            var utensilio = document.getElementById("utensilio").value;
            if(utensilio!=""){
                document.getElementById("utensilio").value = "";
                var utensilios_agregados = document.getElementById("utensilios_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(utensilio);
                var button = document.createElement("button");
                button.id = utensilio;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarUtensilio(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "utensilio";
                input.value = utensilio;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                utensilios_agregados.appendChild(div);
            }
        }
        
        function eliminarUtensilio(id){
            var utensilios_agregados = document.getElementById("utensilios_agregados");
            var btn = document.getElementById(id);
            utensilios_agregados.removeChild(btn.parentElement);
        }
        
        function handleUtensilio(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarUtensilio();
            }
        }
        
        function agregarCampoUtensilio(){
            $("#div_utensilio").collapse("toggle");
        }
        
        function agregarDiagnostico(){
            var diagnostico = document.getElementById("diagnostico").value;
            if(diagnostico!=""){
                document.getElementById("diagnostico").value = ""; //borra input del contenido
            
                var diagnosticos_agregados = document.getElementById("diagnosticos_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(diagnostico);
                var button = document.createElement("button");
                button.id = diagnostico;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarDiagnostico(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "diagnostico";
                input.value = diagnostico;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                diagnosticos_agregados.appendChild(div);   
            }
        }
        
        function eliminarDiagnostico(id){
            var diagnosticos_agregados = document.getElementById("diagnosticos_agregados");
            var btn = document.getElementById(id);
            diagnosticos_agregados.removeChild(btn.parentElement);
        }
        
        function handleDiagnostico(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarDiagnostico();
            }
        }
        
        function agregarSindrome(){
            var sindrome = document.getElementById("sindrome").value;
            if(sindrome!=""){
                document.getElementById("sindrome").value = "";
                var sindromes_agregados = document.getElementById("sindromes_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(sindrome);
                var button = document.createElement("button");
                button.id = sindrome;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarSindrome(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "sindrome";
                input.value = sindrome;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                sindromes_agregados.appendChild(div);
            }
        }
        
        function eliminarSindrome(id){
            var sindromes_agregados = document.getElementById("sindromes_agregados");
            var btn = document.getElementById(id);
            sindromes_agregados.removeChild(btn.parentElement);
        }
        
        function handleSindrome(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarSindrome();
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
