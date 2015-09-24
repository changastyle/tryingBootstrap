<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            #wrap
            {
                width: 100%;
                height: 500px;
                border:solid 2px black;
            }
        </style>
        <script src="vista/js/jquery-2.1.4.min.js"></script>
        <script>
            $(document).ready(function()
            {
                $.ajax({url:"pages/VPN-Modem2.jsp",success: function (data, textStatus, jqXHR) 
                {
                    $("#wrap").html(data);
                }});
            });
        </script>
    </head>
    <body>
        <div id="wrap"></div>
    </body>
</html>
