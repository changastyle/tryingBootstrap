<style type="text/css">
    table {
        border-collapse: collapse;
        border: none;
    }
    th,td {
        border: 1px solid black;
        padding: 4px 16px;
        font-family: Times New Roman;
        font-size: 24px;
        text-align: left;
    }
    th {
        background-color: #C8C8C8;
        cursor: pointer;
    }
    th:hover
    {
        text-decoration: underline;
    }
</style>
<script src="../vista/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
    var colID = 1;
    var colUsername = 1;
    var colValue = 1;
    var colObservaciones = 1;

    function ordenarTabla(header,indiceColumnaAOrdenar) 
    {
        arrayRespuesta = new Array();
        tipoDato = $(header).data("type");
        tbody = $(header).parent().data("body");
        console.log("sorting : " + header + " "  + tipoDato + " " + indiceColumnaAOrdenar);
        console.log(tbody);
        
        filas = $("#" + tbody +" > tr ");
        
        $("#" + tbody +" > tr ").each(function(index, element)
        {
            fila = $(element);
            valor = $(fila).find('td:eq('+ indiceColumnaAOrdenar +')').html();
            
            
            if(tipoDato == "Integer")
            {
                valor = parseInt(valor);
                //console.log(valor);
                existeUnoMasChico=false;
                $("#" + tbody +" > tr ").each(function(index, element)
                {    
                    
                    valor2 = $(fila).find('td:eq('+ indiceColumnaAOrdenar +')').html();
                    valor2 = parseInt(valor2);
                    //console.log(valor + " " + valor2 + " = " + (valor > valor2) );
                    if(valor > valor2)
                    {
                        existeUnoMasChico = true;
                    }
                });
                if(!existeUnoMasChico)
                {
                   arrayRespuesta.push(element); 
                }
            }
            
        });
        
        console.log("arrayRespuesta.length" + arrayRespuesta.length);
        for(i = 0 ; i < arrayRespuesta.length ; i++)
        {
            console.log(arrayRespuesta[i]);
        }
    }
    function compareNumber(a, b)
    {

      if (a.name < b.name) return -1;
      if (a.name > b.name) return 1;
      return 0;
    }
</script>
<body>
    <table>
        <thead>
            <tr data-body="bodyGridRadchecks" >
                <th data-type='Integer' onclick="ordenarTabla(this,0)">ID</th>
                <th onclick="ordenarTabla(people, 1, colUsername)">Username</th>
                <th onclick="ordenarTabla(people, 2, colValue)">Value</th>
                <th onclick="ordenarTabla(people, 2, colObservaciones)">Observaciones</th>
            </tr>
        </thead>
        <tbody id="bodyGridRadchecks">
            <% 
                for(model.Radcheck radcheck : controller.Controller.findAllRadchecks())
                {
                    out.print("<tr>");
                        out.print("<td>" +  radcheck.getId() + "</td>");
                        out.print("<td>" +  radcheck.getUsername() + "</td>");
                        out.print("<td>" +  radcheck.getValue() + "</td>");
                        out.print("<td>" +  radcheck.getObservaciones() + "</td>");
                    out.print("</tr>");
                }
            %>
        </tbody>
    </table>
</body>