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
    <link href="css/date-picker.css" rel="stylesheet">
    <link href="css/forms.css" rel="stylesheet">
    
    
    <!-- Javascript -->
    <script src="js/main.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/datepicker.js"></script>
    <script src="js/datepicker.es.js" charset="UTF-8"></script>
    
    <!-- calendario -->
    <script>
        $(document).ready(function(){
            $.fn.datepicker.defaults.language = 'es';
        });
        $(function(){
            $('.datepicker').datepicker({
                startView: 0,
                format: "dd/mm/yyyy",
                startDate: '+0d',
                autoclose: true,
                orientation: "bottom auto"
            });
        });
    </script>
    
    <!-- calendario -->
    <script>
        $(document).ready(function(){
            $.fn.datepicker.defaults.language = 'es';
        });
        $(function(){
            $('.datepicker').datepicker({
                startView: 1,
                format: "dd/mm/yyyy",
                startDate: '1d',
                autoclose: true,
                orientation: "bottom auto",
            });
        });
    </script>
    
    <script>
        $(document).ready(function(){
            if("${ans1}" == "true"){
                $('#recomendacionRedistribucion').prop('checked', true);
                $('#recomendacionRedistribucionLabel').addClass('active');
            }
            if("${ans2}" == "true"){
                $('#acompanamiento').prop('checked', true);
                $('#acompanamientoLabel').addClass('active');
            }
            if("${ans3}" == "true"){
                $('#intervencion').prop('checked', true);
                $('#intervencionLabel').addClass('active');
            }
            if("${ans4}" == "true"){
                $('#recomendacionAyuda').prop('checked', true);
                $('#recomendacionAyudaLabel').addClass('active');
            }
            if("${ans5}" == "true"){
                $('#recomendacionPrevencion').prop('checked', true);
                $('#recomendacionPrevencionLabel').addClass('active');
            }
            if("${ans6}" == "true"){
                $('#recomendacionPreventiva').prop('checked', true);
                $('#recomendacionPreventivaLabel').addClass('active');
            }
            if("${ans7}" == "true"){
                $('#entrega').prop('checked', true);
                $('#entregaLabel').addClass('active');
            }
            if("${ans8}" == "true"){
                $('#orientacionDerechos').prop('checked', true);
                $('#orientacionDerechosLabel').addClass('active');
            }
            if("${ans9}" == "true"){
                $('#localizacion').prop('checked', true);
                $('#localizacionLabel').addClass('active');
            }
            if("${ans10}" == "true"){
                $('#orientacionAdministrativa').prop('checked', true);
                $('#orientacionAdministrativaLabel').addClass('active');
            }
            if("${ans11}" == "true"){
                $('#reconocimiento').prop('checked', true);
                $('#reconocimientoLabel').addClass('active');
            }
            if("${ans12}" == "true"){
                $('#recomendacionAlbergues').prop('checked', true);
                $('#recomendacionAlberguesLabel').addClass('active');
            }
            if("${ans13}" == "true"){
                $('#orientacionFamiliar').prop('checked', true);
                $('#orientacionFamiliarLabel').addClass('active');
            }
            if("${ans14}" == "true"){
                $('#recomendacionCentro').prop('checked', true);
                $('#recomendacionCentroLabel').addClass('active');
            }
            if("${ans15}" == "true"){
                $('#ingresa').prop('checked', true);
                $('#ingresaLabel').addClass('active');
            }
            if("${ans16}" == "true"){
                $('#citaGrupo').prop('checked', true);
                $('#citaGrupoLabel').addClass('active');
            }
            if("${ans17}" == "true"){
                $('#orientacionPlan').prop('checked', true);
                $('#orientacionPlanLabel').addClass('active');
            }
            if("${ans18}" == "true"){
                $('#cita').prop('checked', true);
                $('#citaLabel').addClass('active');
                $("#div-cita").collapse("show");
            }
            if("${ans19}" == "true"){
                $('#otro').prop('checked', true);
                $('#otroLabel').addClass('active');
            }
            
            $('#observacion').val("${observacion}");
            
            $('#citaText').val("${cita}");
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
                    <h4>LUIS LÓPEZ PEREZ</h4>
                    <p class="registro"># de registro: 536363</p>
                </li>
                <li class="sidebar-anchor">
                    
                    <a href="#"><span class="icon"><img class="icon-image" src="img/018-boss.png"></span>Datos Generales del Paciente</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#"><span class="icon"><img class="icon-image" src="img/017-network.png"></span>Datos del Cuidador Primario</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#"><span class="icon"><img class="icon-image" src="img/medico-2.png"></span>Tratamiento Farmocológico</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#"><span class="icon"><img class="icon-image" src="img/015-flats.png"></span>Recursos Sociales y Comunitarios</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#"><span class="icon"><img class="icon-image" src="img/011-collaboration.png"></span>Estructura Dinámica y Familiar</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#"><span class="icon"><img class="icon-image" src="img/coins.png"></span>Condiciones Económicas</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#"><span class="icon"><img class="icon-image" src="img/020-hospital.png"></span>Servicio Médico</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#"><span class="icon"><img class="icon-image" src="img/005-warning.png"></span>Maltrato hacia la Persona Adulta Mayor</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#"><span class="icon"><img class="icon-image" src="img/001-house.png"></span>Condiciones de Vivienda</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#"><span class="icon"><img class="icon-image" src="img/medico-4.png"></span>Diagnóstico Social</a>
                </li>
                <li class="sidebar-anchor">
                    <a href="#"><span class="icon"><img class="icon-image" src="img/012-signing.png"></span>Abordaje Social</a>
                </li>
                <li>
                    <a href="#" class="link">Finalizar Valoración</a>
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
                        <img src="img/012-signing.png" alt="device" class="img-header">
                        <h3 class="text-muted">Abordaje Social</h3>
                        <hr>
                        <form class="well form-horizontal" action="abordaje-social" method="post"  id="contact_form">
                            <fieldset>
                                <!-- Checkbox Pregunta 47 -->
                                <div class="form-value-one">
                                    <p class="label-form">Asesoría especializada sobre</p>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id = "recomendacionRedistribucionLabel">
                                            <input type="checkbox" name="abordaje" value="Recomendación de redistribución de cuidados entre familiares" autocomplete="off" id = "recomendacionRedistribucion">Recomendación de redistribución de cuidados entre familiares
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id = "acompanamientoLabel">
                                            <input type="checkbox" name="abordaje" value="Acompañamiento emocional al paciente y cuidador primario" autocomplete="off" id = "acompanamiento">Acompañamiento emocional al paciente y cuidador primario
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id = "intervencionLabel">
                                            <input type="checkbox" name="abordaje" value="Intervención en crisis a familiar colapsado" autocomplete="off" id = "intervencion">Intervención en crisis a familiar colapsado
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id = "recomendacionAyudaLabel">
                                            <input type="checkbox" name="abordaje" value="Recomendación sobre ayuda externa a traves de agencias de cuidadores remunerados" autocomplete="off" id = "recomendacionAyuda">Recomendación sobre ayuda externa a través de agencias de cuidadores remunerados
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id = "recomendacionPrevencionLabel">
                                            <input type="checkbox" name="abordaje" value="Recomendaciones de prevencion de maltrato (tríptico)" autocomplete="off" id = "recomendacionPrevencion">Recomendaciones de prevención de maltrato (tríptico)
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id = "recomendacionPreventivaLabel">
                                            <input type="checkbox" name="abordaje" value="Recomendaciones preventiva de colapso al cuidador" autocomplete="off" id = "recomendacionPreventiva">Recomendaciones preventiva de colapso al cuidador
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id= "entregaLabel">
                                            <input type="checkbox" name="abordaje" value="Entrega de tríptico de opciones de servicios de personas mayores" autocomplete="off" id = "entrega">Entrega de tríptico de opciones de servicios de personas mayores
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="orientacionDerechosLabel">
                                            <input type="checkbox" name="abordaje" value="Orientación sobre derechos de personas mayores (Privilegiar independencia y autonomía)" autocomplete="off" id="orientacionDerechos">Orientación sobre derechos de personas mayores (privilegiar independencia y autonomía)
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="localizacionLabel">
                                            <input type="checkbox" name="abordaje" value="Localización familiar responsable" autocomplete="off" id="localizacion">Localización familiar responsable
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="orientacionAdministrativaLabel">
                                            <input type="checkbox" name="abordaje" value="Orientación sobre dudas administrativas y atención intrahospitalaria" autocomplete="off" id="orientacionAdministrativa">Orientación sobre dudas administrativas y atención intrahospitalaria
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="reconocimientoLabel">
                                            <input type="checkbox" name="abordaje" value="Reconocimiento escrito a la familia por participación activa en el cuidados al paciente" autocomplete="off" id="reconocimiento">Reconocimiento escrito a la familia por participación activa en el cuidados al paciente
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="recomendacionAlberguesLabel">
                                            <input type="checkbox" name="abordaje" value="Recomendación de albergues" autocomplete="off" id="recomendacionAlbergues">Recomendación de albergues
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="orientacionFamiliarLabel">
                                            <input type="checkbox" name="abordaje" value="Orientación familiar sobre cuidados en pacientes con demencia" autocomplete="off" id="orientacionFamiliar">Orientación familiar sobre cuidados en pacientes con demencia
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="recomendacionCentroLabel">
                                            <input type="checkbox" name="abordaje" value="Recomendación de centros de dia o institucionalización" autocomplete="off" id="recomendacionCentro">Recomendación de centros de día o institucionalización
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="ingresaLabel">
                                            <input type="checkbox" name="abordaje" value="Ingresa a programa de apoyo de medicamentos" autocomplete="off" id="ingresa">Ingresa a programa de apoyo de medicamentos
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="citaGrupoLabel">
                                            <input type="checkbox" name="abordaje" value="Cita a grupo de apoyo INCMNSZ de familiares de pacientes con demencia" autocomplete="off" id="citaGrupo">Cita a grupo de apoyo INCMNSZ de familiares de pacientes con demencia
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="orientacionPlanLabel">
                                            <input type="checkbox" name="abordaje" value="Orientación de plan de alta" autocomplete="off" id="orientacionPlan">Orientación de plan de alta
                                        </label>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="citaLabel">
                                            <input type="checkbox" name="abordaje" value="Cita familiar" autocomplete="off" id="cita" >Cita familiar
                                        </label>
                                    </div>
                                    <div id="div-cita" class="collapse">
                                        <label class="control-label">Cita</label>
                                        <div class="inputGroupContainer">
                                            <div class='input-group' style="margin-bottom:10px; width: 180px">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                <input placeholder="dd/mm/aaaa" class="datepicker form-control" name="citaText" type="text" id="citaText">
                                            </div>
                                        </div>
                                    </div>
                                    <div data-toggle="buttons">
                                        <label class="btn btn-default btn-space-large" id="otroLabel">
                                            <input type="checkbox" name="abordaje" value="otro" autocomplete="off" id="otro">Otro
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
        
        
        $("#cita").change(function(){
            $("#div-cita").collapse("toggle");
        });
        
        
    </script>

</body>

</html>
