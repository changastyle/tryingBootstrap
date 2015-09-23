
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<% 
    String orderBy = request.getParameter("orderBy");
    
    
    out.print("{\"vector\":[");
    java.util.ArrayList<model.Radcheck> arr = controller.Controller.findAllRadchecks(orderBy);
    
    int contador = 0;
    for(model.Radcheck radcheck : arr)
    {
        JSONObject aux = new JSONObject();
        
	aux.put("id",  radcheck.getId());
        aux.put("username",  radcheck.getUsername());
        aux.put("value",  radcheck.getValue());
        aux.put("observaciones",  radcheck.getObservaciones());
        
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