<script src="../vista/js/jquery-2.1.4.min.js"></script>
<script> 
    $(document).ready(function()
    {
       grid("gridRadreplys","id");
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
                fila += "<td>" + arr.vector[i].attribute + "</td>";
                fila += "<td>" + arr.vector[i].op + "</td>";
                fila += "<td>" + arr.vector[i].value + "</td>";
                fila += "</tr>";
                $("#" + grid + " tbody").append(fila);
            }
        }});           
    }
</script>
<table class="table table-responsive table-hover" id="gridRadreplys" data-pagina="../JSON/JSONRadreplys.jsp">
    <thead>
        <tr>
            <th class="gridHeader" onclick="grid('gridRadreplys','id')">ID</th>
            <th class="gridHeader" onclick="grid('gridRadreplys','username')">Username</th>
            <th class="gridHeader" onclick="grid('gridRadreplys','attribute')">Attribute</th>
            <th class="gridHeader" onclick="grid('gridRadreplys','op')">op</th>
            <th class="gridHeader" onclick="grid('gridRadreplys','value')">Value</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>