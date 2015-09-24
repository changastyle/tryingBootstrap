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
        <style>
            #banner
            {
                //border:solid 2px black;
                text-align: center;
                background-color: rgba(0,0,0,0.3);
                color:white;
            }
            #nav
            {
                //border:solid 2px black;
            }
            #principal
            {
                //height: 300px;
                //border:solid 2px black;
                min-height: 600px;
            }
            footer
            {
                //border:solid 2px black;
                background-color: rgba(0,0,0,0.3);
                text-align: center;
                color:white;
            }
            .gridHeader:hover
            {
                cursor:pointer;
                text-decoration: underline;
            }
            #formulario
            {
                height: 35px;
                background-color: rgba(0,0,0,0.3);
                cursor: pointer;
                color:white;
                transition: 1s;
                overflow: hidden;
            }
            #formulario:hover
            {
                text-decoration: underline;
            }
            #headerFormulario
            {
                font-size:20px;
                text-align: center;
                padding: 4px;
            }
            #bodyFormulario
            {
                display: none;
            }
        </style>
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
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index3</title>
    </head>
    <body>
        <div class="container-fluid" id="banner">Banner</div>
        <div class="container" id="nav">
            <ul class="nav nav-tabs">
                <li class="tabsLI active"><a href="javascript:cargar('GridModemRadx.jsp','FormularioModemRadx.jsp')">Grilla Modems</a></li>
                <li class="tabsLI"><a href="#">Grilla Usuarios</a></li>
                <li class="tabsLI"><a href="#">Grilla Plan Maestro Modems</a></li>
                <li class="tabsLI"><a href="#">Grilla Plan Maestro VSATS</a></li>
            </ul>
        </div>
        <div class="container" id="formulario" >
            <div id="headerFormulario" onclick="desplegarFormulario()">Formularios</div>
            <div id="bodyFormulario"></div>
        </div>
        <div class="container" id="principal"></div>
        
        <footer class="container-fluid">Footer</footer>
    </body>
</html>
