<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../vista/css/fonts/fonts.css">
        <link rel="stylesheet" href="../vista/css/index3.css">
        <script>
            $(document).ready(function()
            {
                cargar('GridModemRadx.jsp','FormularioModemRadx.jsp');
            });
            function cargar(paginaGrid,paginaFormulario)
            {
                console.log("Cargando:" +  paginaGrid +" , " + paginaFormulario);
                $(".tabsLI").each(function(index,element)
                {
                   $(element).removeClass("active");
                });
                
                //CARGANDO GRID:
                $.ajax({url:paginaGrid,success: function (data, textStatus, jqXHR) 
                {
                    $("#principal").html(data);
                }});
                //CARGANDO FORMULARIO:
                $.ajax({url:paginaFormulario,success: function (data, textStatus, jqXHR) 
                {
                    $("#bodyFormulario").html(data);
                }});
            
                //MIGAS DE PAN:
                $("#rightBanner").html(paginaGrid);
            }
            function desplegarFormulario()
            {
                formulario = $("#formulario");
                console.log("Desplegando Formulario: " + $(formulario).innerHeight());
                
                if($(formulario).innerHeight() < 50)
                {
                    $(formulario).css("height", "500px");
                    $("#bodyFormulario").show("slow");
                }
                else
                {
                    $(formulario).css("height", "35px");
                    $("#bodyFormulario").hide("slow");
                }
                
            }
            function verificarFormularioModemRadx()
            {
                console.log("verificandoFormularioModemRadx");
                return false;
            }
            function irHome()
            {
                window.location = "index3.jsp";
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index3</title>
    </head>
    <body>
        <div id="bg"></div>
        
        <div class="container-fluid" id="banner">
            <div id="leftBanner" class="col-xs-4 col-sm-2 col-md-2 container" onclick="irHome()">VPN Manager</div>
            
            <!--UN DIV O EL OTRO SEGUN EL TAMAÑO DE LA PANTALLA:-->
            <div id="midBanner" class="visible-sm visible-xs col-xs-8 col-sm-10 ">
                <select class="form-control" onchange="cargar('GridModemRadx.jsp','FormularioModemRadx.jsp')">
                    <option onclick="cargar('GridModemRadx.jsp','FormularioModemRadx.jsp')">Modems VPN</option>
                    <option onclick="cargar('GridModemRadx.jsp','FormularioModemRadx.jsp')">Usuarios VPN</option>
                    <option onclick="cargar('GridModemRadx.jsp','FormularioModemRadx.jsp')">Plan Maestro Modems</option>
                    <option onclick="cargar('GridModemRadx.jsp','FormularioModemRadx.jsp')">Plan Maestro VSATS</option>
                </select>
                    
            </div>
            <!--UN DIV O EL OTRO SEGUN EL TAMAÑO DE LA PANTALLA:-->
            <div id="midBanner" class="hidden-sm hidden-xs col-md-8">
                <!--<div class="container" id="nav">-->
                    <ul class="nav nav-pills nav-justified">
                        <li class="tabsLI active"><a class="pestañas" href="javascript:cargar('GridModemRadx.jsp','FormularioModemRadx.jsp')">Modems VPN</a></li>
                        <li class="tabsLI"><a class="pestañas" href="#">Usuarios VPN</a></li>
                        <li class="tabsLI"><a class="pestañas" href="#">Plan Maestro Modems</a></li>
                        <li class="tabsLI"><a class="pestañas"href="#">Plan Maestro VSATS</a></li>
                    </ul>
                <!--</div>-->
            </div>
            <div class="hidden-sm hidden-xs col-md-2 container" id="rightBanner"></div>
        </div>
        
        
        
        <div class="container" id="formulario" >
            <div id="headerFormulario" onclick="desplegarFormulario()">Formularios</div>
            <div id="bodyFormulario"></div>
        </div>
        <div class="container" id="principal"></div>
        
        <footer class="container-fluid">
            <div class="container" id="footerHead">Sistema construido por <a href="http://ngrossi.ddns.net">Nicolas Grossi</a>.</div>
            
            <div class="col-sm-2 col-md-2 col-sm-offset-2" id="footerCOL1">footerCOL1</div>
            <div class="col-sm-2 col-md-2 col-sm-offset-1" id="footerCOL2">footerCOL2</div>
            <div class="col-sm-2 col-md-2 col-sm-offset-1" id="footerCOL3">footerCOL3</div>
        </footer>
    </body>
</html>
