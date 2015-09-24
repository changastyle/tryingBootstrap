package model;

public class ModemRadx
{
    private model.Radcheck radcheckRepresentativo;
    private model.Radreply radreplyRepresentativo;
    private model.Radreply radreplyNetMaskRepresentativo;
    
    private String usuarioADSL;
    private String descripcion;
    private int reintentos;
    private String direccionIP;
    
    public ModemRadx()
    {
        usuarioADSL = null;
        descripcion = null;
        reintentos = -1;
        direccionIP = null;
        radcheckRepresentativo = new Radcheck();
        radreplyRepresentativo = new Radreply();
        radreplyNetMaskRepresentativo = new Radreply();
    }
    public ModemRadx(String usuarioADSL, String descripcion , int reintentos, String direccionIP)
    {
        this.usuarioADSL = usuarioADSL;
        this.descripcion = descripcion;
        this.reintentos = reintentos;
        this.direccionIP = direccionIP;
        this.radcheckRepresentativo = new Radcheck( usuarioADSL, "User-password", "==", "1nTr4l0t", 0, descripcion);
        this.radreplyRepresentativo = new Radreply(usuarioADSL , "Framed-IP-Address", "=", direccionIP  );
        this.radreplyNetMaskRepresentativo = new Radreply(usuarioADSL, "Framed-IP-Netmask", "=", "255.255.255.0");
        
    }
    
    //<editor-fold desc="GYS">
    public Radcheck getRadcheckRepresentativo()
    {
        return radcheckRepresentativo;
    }


    public Radreply getRadreplyRepresentativo()
    {
        return radreplyRepresentativo;
    }



    public Radreply getRadreplyNetMaskRepresentativo()
    {
        return radreplyNetMaskRepresentativo;
    }
    public String getUsuarioADSL()
    {
        return usuarioADSL;
    }

    public void setUsuarioADSL(String usuarioADSL)
    {
        this.usuarioADSL = usuarioADSL;
    }

    public String getDescripcion()
    {
        return descripcion;
    }

    public void setDescripcion(String descripcion)
    {
        this.descripcion = descripcion;
    }

    public int getReintentos()
    {
        return reintentos;
    }

    public void setReintentos(int reintentos)
    {
        this.reintentos = reintentos;
    }

    public String getDireccionIP()
    {
        return direccionIP;
    }
        public void setDireccionIP(String direccionIP)
    {
        this.direccionIP = direccionIP;
    }


    //</editor-fold>

    //<editor-fold desc="GYS IMPORTANTES">
    public void setRadcheckRepresentativo(Radcheck radcheckRepresentativo)
    {
        this.radcheckRepresentativo = radcheckRepresentativo;
        this.usuarioADSL = radcheckRepresentativo.getUsername();
        this.reintentos = radcheckRepresentativo.getReint();
        this.descripcion = radcheckRepresentativo.getObservaciones();
    }
    public void setRadreplyRepresentativo(Radreply radreplyRepresentativo)
    {
        this.radreplyRepresentativo = radreplyRepresentativo;
        this.direccionIP = radreplyRepresentativo.getValue();
    }
    public void setRadreplyNetMaskRepresentativo(Radreply radreplyNetMaskRepresentativo)
    {
        this.radreplyNetMaskRepresentativo = radreplyNetMaskRepresentativo;
        //this
    }
    //</editor-fold>
    
    public int numeroNombreUsuarioADSL()
    {
        int numeroNombreUsuarioADSL = 0 ;
        boolean almacenar = false;
        String acumuladorAUX = "";
        String nombreUsuarioADSL = this.getUsuarioADSL();
        
        for(int i = 0 ; i < nombreUsuarioADSL.length() ; i++)
        {
            if(almacenar)
            {
                acumuladorAUX += nombreUsuarioADSL.charAt(i);
            }
            if(nombreUsuarioADSL.charAt(i)== '_')
            {
                almacenar = true;
            }
        }
        
        try
        {
            numeroNombreUsuarioADSL = Integer.parseInt(acumuladorAUX);
        } 
        catch (Exception e)
        {
            e.printStackTrace();
            System.out.println("NO SE PUDO CONVERTIR:" + acumuladorAUX + " a numero!");
        }
        
        return numeroNombreUsuarioADSL;
    }
    @Override
    public String toString()
    {
        return "ModemRadx{" + "radcheckRepresentativo=" + radcheckRepresentativo.toString() + ", radreplyRepresentativo=" + radreplyRepresentativo.toString() + ", radreplyNetMaskRepresentativo=" + radreplyNetMaskRepresentativo.toString() + ", usuarioADSL=" + usuarioADSL + ", descripcion=" + descripcion + ", reintentos=" + reintentos + ", direccionIP=" + direccionIP + '}';
    }

    public String minimalToString()
    {
        return "ModemRadx{" + "usuarioADSL=" + usuarioADSL + ", descripcion=" + descripcion + ", reintentos=" + reintentos + ", direccionIP=" + direccionIP + '}';
    }
    

    
    

    
}
