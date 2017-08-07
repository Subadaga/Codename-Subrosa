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

            switch("${patologia}"){
                case "true":
                    $('#siPatologia').prop('checked', true);
                    $('#siPatologiaLabel').addClass('active');
                    break;
                case "false":
                    $('#noPatologia').prop('checked', true);
                    $('#noPatologiaLabel').addClass('active');
                    break;
            }

            switch("${familia}"){
                case "funcional":
                    $('#funcional').prop('checked', true);
                    $('#funcionalLabel').addClass('active');
                    break;
                case "disfuncional":
                    $('#disfuncional').prop('checked', true);
                    $('#disfuncionalLabel').addClass('active');
                    break;
            }

            if("${conflictosActuales}" == "true"){
                    $('#conflictosActuales').prop('checked', true);
                    $('#conflictosActualesLabel').addClass('active');
            }
            if("${conflictosHistoricos}" == "true"){
                    $('#conflictosHistoricos').prop('checked', true);
                    $('#conflictosHistoricosLabel').addClass('active');
            }

            switch("${comunicacion}"){
                case "true":
                    $('#siProblemas').prop('checked', true);
                    $('#siProblemasLabel').addClass('active');
                    break;
                case "false":
                    $('#noProblemas').prop('checked', true);
                    $('#noProblemasLabel').addClass('active');
                    break;
            }
            
            if("${familiar}" == "true"){
                    $('#familiar').prop('checked', true);
                    $('#familiarLabel').addClass('active');
            }
            if("${extraFamiliar}" == "true"){
                    $('#extraFamiliar').prop('checked', true);
                    $('#extraFamiliarLabel').addClass('active');
            }
            if("${institucional}" == "true"){
                    $('#institucional').prop('checked', true);
                    $('#institucional').addClass('active');
            }

            switch("${desgasteEmocional}"){
                case "sí":
                    $('#siDesgaste').prop('checked', true);
                    $('#siDesgasteLabel').addClass('active');
                    break;
                 case "no":
                    $('#noDesgaste').prop('checked', true);
                    $('#noDesgasteLabel').addClass('active');
                    break;
                case "no por el momento":
                    $('#noMomento').prop('checked', true);
                    $('#noMomentoLabel').addClass('active');
                    break;
            }
            
            switch("${cuidado}"){
                case "adecuados":
                    $('#adecuados').prop('checked', true);
                    $('#adecuadosLabel').addClass('active');
                    break;
                 case "parciales":
                    $('#parciales').prop('checked', true);
                    $('#parcialesLabel').addClass('active');
                    break;
                case "insuficientes":
                    $('#insuficientes').prop('checked', true);
                    $('#insuficientesLabel').addClass('active');
                    break;
                 case "por ahora no requiere":
                    $('#noAhora').prop('checked', true);
                    $('#noAhoraLabel').addClass('active');
                    break;
            }
            
            switch("${supervision}"){
                case "suficiente":
                    $('#suficienteSupervision').prop('checked', true);
                    $('#suficienteSupervisionLabel').addClass('active');
                    break;
                case "por ahora no lo necesita":
                    $('#porAhoraNoSupervision').prop('checked', true);
                    $('#porAhoraNoSupervisionLabel').addClass('active');
                    break;
                case "insuficientes":
                    $('#insuficientesSupervision').prop('checked', true);
                    $('#insuficientesSupervisionLabel').addClass('active');
                    break;
            }
            
            if("${deteccionMaltrato}"=="si"){
                $('#deteccionSi').prop('checked', true);
                $('#deteccionSiLabel').addClass('active');
            }
            else{
                $('#deteccionNo').prop('checked', true);
                $('#deteccionNoLabel').addClass('active');
            }
            
            if("${psicoemocinal}" == "true"){
                $('#psicoemocinal').prop('checked', true);
                $('#psicoemocinalLabel').addClass('active');
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
            if("${patrimonial}" == "true"){
                $('#patrimonial').prop('checked', true);
                $('#patrimonialLabel').addClass('active');
            }
            if("${abandono}" == "true"){
                $('#abandono').prop('checked', true);
                $('#abandonoLabel').addClass('active');
            }
        
            switch("${colapsoCuidador}"){
                case "sin sobrecarga":
                    $('#sinSobrecarga').prop('checked', true);
                    $('#sinSobrecargaLabel').addClass('active');
                    break;
                 case "sobrecarga leve":
                    $('#sobreCargaLeve').prop('checked', true);
                    $('#sobreCargaLeveLabel').addClass('active');
                    break;
                case "sobrecarga intensa":
                    $('#sobreCargaIntensa').prop('checked', true);
                    $('#sobreCargaIntensaLabel').addClass('active');
                    break;
                 case "no se presento el cuidador primario":
                    $('#noSePresento').prop('checked', true);
                    $('#noSePresentoLabel').addClass('active');
                    break;
                case "factores de riesgo para el cuidador":
                    $('#factoresRiesgo').prop('checked', true);
                    $('#factoresRiesgoLabel').addClass('active');
                    break;
            }

            switch("${riesgo}"){
                case "si":
                    $('#siRiesgo').prop('checked', true);
                    $('#siRiesgoLabel').addClass('active');
                    break;
                 case "no":
                    $('#noRiesgo').prop('checked', true);
                    $('#noRiesgoLabel').addClass('active');
                    break;
            }

            switch("${nivelSocioeconomico}"){
                case "extrema pobreza":
                    $('#pobrezaExtrema').prop('checked', true);
                    $('#pobrezaExtremaLabel').addClass('active');
                    break;
                 case "bajo":
                    $('#bajo').prop('checked', true);
                    $('#bajoLabel').addClass('active');
                    break;
                case "medio":
                    $('#medio').prop('checked', true);
                    $('#medioLabel').addClass('active');
                    break;
                 case "alto":
                    $('#alto').prop('checked', true);
                    $('#altoLabel').addClass('active');
                    break;
            }

            if("${insolvencia}" == "true"){
                    $('#insolvencia').prop('checked', true);
                    $('#insolvenciaLabel').addClass('active');
                }
            if("${apoyoFamiliar}" == "true"){
                    $('#faltaApoyo').prop('checked', true);
                    $('#faltaApoyoLabel').addClass('active');
                }

            if("${cuota}" == "true"){
                    $('#cuota').prop('checked', true);
                    $('#cuotaLabel').addClass('active');
                }
            if("${atencion}" == "true"){
                    $('#atencionMedica').prop('checked', true);
                    $('#atencionMedicaLabel').addClass('active');
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
                    <h4>
                        LUIS LÓPEZ PEREZ
                    </h4>
                </li>
                
                <li class="sidebar-anchor">
                    
                    <a href="#" class="link"><span class="icon"><img class="icon-image" src="img/018-boss.png"></span>Datos generales del paciente</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#" class="link"><span class="icon"><img class="icon-image" src="img/017-network.png"></span>Datos del cuidador primario</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#" class="link"><span class="icon"><img class="icon-image" src="img/medico-2.png"></span>Tratamiento farmocológico</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#" class="link"><span class="icon"><img class="icon-image" src="img/015-flats.png"></span>Recursos sociales y comunitarios</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#" class="link"><span class="icon"><img class="icon-image" src="img/011-collaboration.png"></span>Estructura dinámica y familiar</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#" class="link"><span class="icon"><img class="icon-image" src="img/coins.png"></span>Condiciones económicas</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#" class="link"><span class="icon"><img class="icon-image" src="img/020-hospital.png"></span>Servicio médico</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#" class="link"><span class="icon"><img class="icon-image" src="img/005-warning.png"></span>Maltrato hacia la persona adulta mayor</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#" class="link"><span class="icon"><img class="icon-image" src="img/001-house.png"></span>Condiciones de vivienda</a>
                </li >
                <li class="sidebar-anchor">
                    <a href="#" class="link"><span class="icon"><img class="icon-image" src="img/medico-4.png"></span>Diagnóstico social</a>
                </li>
                <li class="sidebar-anchor">
                    <a href="#" class="link"><span class="icon"><img class="icon-image" src="img/012-signing.png"></span>Abordaje social</a>
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
                        
                        <img src="img/medico-4.png" alt="device" class="img-header">
                        
                        <h3 class="text-muted">Diagnóstico social</h3>
                        <hr>

                        <form class="well form-horizontal form-save" action="diagnostico-social" method="post"  id="form">
                            <fieldset>
                                
                                <div class="form-value-one">
                                    <p class="label-form">Patología</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "siPatologiaLabel">
                                            <input type="radio" name="patologia" value="si" id = "siPatologia">Sí
                                        </label> 
                                        <label class="btn btn-default" id = "noPatologiaLabel">
                                            <input type="radio" name="patologia" value="no" id = "noPatologia">No
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="form-value-one">
                                    <p class="label-form">Familia</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "funcionalLabel">
                                            <input type="radio" name="familia" value="funcional" id="funcional">Funcional
                                        </label> 
                                        <label class="btn btn-default" id = "disfuncionalLabel">
                                            <input type="radio" name="familia" value="disfuncional" id="disfuncional">Disfuncional
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="form-value-one">
                                    <p class="label-form">Dinámica e historia familiar</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "conflictosActualesLabel">
                                            <input type="checkbox" name="historiaFamiliar" value="actual" autocomplete="off" id = "conflictosActuales">Conflictos familiares actuales
                                        </label> 
                                        <label class="btn btn-default" id = "conflictosHistoricosLabel">
                                            <input type="checkbox" name="historiaFamiliar" value="historicos" autocomplete="off" id = "conflictosHistoricos">Conflictos familiares históricos
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="form-value-one">
                                    <p class="label-form">Problemas de comunicación entre familiares</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "siProblemasLabel">
                                            <input type="radio" name="problemasComunicacion" value="si" id = "siProblemas" >Sí
                                        </label> 
                                        <label class="btn btn-default" id = "noProblemasLabel">
                                            <input type="radio" name="problemasComunicacion" value="no" id = "noProblemas">No
                                        </label>
                                    </div>
                                </div>
                                
                                     <div class="form-value-one">
                                    <p class="label-form">Red de apoyo</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        
                                        <label class="btn btn-default" id = "familiarLabel">
                                            <input type="checkbox" name="redDeApoyo" value="familiar" autocomplete="off" id = "familiar">Familiar
                                        </label>

                                        <label class="btn btn-default" id = "extraFamiliarLabel">
                                            <input type="checkbox" name="redDeApoyo" value="extra-familiar" autocomplete="off" id = "extraFamiliar">Extra-familiar
                                        </label>

                                        <label class="btn btn-default" id = "institucionalLabel">
                                            <input type="checkbox" name="redDeApoyo" value="institucional" autocomplete="off" id = "institucional">Institucional
                                        </label>

                                    </div>
                                </div>
                                
                                <div class="form-value-one">
                                    <p class="label-form">Desgaste emocional de la familia</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "siDesgasteLabel">
                                            <input type="radio" name="desgasteEmocional" value="sí" id="siDesgaste">Sí
                                        </label> 
                                        <label class="btn btn-default"id = "noDesgasteLabel">
                                            <input type="radio" name="desgasteEmocional" value="no" id="noDesgaste">No
                                        </label>
                                        <label class="btn btn-default" id = "noMomentoLabel">
                                            <input type="radio" name="desgasteEmocional" value="no por el momento" id="noMomento">No por el momento
                                        </label>
                                    </div>
                                </div>
                                
                                <!-- Radio button cuidado -->
                                <div class="form-value-one">
                                    <p class="label-form">Red de cuidados de la familia al anciano</p>
                                    <div class="btn-group" id="cuidado-options" data-toggle="buttons">
                                        <label class="btn btn-default" id = "adecuadosLabel">
                                            <input type="radio" name="cuidado" value="adecuados" autocomplete="off" id = "adecuados">Adecuados
                                        </label>

                                        <label class="btn btn-default" id = "parcialesLabel">
                                            <input type="radio" name="cuidado" value="parciales" autocomplete="off" id = "parciales">Parciales
                                        </label>

                                        <label class="btn btn-default" id = "insuficientesLabel">
                                            <input type="radio" name="cuidado" value="insuficientes" autocomplete="off" id = "insuficientes">Insuficientes
                                        </label>

                                        <label class="btn btn-default" id = "noAhoraLabel">
                                            <input type="radio" name="cuidado" value="por ahora no requiere" autocomplete="off" id = "noAhora">Por ahora no requiere
                                        </label>

                                        <button id="btn-cuidado" onClick="agregarCampoCuidado()" class="btn btn-default" >Otro
                                        </button>

                                    </div>
                                </div>
                                
                                <!-- Text input cuidado-->
                                <div id="div_cuidado" class="form-value-one collapse hide">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarCuidado()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="cuidado" class="form-control input-short-form" placeholder="Agrega otro tipo de cuidado" onkeypress="handleCuidado(event)">
                                        
                                    </div>
                                </div>
                                
                                <!-- Checkbox cuidado -->
                                
                                <div id="cuidado_agregado">
                                    <c:forEach items="${ciudados}" var="cuidado">
                                        <div class="form-value-one">
                                            <button id="${cuidado}" class="btn btn-danger btn-sm btn-space" onclick="eliminarCuidado(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="cuidado" value="${cuidado}">${cuidado}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                
                                <!-- Radio button supervisión -->
                                <div class="form-value-one">
                                    <p class="label-form">Supervisión de la familia hacia el anciano</p>
                                    <div class="btn-group" id="supervision-options" data-toggle="buttons">
                                        <label class="btn btn-default" id = "suficienteSupervisionLabel">
                                            <input type="radio" name="supervision" value="suficiente" autocomplete="off" id = "suficienteSupervision">Suficiente
                                        </label>

                                        <label class="btn btn-default" id = "porAhoraNoSupervisionLabel">
                                            <input type="radio" name="supervision" value="por ahora no lo necesita" autocomplete="off" id = "porAhoraNoSupervision">Por ahora no lo necesita
                                        </label>

                                        <label class="btn btn-default" id = "insuficientesLabelSupervision">
                                            <input type="radio" name="supervision" value="insuficientes" autocomplete="off" id = "insuficientesSupervision">Insuficientes
                                        </label>

                                        <button id="btn-supervision" onClick="agregarCampoSupervision()" class="btn btn-default">Otro
                                        </button>

                                    </div>
                                </div>
                                
                                <!-- Text input supervision-->
                                <div id="div_supervision" class="form-value-one collapse hide">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarSupervision()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="supervision" class="form-control input-short-form" placeholder="Agrega otro tipo de supervision" onkeypress="handleSupervision(event)">
                                        
                                    </div>
                                </div>
                                
                                <!-- Checkbox supervision -->
                                
                                <div id="supervision_agregado">
                                    <c:forEach items="${supervisiones}" var="supervision">
                                        <div class="form-value-one">
                                            <button id="${supervision}" class="btn btn-danger btn-sm btn-space" onclick="eliminarSupervision(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="supervision" value="${supervision}">${supervision}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                
                                <div class="form-value-one">
                                    <p class="label-form">Detección de maltrato</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id="deteccionSiLabel">
                                            <input type="radio" name="deteccionDeMaltrato" id="deteccionSi" value="si">Sí
                                        </label> 
                                        <label class="btn btn-default" id="deteccionNoLabel">
                                            <input type="radio" name="deteccionDeMaltrato" id="deteccionNo" value="no">No
                                        </label>
                                    </div>
                                </div>
                                <div class="collapse cuestionario">
                                    <!-- Checkbox -->
                                    <div class="form-value-one" id="camposMaltrato">
                                        <p class="label-form">Clasificación de maltrato</p>
                                        <div disabled class="btn-group" data-toggle="buttons">
                                            <label class="btn btn-default" id="psicoemocionalLabel">
                                                <input type="checkbox" name="clasificacionDeMaltrato" value="psico-emocional" id="psicoemocional" autocomplete="off">Psico-emocional
                                            </label>

                                            <label class="btn btn-default" id="fisicoLabel">
                                                <input type="checkbox" name="clasificacionDeMaltrato" value="físico" id="fisico" autocomplete="off">Físico
                                            </label>

                                            <label class="btn btn-default" id="negligenciaLabel">
                                                <input type="checkbox" name="clasificacionDeMaltrato" value="negligencia" id="negligencia" autocomplete="off">Negligencia
                                            </label>

                                            <label class="btn btn-default" id="sexualLabel">
                                                <input type="checkbox" name="clasificacionDeMaltrato" value="sexual" id="sexual" autocomplete="off">Sexual
                                            </label>

                                            <label class="btn btn-default" id="financieroLabel">
                                                <input type="checkbox" name="clasificacionDeMaltrato" value="financiero" id="financiero" autocomplete="off">Financiero
                                            </label>

                                            <label class="btn btn-default" id="patrimonialLabel">
                                                <input type="checkbox" name="clasificacionDeMaltrato" value="patrimonial" id="patrimonial" autocomplete="off">Patrimonial
                                            </label>

                                            <label class="btn btn-default" id="abandonoLabel">
                                                <input type="checkbox" name="clasificacionDeMaltrato" value="abandono" id="abandono" autocomplete="off">Abandono
                                            </label>

                                            <button onClick="agregarCampoMaltrato()" class="btn btn-default">Otro
                                            </button>

                                        </div>
                                    </div>
                                </div>
                                    <!-- Text input-->
                                    <div id="div_maltrato" class="form-value-one hide">
                                        <p class="label-form">Tipos de Maltrato</p>
                                        <div class="input-group">
                                            <span class="input-group-btn">
                                                <button onClick="agregarMaltrato()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                            </span>
                                            <input type="text" id="maltrato" class="form-control input-short-form" placeholder="Escribir tipo de Maltrato" onkeypress="handleMaltrato(event)">

                                        </div>
                                    </div>
                                    <!-- Checkbox Otros Tipos de Maltrato -->
                                    <div id="maltratos_agregados">
                                        <c:forEach items="${maltratos}" var="maltrato">
                                            <div class="form-value-one">
                                                <button id="${maltrato}" class="btn btn-danger btn-sm btn-space" onclick="eliminarMaltrato(this.id)">
                                                    <span class="glyphicon glyphicon-remove"></span>
                                                </button>
                                                <input class="checkbox-agregados" type="checkbox" name="clasificacionDeMaltrato" value="${maltrato}">${maltrato}
                                            </div>
                                        </c:forEach>
                                    </div>
                                
                                 <!-- Radio button Colapso del cuidador -->
                                <div class="form-value-one">
                                    <p class="label-form">Colapso del cuidador</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "sinSobreCargaLabel">
                                            <input type="radio" name="colapso" value="sin sobrecarga" autocomplete="off" id = "sinSobreCarga">Sin sobrecarga
                                        </label>

                                        <label class="btn btn-default" id = "sobreCargaLeveLabel">
                                            <input type="radio" name="colapso" value="sobrecarga leve" autocomplete="off" id = "sobreCargaLeve">Sobrecarga leve
                                        </label>

                                        <label class="btn btn-default" id = "sobreCargaIntensaLabel">
                                            <input type="radio" name="colapso" value="sobrecarga intensa" autocomplete="off" id = "sobreCargaIntensa">Sobrecarga intensa
                                        </label>
                                        
                                        <label class="btn btn-default" id = "noSePresentoLabel">
                                            <input type="radio" name="colapso" value="no se presento el cuidador primario" autocomplete="off" id = "noSePresento">No se presentó el cuidador primario
                                        </label>
                                        
                                        <label class="btn btn-default" id = "factoresRiesgoLabel">
                                            <input type="radio" name="colapso" value="factores de riesgo para el cuidador" autocomplete="off" id = "factoresRiesgo">Factores de riesgo para el cuidador
                                        </label>

                                    </div>
                                </div>
                                
                                
                                <div class="form-value-one">
                                    <p class="label-form">Riesgos arquitectónicos</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "siRiesgoLabel">
                                            <input type="radio" name="riesgo" value="si" id = "siRiesgo">Sí
                                        </label> 
                                        <label class="btn btn-default" id = "noRiesgoLabel">
                                            <input type="radio" name="riesgo" value="no" id = "noRiesgo">No
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="form-value-one">
                                    <p class="label-form">Nivel socioeconómico</p>

                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "pobrezaExtremaLabel">
                                            <input type="radio" name="nivelSocioeconomico" value="extrema pobreza" id = "pobrezaExtrema">Extrema pobreza
                                        </label> 
                                        <label class="btn btn-default" id = "bajoLevel">
                                            <input type="radio" name="nivelSocioeconomico" value="bajo" id = "bajo">Bajo
                                        </label>
                                        <label class="btn btn-default" id = "medioLabel">
                                            <input type="radio" name="nivelSocioeconomico" value="medio" id = "medio">Medio
                                        </label> 
                                        <label class="btn btn-default" id = "altoLabel">
                                            <input type="radio" name="nivelSocioeconomico" value="alto" id = "alto">Alto 
                                        </label>
                                    </div>
                                </div>
                                
                                
                                <!-- Checkbox Desapego terapeutico -->
                                <div class="form-value-one">
                                    <p class="label-form">Desapego terapéutico por...</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "insolvenciaLabel">
                                            <input type="checkbox" name="desapegoTerapeutico" value="insolvencia económica" autocomplete="off" id = "insolvencia">Insolvencia económica
                                        </label>

                                        <label class="btn btn-default" id = "faltaApoyoLabel">
                                            <input type="checkbox" name="desapegoTerapeutico" value="falta de apoyo familiar" autocomplete="off" id = "faltaApoyo">Falta de apoyo familiar
                                        </label>
                                        
                                        <button onClick="agregarCampoDesapegoTerapeutico()" class="btn btn-default" id = "otro">Otro
                                        </button>

                                    </div>
                                </div>
                                
                                <!-- Text input desapegoTerapeutico -->
                                <div id="div_desapegoTerapeutico" class="form-value-one collapse">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarDesapegoTerapeutico()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="desapegoTerapeutico" class="form-control input-short-form" placeholder="Agregar desapegos terapéuticos" onkeypress="handleDesapegoTerapeutico(event)">
                                        
                                    </div>
                                </div>
                                
                                <!-- Checkbox desapegoTerapeutico -->
                                
                                <div id="desapegoTerapeutico_agregados">
                                    <c:forEach items="${desapegosExtras}" var="desapegoTerapeutico">
                                        <div class="form-value-one">
                                            <button id="${desapegoTerapeutico}" class="btn btn-danger btn-sm btn-space" onclick="eliminarDesapegoTerapeutico(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="desapegoTerapeutico" value="${desapegoTerapeutico}" checked>${desapegoTerapeutico}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                
                                <!-- Checkbox -->
                                <div class="form-value-one">
                                    <p class="label-form">Queja en otra área</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "cuotaLabel">
                                            <input type="checkbox" name="queja" value="cuota de pago" autocomplete="off" id = "cuota">Cuota de pago
                                        </label>

                                        <label class="btn btn-default" id = "atencionMedicaLabel">
                                            <input type="checkbox" name="queja" value="atención médica" autocomplete="off" id = "atencionMedica">Atención médica
                                        </label>

                                        <button onClick="agregarCampoQueja()" class="btn btn-default" id = "otro">Otro
                                        </button>

                                    </div>
                                </div>
                                
                                <!-- Text input-->
                                <div id="div_queja" class="form-value-one collapse">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarQueja()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="queja" class="form-control input-short-form" placeholder="Agregar otra queja" onkeypress="handleQueja(event)">
                                        
                                    </div>
                                </div>
                                
                                <!-- Checkbox Queja -->
                                
                                <div id="queja_agregados">
                                   <c:forEach items="${quejasExtras}" var="queja">
                                        <div class="form-value-one">
                                            <button id="${queja}" class="btn btn-danger btn-sm btn-space" onclick="eliminarQueja(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="queja" value="${queja}" checked>${queja}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                <!-- Text area -->
                                <div id="div_caidas" class="form-value-one">
                                    <textarea class="form-control" rows="5" name="observaciones" placeholder="Escriba las observaciones del paciente" id = "observacion"></textarea>
                                </div>
                                <!-- Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label"></label>
                                    <div class="col-md-4">
                                        <button type="submit" class="btn btn-primary-4" name="id" value="${valoracion.id}" >Guardar <span class="glyphicon glyphicon-floppy-disk"></span></button>
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
        //arregla error al cerrar y abrir
        $("#div_cuidado").collapse({toggle:false});
        
        function agregarCuidado(){
            
            var cuidado = document.getElementById("cuidado").value;
            if(cuidado!=""){
                document.getElementById("cuidado").value = ""; //borra input del contenido
            
                var cuidado_agregado = document.getElementById("cuidado_agregado");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(cuidado);
                var button = document.createElement("button");
                button.id = "id-cuidado";
                button.className = "btn btn-danger btn-md btn-space";
                button.setAttribute("onClick","eliminarCuidado(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "radio";
                input.name = "cuidado";
                input.value = cuidado;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                cuidado_agregado.appendChild(div);
                $("#div_cuidado").addClass("hide");
                $("#div_cuidado").collapse('hide');
                $("#btn-cuidado").css({"color": "#fff","background-color": "#1ac","border-color": "#19b"});
            }
        
        }
        
        function eliminarCuidado(){
            
            var cuidado_agregado = document.getElementById("cuidado_agregado");
            var btn = document.getElementById("id-cuidado");
            cuidado_agregado.removeChild(btn.parentElement);
            $("#btn-cuidado").css({"color": "","background-color": "","border-color": ""});
            var activeRemove = document.querySelector('#btn-cuidado.active');
            activeRemove.classList.remove('active');
        }
        
        function handleCuidado(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarCuidado();
            }
        }
        
        function agregarCampoCuidado(){
            var id_cuidado = document.getElementById("id-cuidado");
            if(id_cuidado == null){
                $("#cuidado-options > label").removeClass("active");
                $("#div_cuidado").removeClass("hide");
                $("#div_cuidado").collapse('toggle');
            }
        }
        
        $("#cuidado-options > label").click(function(){
            var id_cuidado = document.getElementById("id-cuidado");
            if(id_cuidado != null){
                eliminarCuidado();
            }
            $("#div_cuidado").collapse("hide");
        });
        
        
        //arregla error al cerrar y abrir
        $("#div_supervision").collapse({toggle:false});
        
        function agregarSupervision(){
            
            var supervision = document.getElementById("supervision").value;
            if(supervision!=""){
                document.getElementById("supervision").value = ""; //borra input del contenido
            
                var supervision_agregado = document.getElementById("supervision_agregado");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(supervision);
                var button = document.createElement("button");
                button.id = "id-supervision";
                button.className = "btn btn-danger btn-md btn-space";
                button.setAttribute("onClick","eliminarSupervision(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "radio";
                input.name = "supervision";
                input.value = supervision;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                supervision_agregado.appendChild(div);
                $("#div_supervision").addClass("hide");
                $("#div_supervision").collapse('hide');
                $("#btn-supervision").css({"color": "#fff","background-color": "#1ac","border-color": "#19b"});
            }
        
        }
        
        function eliminarSupervision(){
            
            var supervision_agregado = document.getElementById("supervision_agregado");
            var btn = document.getElementById("id-supervision");
            supervision_agregado.removeChild(btn.parentElement);
            $("#btn-supervision").css({"color": "","background-color": "","border-color": ""});
            var activeRemove = document.querySelector('#btn-supervision.active');
            activeRemove.classList.remove('active');
        }
        
        function handleSupervision(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarSupervision();
            }
        }
        
        function agregarCampoSupervision(){
            var id_supervision = document.getElementById("id-supervision");
            if(id_supervision == null){
                $("#supervision-options > label").removeClass("active");
                $("#div_supervision").removeClass("hide");
                $("#div_supervision").collapse('toggle');
            }
        }
        
        $("#supervision-options > label").click(function(){
            var id_supervision = document.getElementById("id-supervision");
            if(id_supervision != null){
                eliminarSupervision();
            }
            $("#div_supervision").collapse("hide");
        });
        
        
        //arregla error al cerrar y abrir
        $(".cuestionario").collapse({toggle:false});
        
        
        /* COLLAPSE FIELDSET */
        $(document).ready(function() {
            $('input[type=radio][name=deteccionDeMaltrato]').change(function() {
                if (this.value == 'sí') {
                    $(".cuestionario").collapse('show');
                }
                else if (this.value == 'no') {
                    $(".cuestionario").collapse('hide');
                }
            });
        });
        
        
        
        function agregarSubtipo(){
            
            var subtipo = document.getElementById("subtipo").value;
            if(subtipo!=""){
                document.getElementById("subtipo").value = ""; //borra input del contenido
            
                var subtipos_agregados = document.getElementById("subtipos_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(subtipo);
                var button = document.createElement("button");
                button.id = subtipo;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarSubtipo(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "clasificacionDeMaltrato";
                input.value = "negligencia " + subtipo;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                subtipos_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarSubtipo(id){
            
            var subtipos_agregados = document.getElementById("subtipos_agregados");
            var btn = document.getElementById(id);
            subtipos_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleSubtipo(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarSubtipo();
            }
        }
        
        function agregarCampoSubtipo(){
            $("#div_subtipo").removeClass("hide");
        }
        
        
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
        }
        
        
        
        
        function agregarDesapegoTerapeutico(){
            
            var desapegoTerapeutico = document.getElementById("desapegoTerapeutico").value;
            if(desapegoTerapeutico!=""){
                document.getElementById("desapegoTerapeutico").value = ""; //borra input del contenido
            
                var desapegoTerapeutico_agregados = document.getElementById("desapegoTerapeutico_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(desapegoTerapeutico);
                var button = document.createElement("button");
                button.id = desapegoTerapeutico;
                button.className = "btn btn-danger btn-md btn-space";
                button.setAttribute("onClick","eliminarDesapegoTerapeutico(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "desapegoTerapeutico";
                input.value = desapegoTerapeutico;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                desapegoTerapeutico_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarDesapegoTerapeutico(id){
            
            var desapegoTerapeutico_agregados = document.getElementById("desapegoTerapeutico_agregados");
            var btn = document.getElementById(id);
            desapegoTerapeutico_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleDesapegoTerapeutico(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarDesapegoTerapeutico();
            }
        }
        
        function agregarCampoDesapegoTerapeutico(){
            $("#div_desapegoTerapeutico").collapse("toggle");
        }
        
        
        
        function agregarQueja(){
            
            var queja = document.getElementById("queja").value;
            if(queja!=""){
                document.getElementById("queja").value = ""; //borra input del contenido
            
                var queja_agregados = document.getElementById("queja_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(queja);
                var button = document.createElement("button");
                button.id = queja;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarQueja(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "queja";
                input.value = queja;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                queja_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarQueja(id){
            
            var queja_agregados = document.getElementById("queja_agregados");
            var btn = document.getElementById(id);
            queja_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleQueja(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarQueja();
            }
        }
        
        function agregarCampoQueja(){
            $("#div_queja").collapse("toggle");
        }
        
        var n=0;
        function agregarDescripcionPatologia(){
            n++;
            var descripcionPatologia = document.getElementById("descripcionPatologia").value;
            if(descripcionPatologia!=""){
                document.getElementById("descripcionPatologia").value = ""; //borra input del contenido
            
                var descripcionPatologia_agregados = document.getElementById("descripcionPatologia_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(descripcionPatologia);
                var button = document.createElement("button");
                button.id = n;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarDescripcionPatologia(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "descripcionPatologia";
                input.value = descripcionPatologia;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                descripcionPatologia_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarDescripcionPatologia(id){
            
            var descripcionPatologia = document.getElementById("descripcionPatologia");
            var btn = document.getElementById(id);
            descripcionPatologia.removeChild(btn.parentElement);
        
        }
        
        function handleDescripcionPatologia(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarDescripcionPatologia();
            }
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
