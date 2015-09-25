<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<% 
    String orderBy = request.getParameter("orderBy");
    String valorBuscado = request.getParameter("valorBuscado");
    if(orderBy==null)
    {
        orderBy = "usuarioADSL";
    }
    if(valorBuscado != null)
    {
        valorBuscado = valorBuscado;
    }
    else
    {
        valorBuscado = "";
    }
    
    String texto = "{\"vector\":[ ";
    java.util.ArrayList<model.ModemRadx> arr = controller.Controller.findAllModemRadx(orderBy);
    
    
    for(model.ModemRadx modemRadx : arr)
    {
        if( modemRadx.buscarEnMisAtributos(valorBuscado) )
        {
            JSONObject aux = new JSONObject();
            aux.put("usuarioADSL",  modemRadx.getUsuarioADSL());
            aux.put("direccionIP",  modemRadx.getDireccionIP());
            aux.put("reintentos",  modemRadx.getReintentos());
            aux.put("descripcion",  modemRadx.getDescripcion());
            texto += aux + ","; 
        }
    }
    texto = texto.substring(0, (texto.length() - 1) );
    texto += "]}";
    
    out.print(texto);
    
%>