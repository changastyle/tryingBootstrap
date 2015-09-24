<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<% 
    String orderBy = request.getParameter("orderBy");
    
    if(orderBy==null)
    {
        orderBy = "id";
    }
    
    out.print("{\"vector\":[");
    java.util.ArrayList<model.Radreply> arr = controller.Controller.findAllRadreplys(orderBy);
    
    int contador = 0;
    for(model.Radreply radreply : arr)
    {
        JSONObject aux = new JSONObject();
        
	aux.put("id",  radreply.getId());
        aux.put("username",  radreply.getUsername());
        aux.put("attribute",  radreply.getAttribute());
        aux.put("op",  radreply.getOp());
        aux.put("value", radreply.getValue());
        
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