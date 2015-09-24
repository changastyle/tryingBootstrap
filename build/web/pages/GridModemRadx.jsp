<script src="../vista/js/jquery-2.1.4.min.js"></script>
<script> 
    $(document).ready(function()
    {
       grid("gridModemRadx","id");
    });
    function grid(grid, orderBy)
    {
        
        pagina = $("#" + grid).data("pagina");
        if(orderBy== null)
        {
            orderBy = "id";
        }
        console.log("Grid: " + grid +" | Pagina: " + pagina + " | OrderBY: " + orderBy );
        
        

        $.ajax(
        {url:pagina, data: {"orderBy":orderBy},beforeSend: function (xhr) 
        {
            $("#" + grid + " tbody").html("<img src='../vista/img/ajax-loader.gif'>");       
        }
        , success: function (data, textStatus, jqXHR) 
        {
            //console.log(data);
            arr = JSON.parse(data);
            //console.log(arr);console.log(arr.radchecks.length +  " resultados!");
            
            $("#" + grid + " tbody").html("");
            
            for(i = 0 ; i < arr.vector.length; i++)
            {
                fila = "<tr class='trGridModemRadx' id='trGridModemRadx" +  arr.vector[i].usuarioADSL +"'>";
                fila += "<td><input class='checkboxGridModemRadx' type='checkbox' onclick='checkboxOnclickGridModemRadx()' value='" + arr.vector[i].usuarioADSL  + "' data-seleccionar='trGridModemRadx" +  arr.vector[i].usuarioADSL +"'></td>";
                fila += "<td>" + arr.vector[i].usuarioADSL + "</td>";
                fila += "<td>" + arr.vector[i].direccionIP + "</td>";
                fila += "<td>" + arr.vector[i].reintentos + "</td>";
                fila += "<td>" + arr.vector[i].descripcion + "</td>";
                fila += "</tr>";
                $("#" + grid + " tbody").append(fila);
            }
        }});           
    }
    function checkboxOnclickGridModemRadx()
    {
        contadorCheckeds = 0 ;
        checkboxs = $(".checkboxGridModemRadx");
        checkboxs.each(function(index,element)
        {
            
            idDeLaRowContenedoraDelCheckbox = $(element).data("seleccionar");

            if($(element).is(':checked'))
            {
                contadorCheckeds++;
                
                $("#" + idDeLaRowContenedoraDelCheckbox).addClass("trexitosa");
            }
            else
            {
                $("#" + idDeLaRowContenedoraDelCheckbox).removeClass("trexitosa");
            }
            //console.log($(element).is(':checked'));
        });
        console.log("checkboxOnclickGridModemRadx-> " + checkboxs.length + " -> " + contadorCheckeds);
    }
    function selectAllCheckbox(checkboxPadre)
    {
        checkboxs = $(".checkboxGridModemRadx");
        if($(checkboxPadre).is(':checked'))
        {
            checkboxs.each(function(index,element)
            {
                idDeLaRowContenedoraDelCheckbox = $(element).data("seleccionar");
                
                $(element).prop("checked",true);
                
                $("#" + idDeLaRowContenedoraDelCheckbox).addClass("trexitosa");
            });
        }
        else
        {
            checkboxs.each(function(index,element)
            {
                idDeLaRowContenedoraDelCheckbox = $(element).data("seleccionar");
                
                $(element).prop("checked",false);
                
                $("#" + idDeLaRowContenedoraDelCheckbox).removeClass("trexitosa");
            });
        }
    }
</script>
<style>
    .trexitosa
    {
        background-color: #8AC007;
    }
    .trexitosa:hover
    {
        background-color: #8AC007;
    }
</style>
<table class="table table-responsive " id="gridModemRadx" data-pagina="../JSON/JSONModemRadx.jsp">
    <thead>
        <tr>
            <th><input type="checkbox" id="checkboxPadre" onclick="selectAllCheckbox(this)"></th>
            <th class="gridHeader" onclick="grid('gridModemRadx','usuarioADSL')">UsuarioADSL</th>
            <th class="gridHeader" onclick="grid('gridModemRadx','direccionIP')">Direccion IP</th>
            <th class="gridHeader" onclick="grid('gridModemRadx','reintentos')">Reintentos</th>
            <th class="gridHeader" onclick="grid('gridModemRadx','descripcion')">Descripcion</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>