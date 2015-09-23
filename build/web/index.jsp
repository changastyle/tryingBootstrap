<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VPN | Manager VPN</title>
        <link rel='shortcut icon' type='image/x-icon' href='vista/img/favicon-32x32.png' />
        
        <!-- ESTILOS CSS: -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="vista/css/index.css">
        <!-- FIN ESTILOS CSS. -->
    </head>
    <body >
        <div id="bg"></div>
        <header class="container-fluid row">
            <h1 class="col-xs-12 col-xs-offset-0 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2" onclick="gotoHome()">VPN Manager<span><img id="logoHeader" height="90px" src="vista/img/icon_vpn.png"></span></h1>
        </header>
        

        <section id="principal" class="main container col-xs-12 col-sm-12 col-sm-offset-0 col-md-10 col-md-offset-1">
            <div id="navBar row">
                <ul class="nav nav-tabs nav-justified">
                    <li role="presentation" class="active li" id="liReady"onclick="changePage(this)" data-page="pages/VPN-Modem.jsp"><a class="navEnlaces" href="#"> VPN - Modems</a></li>
                    <li role="presentation" class="li"  onclick="changePage(this)" data-page="pages/VPN-User.jsp"><a class="navEnlaces" href="#">ITEM 2</a></li>
                    <li role="presentation" class="li"  onclick="changePage(this)" data-page="pages/PM-VSAT.jsp"><a class="navEnlaces" href="#">ITEM 3</a></li>
                    <li role="presentation" class="li"  onclick="changePage(this)" data-page="pages/PM-Modem.jsp"><a class="navEnlaces" href="#">ITEM 4</a></li>
                </ul>
            </div>

            <div id="wraperBusquedaPrincipal"><input type="text" id="barraBusqueda" class="form-control" onkeypress="barraBusquedaKeyPress(this)"></div>
            <div id="wraperContenidoPrincipal">
                
            </div>
            <div id="wraperFormularioPrincipal">
                <div id="desplegadorFormulario" class="btn-lg btn btn-primary" onclick="openFormulario('wraperFormularioPrincipal')">
                    Formulario
                </div>
                <div id="wraperContenidoFormulario">
                </div>
            </div>
        </section>
        
        <div class="glyphicon glyphicon-arrow-down arrows" id="arrowTOP"></div>
        <div class="glyphicon-arrow-down arrows" id="arrowBOT"></div>
        
        <!--<footer class="container-fluid">
            GROSSI NICOLAS.
        </footer>-->
        
        <!-- SCRIPTS JS: -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="vista/js/index.js"></script>
        <!-- FIN SCRIPTS JS.-->
    </body>
</html>
