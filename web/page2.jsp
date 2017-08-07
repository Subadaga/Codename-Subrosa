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
                startView: 3,
                format: "dd/mm/yyyy",
                startDate: '-130y',
                endDate: '-1d',
                autoclose: true,
                orientation: "bottom auto",
                defaultViewDate: { year: 1910, month: 01, day: 01 }
            });
        });
    </script>
    <script>
        $(document).ready(function(){
            $('#nombreCuidador').val("${nombreCuidador}");
            $('#fechaNacimiento').val("${fechaNacimiento}");
            $('#ocupacion').val("${ocupacion}");
            $('#telefonico1').val("${telefonico1}");
            $('#telefonico2').val("${telefonico2}");
            $('#correo').val("${correo}");
            
            switch("${vive}"){
                case "true":
                    $('#viveSi').prop('checked', true);
                    $('#viveSiLabel').addClass('active');
                    break;
                case "false":
                    $('#viveNo').prop('checked', true);
                    $('#viveNoLabel').addClass('active');
                    break;
            }
            
            $('select option[value="${mes}"]').attr("selected",true);
            $('#anio').val("${anio}");
            
            switch("${parentesco}"){
                case "hijo":
                    $('#hijo').prop('checked', true);
                    $('#hijoLabel').addClass('active');
                    break;
                case "cónyuge":
                    $('#conyuge').prop('checked', true);
                    $('#conyugeLabel').addClass('active');
                    break;
                case "amigo":
                    $('#amigo').prop('checked', true);
                    $('#amigoLabel').addClass('active');
                    break;
                case "nieto":
                    $('#nieto').prop('checked', true);
                    $('#nietoLabel').addClass('active');
                    break;
                case "hermano":
                    $('#hermano').prop('checked', true);
                    $('#hermanoLabel').addClass('active');
                    break;
                case "nuera":
                    $('#nuera').prop('checked', true);
                    $('#nueraLabel').addClass('active');
                    break;
                case "yerno":
                    $('#yerno').prop('checked', true);
                    $('#yernoLabel').addClass('active');
                    break;
                case "sobrino":
                    $('#sobrino').prop('checked', true);
                    $('#sobrinoLabel').addClass('active');
                    break;
            }
    
            switch("${estadoC}"){
                case "soltero/a":
                    $('#soltero').prop('checked', true);
                    $('#solteroLabel').addClass('active');
                    break;
                case "casado/a":
                    $('#casado').prop('checked', true);
                    $('#casadoLabel').addClass('active');
                    break;
                case "divorciado/a":
                    $('#divorciado').prop('checked', true);
                    $('#divorciadoLabel').addClass('active');
                    break;
                case "viudo/a":
                    $('#viudo').prop('checked', true);
                    $('#viudoLabel').addClass('active');
                    break;
                case "union libre":
                    $('#unionLibre').prop('checked', true);
                    $('#unionLibreLabel').addClass('active');
                    break;
            }
            switch("${escolaridad}"){
                case "ninguna":
                    $('#ninguna').prop('checked', true);
                    $('#ningunaLabel').addClass('active');
                    break;
                case "primaria":
                    $('#primaria').prop('checked', true);
                    $('#primariaLabel').addClass('active');
                    break;
                case "secundaria":
                    $('#secundaria').prop('checked', true);
                    $('#secundariaLabel').addClass('active');
                    break;
                case "bachillerato":
                    $('#bachillerato').prop('checked', true);
                    $('#bachilleratoLabel').addClass('active');
                    break;
                case "normal":
                    $('#normal').prop('checked', true);
                    $('#normalLabel').addClass('active');
                    break;
                case "carrera":
                    $('#carrera').prop('checked', true);
                    $('#carreraLabel').addClass('active');
                    break;
                case "licenciatura":
                    $('#licenciatura').prop('checked', true);
                    $('#licenciaturaLabel').addClass('active');
                    break;
                case "maestria":
                    $('#maestria').prop('checked', true);
                    $('#maestriaLabel').addClass('active');
                    break;
                case "doctorado":
                    $('#doctorado').prop('checked', true);
                    $('#doctoradoaLabel').addClass('active');
                    break;
            }
            
            
            if("${compania}" == "true"){
                $('#compania').prop('checked', true);
                $('#companiaLabel').addClass('active');
            }
            if("${apoyoABVD}" == "true"){
                $('#apoyoABVD').prop('checked', true);
                $('#apoyoABVDLabel').addClass('active');
            }
            if("${apoyoAIVD}" == "true"){
                $('#apoyoAIVD').prop('checked', true);
                $('#apoyoAIVDLabel').addClass('active');
            }
            
            if("${salud}" == "true"){
                $('#salud').prop('checked', true);
                $('#saludLabel').addClass('active');
            }
            if("${financieros}" == "true"){
                $('#financieros').prop('checked', true);
                $('#financierosLabel').addClass('active');
            }
            if("${psicologicos}" == "true"){
                $('#psicologos').prop('checked', true);
                $('#psicologosLabel').addClass('active');
            }
            if("${familiares}" == "true"){
                $('#familiares').prop('checked', true);
                $('#familiaresLabel').addClass('active');
            }
            
            
            switch("${zarit}"){
                case "sin sobrecarga":
                    $('#sinSobrecarga').prop('checked', true);
                    $('#sinSobrecargaLabel').addClass('active');
                    break;
                case "sobrecarga leve":
                    $('#sobrecargaLeve').prop('checked', true);
                    $('#sobrecargaLeveLabel').addClass('active');
                    break;
                case "sobrecarga intensa":
                    $('#sobrecargaIntensa').prop('checked', true);
                    $('#sobrecargaIntensaLabel').addClass('active');
                    break;
                case "no se presentó":
                    $('#noSePresento').prop('checked', true);
                    $('#noSePresentoLabel').addClass('active');
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
                        
                        <img src="img/017-network.png" alt="device" class="img-header">
                        
                        <h3 class="text-muted">Datos del cuidador primario</h3>
                        <hr>

                        <form class="well form-horizontal" action="cuidador" method="post"  id="contact_form">
                            <fieldset>
                                
                                
                                <div class="form-value-one">
                                    <!-- Row -->
                                    <div class="row row-fix">

                                        <!-- Col-6 -->
                                        <div class="col-md-6 mycontent-left" >


                                            <!-- Text input-->
                                            <div class="form-group group-left">
                                                <label class="control-label">Nombre del cuidador</label>
                                                <div class="inputGroupContainer">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                        <input  name="nombre" placeholder="Nombre completo" class="form-control"  type="text" id = "nombreCuidador">
                                                    </div>
                                                </div>
                                            </div>


                                            <!-- Calendario -->
                                            <div class="form-group group-left">
                                                <label class="control-label">Fecha de Nacimiento</label>
                                                <div class="inputGroupContainer">
                                                    <div class='input-group'>
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                        <input placeholder="dd/mm/aaaa" class="datepicker form-control" name="nacimiento" type="text" min="1900-01-01" id = "fechaNacimiento">

                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Text input-->
                                            <div class="form-group group-left">
                                                <label class="control-label">Ocupación</label>
                                                <div class="inputGroupContainer">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                        <input name="ocupacion" placeholder="Ama de casa, maestro, estudiante, etc." class="form-control" type="text" id = "ocupacion">
                                                    </div>
                                                </div>
                                            </div>



                                        </div>

                                        <!-- Col-6 -->
                                        <div class="col-md-6">



                                            <!-- Text input-->
                                            <div class="form-group group-right">
                                                <label class="control-label"># Telefónico 1</label>
                                                <div class="inputGroupContainer">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                        <input  name="telefonoUno" placeholder="(845)555-1212" class="form-control"  type="tel" id = "telefonico1">
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Text input-->
                                            <div class="form-group group-right">
                                                <label class="control-label"># Telefónico 2</label>
                                                <div class="inputGroupContainer">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                        <input name="telefonoDos" placeholder="(845)555-1212" class="form-control" type="tel" id = "telefonico2">
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Text input-->
                                            <div class="form-group group-right">
                                                <label class="control-label">Correo Electrónico</label>
                                                <div class="inputGroupContainer">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                                         <input name="correo" placeholder="usuario@correoelectronico.com" class="form-control" type="email" id = "correo">
                                                    </div>
                                                </div>
                                            </div>


                                        </div>

                                    </div><!-- row -->
                                </div>
                                
                                
                                <!-- Radio button estado civil -->
                                <div class="form-value-one">
                                    <p class="label-form">Vive con el paciente</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "viveSiLabel">
                                            <input type="radio" name="viveConElPaciente" value="si" autocomplete="off" id="viveSi">Sí
                                        </label>

                                        <label class="btn btn-default" id = "viveNoLabel">
                                            <input type="radio" name="viveConElPaciente" value="no" autocomplete="off" id="viveNo">No
                                        </label>

                                    </div>
                                </div>
                                
                                <!--Tiempo cuidando-->
                                <div class="form-value-one" >
                                    <p class="label-form" >Tiempo cuidando al paciente</p>
                                    <div>
                                        <select name="cuidadoMeses" id="mes"class="form-control selectpicker" style="width:160px; display:inline">
                                            <option value=" " disabled selected hidden>Selecciona un mes</option>
                                            <option value="1">Enero</option>
                                            <option value="2">Febrero</option>
                                            <option value="3">Marzo</option>
                                            <option value="4">Abril</option>
                                            <option value="5">Mayo</option>
                                            <option value="6">Junio</option>
                                            <option value="7">Julio</option>
                                            <option value="8">Agosto</option>
                                            <option value="9">Septiembre</option>
                                            <option value="10">Octubre</option>
                                            <option value="11">Noviembre</option>
                                            <option value="12">Diciembre</option>
                                        </select> /
                                        <input style="width:70px; display:inline" name="cuidadoAnios" class="form-control" type="number" min="0" placeholder="año" id = "anio">
                                    </div>
                                </div>
                                <!-- Radio button parentesco -->
                                <div class="form-value-one">
                                    <p class="label-form">Parentesco</p>
                                    <div class="btn-group" id="parentesco-options" data-toggle="buttons">
                                        <label class="btn btn-default" id = "hijoLabel">
                                            <input type="radio" name="parentesco" value="hijo" autocomplete="off" id = "hijo">Hijo
                                        </label>

                                        <label class="btn btn-default" id = "conyugeLabel">
                                            <input type="radio" name="parentesco" value="cónyuge" autocomplete="off" id = "conyuge">Cónyuge
                                        </label>

                                        <label class="btn btn-default" id = "amigoLabel">
                                            <input type="radio" name="parentesco" value="amigo" autocomplete="off" id = "amigo">Amigo
                                        </label>

                                        <label class="btn btn-default" id="nietoLabel">
                                            <input type="radio" name="parentesco" value="nieto" autocomplete="off" id = "nieto">Nieto
                                        </label>

                                        <label class="btn btn-default" id = "hermanoLabel">
                                            <input type="radio" name="parentesco" value="hermano" autocomplete="off" id = "hermano">Hermano
                                        </label>

                                        <label class="btn btn-default" id  = "nueraLabel">
                                            <input type="radio" name="parentesco" value="nuera" autocomplete="off" id  = "nuera">Nuera
                                        </label>
                                        
                                        <label class="btn btn-default" id  = "yernoLabel">
                                            <input type="radio" name="parentesco" value="yerno" autocomplete="off" id  = "yerno">Yerno
                                        </label>

                                        <label class="btn btn-default" id  = "sobrinoLabel">
                                            <input type="radio" name="parentesco" value="sobrino" autocomplete="off" id  = "sobrino">Sobrino
                                        </label>

                                        <button id="btn-parentesco" onClick="agregarCampoParentesco()" class="btn btn-default">Otro
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
                                
                                <!-- Checkbox Parentesco -->
                                
                                <div id="parentesco_agregado">
                                   <c:forEach items="${parentescos}" var="parentesco">
                                        <div class="form-value-one">
                                            <button id="${parentesco}" class="btn btn-danger btn-sm btn-space" onclick="eliminarParentesco(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="parentesco" value="${parentesco}" checked>${parentesco}
                                        </div>
                                    </c:forEach> 
                                </div>
                                
                                
                                <!-- Radio button estado civil -->
                                <div class="form-value-one">
                                    <p class="label-form">Estado civil</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id  = "solteroLabel">
                                            <input type="radio" name="estadoCivil" value="soltero/a" autocomplete="off" id  = "soltero">Soltero/a
                                        </label>

                                        <label class="btn btn-default" id  = "casadoLabel">
                                            <input type="radio" name="estadoCivil" value="casado/a" autocomplete="off" id  = "casado">Casado/a
                                        </label>

                                        <label class="btn btn-default" id  = "divorciadoLabel">
                                            <input type="radio" name="estadoCivil" value="divorciado/a" autocomplete="off" id  = "divorciado">Divorciado/a
                                        </label>

                                        <label class="btn btn-default" id  = "viudoLabel">
                                            <input type="radio" name="estadoCivil" value="viudo/a" autocomplete="off" id  = "viudo">Viudo/a
                                        </label>

                                        <label class="btn btn-default" id  = "unionLibreLabel">
                                            <input type="radio" name="estadoCivil" value="union libre" autocomplete="off" id  = "unionLibre">Unión libre
                                        </label>

                                    </div>
                                </div>
                                
                                
                                <!-- Radio button escolaridad -->
                                <div class="form-value-one">
                                    <p class="label-form">Escolaridad</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "ningunaLabel">
                                            <input type="radio" name="escolaridad" value="ninguna" autocomplete="off" id = "ninguna">Ninguna
                                        </label>

                                        <label class="btn btn-default" id = "primariaLabel">
                                            <input type="radio" name="escolaridad" value="primaria" autocomplete="off" id = "primaria">Primaria
                                        </label>

                                        <label class="btn btn-default" id = "secundariaLabel">
                                            <input type="radio" name="escolaridad" value="secundaria" autocomplete="off" id = "secundaria">Secundaria
                                        </label>

                                        <label class="btn btn-default" id = "bachilleratoLabel">
                                            <input type="radio" name="escolaridad" value="bachillerato" autocomplete="off" id = "bachillerato">Bachillerato
                                        </label>
                                        
                                        <label class="btn btn-default" id = "normalLabel">
                                            <input type="radio" name="escolaridad" value="normal" autocomplete="off" id = "normal">Normal
                                        </label>

                                        <label class="btn btn-default" id = "carreraLabel">
                                            <input type="radio" name="escolaridad" value="carrera técnica" autocomplete="off" id = "carrera">Carrera técnica
                                        </label>

                                        <label class="btn btn-default" id = "licenciaturaLabel">
                                            <input type="radio" name="escolaridad" value="licenciatura" autocomplete="off" id = "licenciatura">Licenciatura
                                        </label>
                                        
                                        <label class="btn btn-default" id = "maestriaLabel">
                                            <input type="radio" name="escolaridad" value="maestría" autocomplete="off" id = "maestria">Maestría
                                        </label>
                                        
                                        <label class="btn btn-default" id = "doctoradoLabel">
                                            <input type="radio" name="escolaridad" value="maestría" autocomplete="off" id = "doctorado">Doctorado
                                        </label>

                                    </div>
                                </div>
                                
                                
                                
                                <!-- Checkbox funciones -->
                                <div class="form-value-one">
                                    <p class="label-form">Funciones</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        
                                        <label class="btn btn-default" id = "companiaLabel">
                                            <input type="checkbox" name="funciones" value="compañía" autocomplete="off" id = "compania">Compañía
                                        </label>

                                        <label class="btn btn-default" id = "apoyoABVDLabel">
                                            <input type="checkbox" name="funciones" value="apoyo a las ABVD" autocomplete="off" id = "apoyoABVD">Apoyo a las ABVD
                                        </label>

                                        <label class="btn btn-default" id = "apoyoAIVDLabel">
                                            <input type="checkbox" name="funciones" value="apoyo a las AIVD" autocomplete="off" id = "apoyoAIVD">Apoyo a las AIVD
                                        </label>

                                        <button onClick="agregarCampoFunciones()" class="btn btn-default">Otro
                                        </button>

                                    </div>
                                </div>
                                
                                <!-- Text input-->
                                <div id="div_funciones" class="form-value-one collapse">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarFuncion()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="funcion" class="form-control input-short-form" onkeypress="handleFunciones(event)" placeholder="Apoyo a las AAVD">
                                        
                                    </div>
                                </div>
                                
                                <!-- Checkbox Compradores -->
                                
                                <div id="funciones_agregadas">
                                    <c:forEach items="${funciones}" var="funcion">
                                        <div class="form-value-one">
                                            <button id="${funcion}" class="btn btn-danger btn-sm btn-space" onclick="eliminarFuncion(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="funciones" value="${funcion}" checked>${funcion}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                
                                
                                <!-- Checkbox problemas -->
                                <div class="form-value-one">
                                    <p class="label-form">El cuidador presenta problemas de...</p>
                                    <div class="btn-group" data-toggle="buttons">

                                        <label class="btn btn-default" id = "saludLabel">
                                            <input type="checkbox" name="problemas" value="salud" autocomplete="off" id = "salud">Salud
                                        </label>

                                        <label class="btn btn-default" id = "financierosLabel">
                                            <input type="checkbox" name="problemas" value="financieros" autocomplete="off" id = "financieros">Financieros
                                        </label>
                                        
                                        <label class="btn btn-default" id = "psicologosLabel">
                                            <input type="checkbox" name="problemas" value="psicológicos" autocomplete="off" id = "psicologos">Psicológicos
                                        </label>

                                        <label class="btn btn-default" id = "familiaresLabel">
                                            <input type="checkbox" name="problemas" value="familiares" autocomplete="off" id = "familiares">Familiares
                                        </label>

                                        <button onClick="agregarCampoProblemas()" class="btn btn-default">Otro
                                        </button>

                                    </div>
                                </div>
                                
                                <!-- Text input-->
                                <div id="div_problemas" class="form-value-one collapse">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button onClick="agregarProblema()" class="btn btn-primary-4" type="button"><span class="glyphicon glyphicon-plus"></span></button>
                                        </span>
                                        <input type="text" value="" id="problema" class="form-control input-short-form" onkeypress="handleProblemas(event)" placeholder="Sociales, laborales, etc.">
                                        
                                    </div>
                                </div>
                                
                                <!-- Checkbox Compradores -->
                                
                                <div id="problemas_agregados">
                                    <c:forEach items="${problemas}" var="problema">
                                        <div class="form-value-one">
                                            <button id="${problema}" class="btn btn-danger btn-sm btn-space" onclick="eliminarproblema(this.id)">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input class="checkbox-agregados" type="checkbox" name="problemas" value="${problemas}" checked>${problema}
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                
                                
                                <!-- Radio button escala de zarit and zarit -->
                                <div class="form-value-one">
                                    <p class="label-form">Escala de Zarit and Zarit</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id = "sinSobrecargaLabel">
                                            <input type="radio" name="zarit" value="sin sobrecarga" autocomplete="off" id = "sinSobrecarga">Sin sobrecarga
                                        </label>

                                        <label class="btn btn-default" id = "sobrecargaLeveLabel">
                                            <input type="radio" name="zarit" value="sobrecarga leve" autocomplete="off" id = "sobrecargaLeve">Sobrecarga leve
                                        </label>

                                        <label class="btn btn-default" id = "sobrecargaIntensaLabel">
                                            <input type="radio" name="zarit" value="sobrecarga intensa" autocomplete="off" id = "sobrecargaIntensa">Sobrecarga intensa
                                        </label>

                                        <label class="btn btn-default" id = "noSePresentoLabel">
                                            <input type="radio" name="zarit" value="no se presentó" autocomplete="off" id = "noSePresento">No se presentó
                                        </label>

                                    </div>
                                </div>
                                
                                <div class="form-value-one">
                                    <p class="label-form">Observaciones</p>
                                </div>
                                <!-- Text area -->
                                <div id="div_caidas" class="form-value-one">
                                    <textarea class="form-control" rows="5" name="observacion" placeholder="Escriba las observaciones del paciente" id = "observacion"></textarea>
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
        

        
        function agregarParentesco(){
            
            var parentesco = document.getElementById("parentesco").value;
            if(parentesco!=""){
                document.getElementById("parentesco").value = ""; //borra input del contenido
            
                var parentesco_agregado = document.getElementById("parentesco_agregado");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(parentesco);
                var button = document.createElement("button");
                button.id = "id-parentesco";
                button.className = "btn btn-danger btn-md btn-space";
                button.setAttribute("onClick","eliminarParentesco(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "radio";
                input.name = "parentesco";
                input.value = parentesco;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                parentesco_agregado.appendChild(div);
                $("#div_parentesco").addClass("hide");
                $("#div_parentesco").collapse('hide');
                $("#btn-parentesco").css({"color": "#fff","background-color": "#1ac","border-color": "#19b"});
            }
        
        }
        
        function eliminarParentesco(){
            
            var parentesco_agregado = document.getElementById("parentesco_agregado");
            var btn = document.getElementById("id-parentesco");
            parentesco_agregado.removeChild(btn.parentElement);
            $("#btn-parentesco").css({"color": "","background-color": "","border-color": ""});
            var activeRemove = document.querySelector('#btn-parentesco.active');
            activeRemove.classList.remove('active');
        }
        
        function handleParentesco(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarParentesco();
            }
        }
        
        function agregarCampoParentesco(){
            var id_parentesco = document.getElementById("id-parentesco");
            if(id_parentesco == null){
                $("#parentesco-options > label").removeClass("active");
                $("#div_parentesco").removeClass("hide");
                $("#div_parentesco").collapse('toggle');
            }
        }
        
        $("#parentesco-options > label").click(function(){
            var id_parentesco = document.getElementById("id-parentesco");
            if(id_parentesco != null){
                eliminarParentesco();
            }
            $("#div_parentesco").collapse("hide");
        });
        
        
        
        
                
        function agregarFuncion(){
            
            var funcion = document.getElementById("funcion").value;
            if(funcion!=""){
                document.getElementById("funcion").value = ""; //borra input del contenido
            
                var funciones_agregadas = document.getElementById("funciones_agregadas");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(funcion);
                var button = document.createElement("button");
                button.id = funcion;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarFuncion(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "funciones";
                input.value = funcion;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                funciones_agregadas.appendChild(div);
                
            }
        
        }
        
        function eliminarFuncion(id){
            
            var funciones_agregadas = document.getElementById("funciones_agregadas");
            var btn = document.getElementById(id);
            funciones_agregadas.removeChild(btn.parentElement);
        
        }
        
        function handleFunciones(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarFuncion();
            }
        }
        
        function agregarCampoFunciones(){
            $("#div_funciones").collapse('toggle');
        }
        
        
        
        function agregarProblema(){
            
            var problema = document.getElementById("problema").value;
            if(problema!=""){
                document.getElementById("problema").value = ""; //borra input del contenido
            
                var problemas_agregados = document.getElementById("problemas_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(problema);
                var button = document.createElement("button");
                button.id = problema;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick","eliminarProblema(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "problemas";
                input.value = problema;
                input.checked = true;

                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                problemas_agregados.appendChild(div);
                
            }
        
        }
        
        function eliminarProblema(id){
            
            var problemas_agregados = document.getElementById("problemas_agregados");
            var btn = document.getElementById(id);
            problemas_agregados.removeChild(btn.parentElement);
        
        }
        
        function handleProblemas(e){
            if(e.keyCode === 13){
                e.preventDefault();
                agregarProblema();
            }
        }
        
        function agregarCampoProblemas(){
            $("#div_problemas").collapse('toggle');
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
