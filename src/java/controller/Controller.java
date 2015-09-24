package controller;

import java.util.ArrayList;
import model.ModemRadx;

public class Controller
{
    public static ArrayList<model.Radcheck> findAllRadchecks(){return daos.RadcheckDAO.findAllRadchecks();}
    public static ArrayList<model.Radcheck> findAllRadchecks(String orderBy){return daos.RadcheckDAO.findAllRadchecks(orderBy);}
    public static ArrayList<model.Radreply> findAllRadreplys(){ return daos.RadreplyDAO.findAllRadreplys();}
    public static ArrayList<model.Radreply> findAllRadreplys(String orderBy){return daos.RadreplyDAO.findAllRadreplys(orderBy);}
    public static ArrayList<model.ModemRadx> findAllModemRadx(){return daos.ModemRadxDAO.findAllModemRadx();}
    public static ArrayList<model.ModemRadx> findAllModemRadx(String orderBy){return daos.ModemRadxDAO.findAllModemRadx(orderBy);}
    
    
    //<editor-fold desc="SugerenciasFORMS">
    public static model.ModemRadx modemRadxSugerido()
    {
        model.ModemRadx modemSugerido = new ModemRadx();
        ArrayList<model.ModemRadx> arrModemsActual = findAllModemRadx();
        
        //SUGERENCIA NOMBRE ADSL:
        String nombreUsuarioMAX = "";
        String direccioIPMAX = "";
        for(int i = 1 ; i < 255 ; i++)
        {
            String supuestoNombreUsuario = "adsl_";
            if(i < 10)
            {
                supuestoNombreUsuario += "00" + i;
            }
            else if(i < 100)
            {
                 supuestoNombreUsuario += "0" + i;
            }
            else
            {
                 supuestoNombreUsuario += "" + i;
            }
            
            if(!existeModemConTalUsuario(supuestoNombreUsuario , arrModemsActual))
            {
                nombreUsuarioMAX = supuestoNombreUsuario;
                break;
            }            
        }
        for(int i = 1 ; i < 255 ; i++)
        {
            String supuestaIP = "172.36.200."+i;
            //SUGERENCIA DIRECCION IP:
            if(!existeModemConTalDireccionIP(supuestaIP , arrModemsActual))
            {
                direccioIPMAX = supuestaIP;
                break;
            }
        }
        
        

        modemSugerido.setUsuarioADSL(nombreUsuarioMAX);
        modemSugerido.setDireccionIP(direccioIPMAX);
        
        return modemSugerido;
    }    
    private static boolean existeModemConTalUsuario(String supuestoNombreUsuario , ArrayList<model.ModemRadx> arrModemsActual )
    {
        boolean existe = false;
        for (model.ModemRadx modemAUX : arrModemsActual)
        {
            if(supuestoNombreUsuario.equalsIgnoreCase(modemAUX.getUsuarioADSL()) )
            {
               existe = true;
            }
        }   
        return existe;
    }
    private static boolean existeModemConTalDireccionIP(String supuestaIP , ArrayList<model.ModemRadx> arrModemsActual)
    {
        boolean existe = false;
        for (model.ModemRadx modemAUX : arrModemsActual)
        {
            if(supuestaIP.equalsIgnoreCase(modemAUX.getDireccionIP()) )
            {
               existe = true;
            }
        }   
        return existe;
    }
    //</editor-fold>
    
    //<editor-fold desc="ALTAS">
    public static boolean altaModemRadx(model.ModemRadx modemRadx){return daos.ModemRadxDAO.save(modemRadx);}
    //</editor-fold>

 


}
