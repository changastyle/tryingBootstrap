
<%@page import="model.ModemRadx"%>
<%

    String usuarioADSL = request.getParameter("usuarioADSL");
    String direccionIP = request.getParameter("direccionIP");
    String descripcion = request.getParameter("descripcion");
    String habilitado = request.getParameter("habilitado");
    int reintentos = -1;
    if(habilitado.equalsIgnoreCase("on"))
    {
        reintentos = 0;
    }
    
    model.ModemRadx modemModemRadx = new ModemRadx(usuarioADSL, descripcion , reintentos, direccionIP );
    out.print("" + usuarioADSL + " " + direccionIP + " " + descripcion + " " + habilitado);
    out.print(modemModemRadx.minimalToString());
    
    if(controller.Controller.altaModemRadx(modemModemRadx))
    {
        out.print("Inserto ok!");
    }
    else
    {
        out.print("NO Inserto.");
    }
    
    //response.sendRedirect("index3.jsp");
%>