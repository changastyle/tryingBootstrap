<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<% 
    String orderBy = request.getParameter("orderBy");
    
    if(orderBy==null)
    {
        orderBy = "usuarioADSL";
    }
    
    out.print("{\"vector\":[");
    java.util.ArrayList<model.ModemRadx> arr = controller.Controller.findAllModemRadx(orderBy);
    
    int contador = 0;
    for(model.ModemRadx modemRadx : arr)
    {
        JSONObject aux = new JSONObject();
        
	aux.put("usuarioADSL",  modemRadx.getUsuarioADSL());
        aux.put("direccionIP",  modemRadx.getDireccionIP());
        aux.put("reintentos",  modemRadx.getReintentos());
        aux.put("descripcion",  modemRadx.getDescripcion());
        
        out.print(aux);
        
        contador ++;
        if(contador >=  arr.size() )
        {
            out.print("]}");
            break;
        }
        else
        {
            out.print(",");
        }
    }
    
%>