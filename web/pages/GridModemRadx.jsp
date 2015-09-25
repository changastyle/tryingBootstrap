<script src="../vista/js/jquery-2.1.4.min.js"></script>
<script> 
    $(document).ready(function()
    {
       grid("gridModemRadx",'searchingBarModemRadx',"id");
    });
    function grid(grid, searchingBar ,orderBy)
    {
        valorBuscado = $("#"+searchingBar).val();
        console.log(searchingBar + "" + valorBuscado);
        
        pagina = $("#" + grid).data("pagina");
        if(orderBy== null)
        {
            orderBy = "id";
        }
        console.log("Grid: " + grid +" | Pagina: " + pagina + " | valorBuscado: " +  valorBuscado + " | OrderBY: " + orderBy );
        
        

        $.ajax(
        {url:pagina, data: {"orderBy":orderBy , "valorBuscado":valorBuscado},method:"GET" ,beforeSend: function (xhr) 
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
                fila += "<td><a class='identificadoresID' href='javascript:'editModemRadx('"+arr.vector[i].usuarioADSL+"')'>" + arr.vector[i].usuarioADSL + "</a></td>";
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
    function searchModemRadx(searchingBar)
    {
        texto = $(searchingBar).val();
        console.log("searchModemRadx: " + $(searchingBar).val());
        
         grid("gridModemRadx",'searchingBarModemRadx',"id");
        
    }
    function editModemRadx(id)
    {
        //RECARGANDO FORMULARIO:
        $.ajax({url:'FormularioModemRadx.jsp', data:{"id":id}success: function (data, textStatus, jqXHR) 
        {
            $("#bodyFormulario").html(data);
        }});
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
<input type="text" class="form-control" id="searchingBarModemRadx" placeholder="Busqueda Rapida.." onkeyup="searchModemRadx(this)" onkeypress="searchModemRadx(this)">
<table class="table table-responsive " id="gridModemRadx" data-pagina="../JSON/JSONModemRadx.jsp">
    <thead>
        <tr>
            <th><input type="checkbox" id="checkboxPadre" onclick="selectAllCheckbox(this)"></th>
            <th class="gridHeader" onclick="grid('gridModemRadx', 'searchingBarModemRadx' ,'usuarioADSL')">UsuarioADSL</th>
            <th class="gridHeader" onclick="grid('gridModemRadx', 'searchingBarModemRadx','direccionIP')">Direccion IP</th>
            <th class="gridHeader" onclick="grid('gridModemRadx', 'searchingBarModemRadx' ,'reintentos')">Reintentos</th>
            <th class="gridHeader" onclick="grid('gridModemRadx', 'searchingBarModemRadx','descripcion')">Descripcion</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>