<%-- 
    Document   : Pacientes
    Created on : 13-may-2017, 20:00:21
    Author     : Oscar-PC
--%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null; %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %> 
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Pacientes</title>

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
        
        <!-- Select2 para estado y municipios -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/i18n/es.js"></script>

        <!-- Inicialización de dropdown de Municipios -->    
        <script>
            $(document).ready(function () {
                $(".municipios").prop("disabled", true);
            });
        </script>         


        <!-- calendario -->
        <script>
            $(document).ready(function () {
                $.fn.datepicker.defaults.language = 'es';
            });
            $(function () {
                $('.datepicker').datepicker({
                    startView: 3,
                    format: "dd/mm/yyyy",
                    startDate: '-130y',
                    endDate: '-1d',
                    autoclose: true,
                    orientation: "bottom auto",
                    defaultViewDate: {year: 1910, month: 01, day: 01}
                });
            });
        </script>


        <script>
            $(document).ready(function () {

                try {
                    var tipoParam = '${currentUserType}';
                    $("#tipo").val(tipoParam);
                } catch (err) {
                    alert(err.message);
                }

                var IdPacienteParam = '${id_paciente}';
                var camaParam = '${no_cama}';
                var postalParam = '${codigo_postal}';
                var telCasaParam = '${telefono_casa}';
                var telCelParam = '${telefono_cel}';
                var fechaEvalParam = '${fechaEval}';
                var fechaIngresoParam = '${fechaIngreso}';
                var consultaParam = '${consulta_externa}';
                var nombreParam = '${nombre_paciente}';
                var apellidoPParam = '${apellido_paterno}';
                var apellidoMParam = '${apellido_materno}';
                var nacimientoParam = '${nacimiento}';
                var estadoParam = '${estado}';
                var municipioParam = '${municipio}';
                var coloniaParam = '${colonia}';
                var calleParam = '${calle}';
                var estadoCivParam = '${estado_civil}';
                var generoParam = '${genero}';
                var sexoParam = '${sexo}';
                var religionParam = '${religion}';
                var entrevistaParam = '${entrevista}';

                $('#id_paciente').val(IdPacienteParam);
                $('#no_cama').val(camaParam);
                $('#codigo_postal').val(postalParam);
                $('#telefono_casa').val(telCasaParam);
                $('#telefono_cel').val(telCelParam);
                $('#fechaEval').val(fechaEvalParam);
                $('#fechaIngreso').val(fechaIngresoParam);
                $('#consulta_externa').val(consultaParam);
                $('#nombre_paciente').val(nombreParam);
                $('#apellido_paterno').val(apellidoPParam);
                $('#apellido_materno').val(apellidoMParam);
                $('#nacimiento').val(nacimientoParam);
                $('#estado').val(estadoParam);
                $('#municipio').val(municipioParam);
                $('#colonia').val(coloniaParam);
                $('#calle').val(calleParam);
                $('#entrevista').val(entrevistaParam);

                

                switch ("${genero}") {
                    case "Hombre":
                        $('#genero').prop('checked', true);
                        $('#HombreLabel').addClass('active');
                        break;
                    case "Mujer":
                        $('#genero').prop('checked', true);
                        $('#MujerLabel').addClass('active');
                        break;
                    case "Otro":
                        $('#genero').prop('checked', true);
                        $('#OtroLabel').addClass('active');
                        break;
                }

                switch ("${sexo}") {
                    case "Masculino":
                        $('#sexo').prop('checked', true);
                        $('#MasculinoLabel').addClass('active');
                        break;
                    case "Femenino":
                        $('#sexo').prop('checked', true);
                        $('#FemeninoLabel').addClass('active');
                        break;
                }


                switch ("${religion}") {
                    case "Catolico":
                        $('#religion').prop('checked', true);
                        $('#CatolicoLabel').addClass('active');
                        break;
                    case "Cristiano":
                        $('#religion').prop('checked', true);
                        $('#CristianoLabel').addClass('active');
                        break;
                    case "TestigoJehova":
                        $('#religion').prop('checked', true);
                        $('#TestigoLabel').addClass('active');
                        break;
                    case "Mormon":
                        $('#religion').prop('checked', true);
                        $('#MormonLabel').addClass('active');
                        break;
                    case "Judio":
                        $('#religion').prop('checked', true);
                        $('#JudioLabel').addClass('active');
                        break;
                    case "Musulman":
                        $('#religion').prop('checked', true);
                        $('#MusulmanLabel').addClass('active');
                        break;
                    case "Sin Religion":
                        $('#religion').prop('checked', true);
                        $('#SinReligionLabel').addClass('active');
                        break;
                    case "Otro":
                        $('#religion').prop('checked', true);
                        $('#ReligionOtroLabel').addClass('active');
                        break;  
                }

                switch ("${estado_civil}") {
                    case "Soltero":
                        $('#estado_civil').prop('checked', true);
                        $('#SolteroLabel').addClass('active');
                        break;
                    case "Divorciado":
                        $('#estado_civil').prop('checked', true);
                        $('#DivorciadoLabel').addClass('active');
                        break;
                    case "Casado":
                        $('#estado_civil').prop('checked', true);
                        $('#CasadoLabel').addClass('active');
                        break;
                    case "Viudo":
                        $('#estado_civil').prop('checked', true);
                        $('#ViudoLabel').addClass('active');
                        break;
                }

            });

            function menuAdministrador() {
                postForm("menuAdministrador");
            }
            function menuTrabajador() {

                postForm("menuTrabajador");
            }

            function menuPaciente() {
                postForm("menuPaciente");
            }

            function postForm(tipo) {

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

                            <img src="img/medico-4.png" alt="device" class="img-header">
                            <h3 class="text-muted">Registro de pacientes</h3>
                            <hr>

                            <form name="regPaciente" action="reg_paciente" method='get'  id="form" onsubmit="return validarInformacion()">

                                <!-- Text input-->
                                <div class="form-group"style='width: 300px'>
                                    <label class="control-label">Buscar a un Paciente</label>
                                    <div class="inputGroupContainer">
                                        <div class="input-group group-left">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                                            <input  name="buscar" placeholder="Buscar por número de registro" class="form-control" value="${id_paciente}" type="text" id = "buscar">
                                        </div>
                                        <div class="input-group group-right">
                                            <button type="submit" style="margin-top: 10px" class="btn btn-save" >Buscar <span class="glyphicon glyphicon-search"></span></button>  
                                        </div>
                                    </div>
                                </div> 

                            </form>

                          
                            <form method="post" action="usuario-paciente" onsubmit="return validarInformacion()">
                                <button type="submit"  class="btn btn-save" name="id_paciente" value="${id_paciente}" class="btn-link">Ver Histórico  <span class="glyphicon glyphicon-list-alt"></span></button>
                            </form>
                            
                            <div class="input-group group-right">
                                  <a href="/socialis/familiograma/index.html" class="btn btn-info" role="button">Link Button</a>
                            </div>
                        



                            <form class="well form-horizontal" action="reg_paciente" method='post'  id="form">
                                
                                 <input type="hidden" name="id"   value=value="${id}">
                                <input type="hidden" name="metodo"   value="guardar">
                                
                                 <div class ="form-value-one">
                                    <p class="lable-form">Numero de Registro</p>
                                    <input type="text" name='id_paciente' id="id_paciente" value='${id_paciente}' class="form-control input-short-form" onkeypress="handleActividad(event)">
                                </div>

                                
                                <div class="form-value-one">
                                        <label class="control-label">Fecha de Evaluacion</label>
                                        <div class="inputGroupContainer">
                                            <div class='input-group'>
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                <input placeholder="dd/mm/aaaa" value='${fechaEval}' class="datepicker form-control" name="fechaEval" type="text" min="1900-01-01">

                                            </div>
                                        </div>
                                </div>
                                                
                                  <div class ="form-value-one">
                                    <p class="lable-form">Numero de Cama</p>
                                    <input type="text" name="no_cama" value='${no_cama}' id="no_cama" class="form-control input-short-form" onkeypress="handleActividad(event)">
                                </div>

                                <div class="form-value-one" >
                                    <label class="control-label">Fecha de Ingreso</label>
                                    <div class="inputGroupContainer">
                                        <div class='input-group'>
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                            <input placeholder="dd/mm/aaaa" value='${fechaIngreso}' class="datepicker form-control" name="fechaIngreso" type="text" min="1900-01-01">

                                        </div>
                                    </div>
                                </div>

                                <div class ="form-value-one">
                                    <p class="lable-form">Consulta Externa</p>
                                    <input type="text" name='consulta_externa' value='${consulta_externa}' id="consulta_externa" class="form-control input-short-form" onkeypress="handleActividad(event)">
                                </div>

                                <div class ="form-value-one">
                                    <p class="lable-form">Nombre Paciente</p>
                                    <input type="text" name='nombre_paciente' value="${nombre_paciente}" id="nombre_paciente" class="form-control input-short-form" onkeypress="handleActividad(event)">
                                </div>

                                 <div class ="form-value-one">
                                    <p class="lable-form">Apellido Paterno</p>
                                    <input type="text" name='apellido_paterno'value='${apellido_paterno}' id="apellido_paterno" class="form-control input-short-form" onkeypress="handleActividad(event)">
                                 </div>

                                <div class ="form-value-one">
                                    <p class="lable-form">Apellido Materno</p>
                                    <input type="text" name='apellido_materno'value='${apellido_materno}' id="apellido_materno" class="form-control input-short-form" onkeypress="handleActividad(event)">
                                </div>

                                <div class="form-value-one" >
                                    <label class="control-label">Fecha de Nacimiento</label>
                                    <div class="inputGroupContainer">
                                        <div class='input-group'>
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                            <input placeholder="dd/mm/aaaa" value='${nacimiento}' class="datepicker form-control" name="nacimiento" type="text" min="1900-01-01">

                                        </div>
                                    </div>
                                </div>
                                            
                                <div class="form-value-one">
                                        <p class="label-form">Genero</p>
                                        <div class="btn-group" data-toggle="buttons">
                                            <label class="btn btn-default" id='HombreLabel'>
                                                <input type="radio" name="genero" value='Hombre' autocomplete="off">Hombre
                                            </label>
                                            <label class="btn btn-default" id='MujerLabel'>
                                                <input type="radio" name="genero" value='Mujer' autocomplete="off">Mujer
                                            </label>

                                        </div>
                                </div>

                                <div class="form-value-one">
                                    <p class="label-form">Sexo</p>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-default" id='MasculinoLabel'>
                                            <input type="radio" name="sexo" value='Masculino' autocomplete="off">Masculino
                                        </label>
                                        <label class="btn btn-default" id='FemeninoLabel'>
                                            <input type="radio" name="sexo" value='Femenino' autocomplete="off">Femenino
                                        </label>
                                    </div>
                                </div>  
                                                                            
                                
                                 <div class="form-value-one">
                                     <p class="label-form">Estado</p>
                                <select class="js-data-example-ajax" id="estadoTester" name="estado">
                                     <option value="3620194" selected="selected">Seleccione una opcion</option>
                                </select>    
                                 </div>
                                            
                                 <div class="form-value-one">
                                     <p class="label-form">Municipios</p>
                                <select class="municipios" name="municipio">
                                     <option value="3620194" selected="selected">Seleccione una opcion</option>
                                </select>    
                                 </div>  

                                        <div class ="form-value-one">
                                            <p class="lable-form">Colonia</p>
                                            <input type="text" name='colonia' value='${colonia}' id="colonia" class="form-control input-short-form" onkeypress="handleActividad(event)">
                                        </div>

                                        <div class ="form-value-one">
                                            <p class="lable-form">Codigo Postal</p>
                                            <input type="text" name='codigo_postal' value='${codigo_postal}' id="codigo_postal" class="form-control input-short-form" onkeypress="handleActividad(event)">
                                        </div>    

                                        <div class ="form-value-one">
                                            <p class="lable-form">Calle</p>
                                            <input type="text" name='calle' id="calle" value='${calle}' class="form-control input-short-form" onkeypress="handleActividad(event)">
                                        </div> 

                                        <div class ="form-value-one">
                                            <p class="lable-form">Telefono Casa</p>
                                            <input type="text" name='telefono_casa' value='${telefono_casa}' id="telefono_casa" class="form-control input-short-form" onkeypress="handleActividad(event)">
                                        </div> 

                                        <div class ="form-value-one">
                                            <p class="lable-form">Telefono Celular</p>
                                            <input type="text" name='telefono_cel' value='${telefono_cel}' id="telefono_cel" class="form-control input-short-form" onkeypress="handleActividad(event)">
                                        </div>

                                        <div class ="form-value-one">
                                            <p class="lable-form">Entrevista a:</p>
                                            <input type="text" name='entrevista' value='${entrevista}' id="entrevista" class="form-control input-short-form" onkeypress="handleActividad(event)">
                                        </div>
                                           
                                        
                                        
                                         <div class="form-value-one">
                                            <p class="label-form">Religión</p>
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default" id='CatolicoLabel'>
                                                    <input type="radio" name="religion" value='Catolico' autocomplete="off">Católico
                                                </label>
                                                <label class="btn btn-default" id='CristianoLabel'>
                                                    <input type="radio" name="religion" value='Cristiano' autocomplete="off">Cristiano
                                                </label>
                                                <label class="btn btn-default" id='TestigoLabel'>
                                                    <input type="radio" name="religion" value='TestigoJehova' autocomplete="off">Testigo de Jehová
                                                </label>
                                                <label class="btn btn-default" id='MormonLabel'>
                                                    <input type="radio" name="religion" value='Mormon' autocomplete="off">Mormón
                                                </label>
                                                <label class="btn btn-default" id='JudioLabel'>
                                                    <input type="radio" name="religion" value='Judio' autocomplete="off">Judío
                                                </label>
                                                
                                                <label class="btn btn-default" id='MusulmanLabel'>
                                                    <input type="radio" name="religion" value='Musulman' autocomplete="off">Musulmán
                                                </label>
                                                
                                                <label class="btn btn-default" id='SinReligionLabel'>
                                                    <input type="radio" name="religion" value='Sin Religion' autocomplete="off">Sin Religión
                                                </label>
                                                
                                                <label class="btn btn-default" id='ReligionOtroLabel'>
                                                    <input type="radio" name="religion" value='Otro' autocomplete="off">Otro
                                                </label>
                                    

                                            </div>
                                        </div>
                                        
                                        <div class="form-value-one">
                                            <p class="label-form">Estado Civil</p>
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default" id='SolteroLabel'>
                                                    <input type="radio" name="estado_civil" value='Soltero' autocomplete="off">Soltero
                                                </label>
                                                <label class="btn btn-default" id='CasadoLabel'>
                                                    <input type="radio" name="estado_civil" value='Casado' autocomplete="off">Casado
                                                </label>
                                                <label class="btn btn-default" id='DivorciadoLabel'>
                                                    <input type="radio" name="estado_civil" value='Divorciado' autocomplete="off">Divorciado
                                                </label>
                                                <label class="btn btn-default" id='ViudoLabel'>
                                                    <input type="radio" name="estado_civil" value='Viudo' autocomplete="off">Viudo
                                                </label>
                                                
                                                <label class="btn btn-default" id='UnionLabel'>
                                                    <input type="radio" name="estado_civil" value='Union Libre' autocomplete="off">Unión Libre
                                                </label>
                                                
                                                 <label class="btn btn-default" id='EstadoOtroLabel'>
                                                    <input type="radio" name="estado_civil" value='Otro' autocomplete="off">Otro
                                                </label>
                                            </div>
                                        </div>
                                        
                                       <div class="form-value-one">
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

                                        

       


    </body>
    
   <script>
                  
            var strUser;            
                                                                                                                                                                                                                            
            $(".js-data-example-ajax").select2({
                width: 'auto',
                language: 'es',
                
            ajax: {
              url: "/socialis/estadoController",
              dataType: 'json',
              type: "GET",
              delay: 250,
              data: function (params) {
                return {
                  q: params.term, // search term
                  page: params.page
                };
              },
              processResults: function (data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;

                return {
                  results: data,
                  pagination: {
                    more: (params.page * 30) < data.total_count
                  }
                };
              },
              cache: true
            },
            escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
            minimumInputLength: 1

          });
          
        var $estadoEvent = $(".js-data-example-ajax");
          
          $estadoEvent.on("select2:select", function() {estadoChange();});
          
          function estadoChange () {
            e = document.getElementById("estadoTester");
            strUser = e.options[e.selectedIndex].value;                    
            $(".municipios").prop("disabled", false);
          }

            $(".municipios").select2({
                width: 'auto',
                language: 'es',
            ajax: {
              url: "/socialis/estadoMunicipio",
              dataType: 'json',
              type: "GET",
              delay: 250,
              data: function (params) {
                return {
                  strUser,  
                  qt: params.term, // search term
                  page: params.page
                };
              },
              processResults: function (data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;

                return {
                  results: data,
                  pagination: {
                    more: (params.page * 30) < data.total_count
                  }
                };
              },
              cache: true
            },
            escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
            minimumInputLength: 1

          });    
          
    
    </script>     


    <!-- Menu Toggle Script -->
    <script>

            function validarInformacion(){
                var x = document.forms["regPaciente"]["buscar"].value.replace(/\s+/g, '');
                if(x == ""){
                    alert("Ingrese un número de registro a buscar");
                    return false;
                }
            }      

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




        //Genero
        function agregarGenero() {

            var genero = document.getElementById("genero").value;
            if (genero !== "") {
                document.getElementById("genero").value = "";
                var generos_agregados = document.getElementById("generos_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(genero);
                var button = document.createElement("button");
                button.id = genero;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick", "eliminarGenero(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "genero";
                input.value = genero;
                input.checked = true;
                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                generos_agregados.appendChild(div);
            }
        }

        function eliminarGenero(id) {
            var generos_agregados = document.getElementById("generos_agregados");
            var btn = document.getElementById(id);
            generos_agregados.removeChild(btn.parentElement);
        }

        function handleGenero(e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                agregarGenero();
            }
        }

        function agregarCampoGenero() {
            $("#div_genero").collapse("toggle");
        }

        //Sexo
        function agregarSexo() {

            var sexo = document.getElementById("sexo").value;
            if (sexo !== "") {
                document.getElementById("sexo").value = "";
                var generos_agregados = document.getElementById("sexos_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(sexo);
                var button = document.createElement("button");
                button.id = sexo;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick", "eliminarSexo(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "sexo";
                input.value = sexo;
                input.checked = true;
                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                sexos_agregados.appendChild(div);
            }
        }

        function eliminarSexo(id) {
            var sexos_agregados = document.getElementById("sexos_agregados");
            var btn = document.getElementById(id);
            sexos_agregados.removeChild(btn.parentElement);
        }

        function handleSexo(e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                agregarGenero();
            }
        }

        function agregarCampoSexo() {
            $("#div_sexo").collapse("toggle");
        }

        //Religion
        function agregarReligion() {

            var religion = document.getElementById("religion").value;
            if (religion !== "") {
                document.getElementById("religion").value = "";
                var religiones_agregados = document.getElementById("religiones_agregados");
                var div = document.createElement("div");
                div.className = "form-value-one";
                var text_div = document.createTextNode(religion);
                var button = document.createElement("button");
                button.id = religion;
                button.className = "btn btn-danger btn-sm btn-space";
                button.setAttribute("onClick", "eliminarReligion(this.id)");
                var span = document.createElement("span");
                span.className = "glyphicon glyphicon-remove";
                var input = document.createElement("input");
                input.className = "checkbox-agregados";
                input.type = "checkbox";
                input.name = "religion";
                input.value = religion;
                input.checked = true;
                button.appendChild(span);
                div.appendChild(button);
                div.appendChild(input);
                div.appendChild(text_div);
                religiones_agregados.appendChild(div);
            }
        }

        function eliminarReligion(id) {
            var religiones_agregados = document.getElementById("religiones_agregados");
            var btn = document.getElementById(id);
            religiones_agregados.removeChild(btn.parentElement);
        }

        function handleReligion(e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                agregarReligion();
            }
        }

        function agregarCampoReligion() {
            $("#div_religion").collapse("toggle");
        }
    </script>
</html>
