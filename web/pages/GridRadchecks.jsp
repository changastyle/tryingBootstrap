<script src="../vista/js/jquery-2.1.4.min.js"></script>
<script> 
    $(document).ready(function()
    {
       grid("gridRadchecks","id");
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
                fila = "<tr>";
                fila += "<td>" + arr.vector[i].id + "</td>";
                fila += "<td>" + arr.vector[i].username + "</td>";
                fila += "<td>" + arr.vector[i].value + "</td>";
                fila += "<td>" + arr.vector[i].observaciones + "</td>";
                fila += "</tr>";
                $("#" + grid + " tbody").append(fila);
            }
        }});           
    }
</script>
<table border="1" id="gridRadchecks" data-pagina="../JSON/JSONRadchecks.jsp">
    <thead>
        <tr>
            <th onclick="grid('gridRadchecks','id')">ID</th>
            <th onclick="grid('gridRadchecks','username')">Username</th>
            <th onclick="grid('gridRadchecks','value')">Value</th>
            <th onclick="grid('gridRadchecks','observaciones')">Observaciones</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>