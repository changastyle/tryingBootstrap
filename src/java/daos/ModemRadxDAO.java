
package daos;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import model.ModemRadx;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ModemRadxDAO
{
    public static java.util.ArrayList<model.ModemRadx> findAllModemRadx()
    {
        java.util.ArrayList<model.ModemRadx> arrRespuetas = new java.util.ArrayList<model.ModemRadx>();
        ArrayList<model.Radcheck> arrProvisorioRadchecks = daos.RadcheckDAO.findAllRadchecks();
        ArrayList<model.Radreply> arrProvisorioRadreplys = daos.RadreplyDAO.findAllRadreplys();
        
        for(model.Radcheck radcheckAUX : arrProvisorioRadchecks)
        {

            if(radcheckAUX.getUsername().startsWith("adsl_"))
            {
                model.ModemRadx modem = new model.ModemRadx();
                modem.setRadcheckRepresentativo(radcheckAUX);
                
                for(model.Radreply radReplyIP : arrProvisorioRadreplys)
                {
                    if(radcheckAUX.getUsername().trim().equalsIgnoreCase(radReplyIP.getUsername().trim()) && radReplyIP.getAttribute().equalsIgnoreCase("Framed-IP-Address"))
                    {
                        modem.setRadreplyRepresentativo(radReplyIP);
                    }
                }
                for(model.Radreply radReplyNetMask : arrProvisorioRadreplys)
                {
                    if(radcheckAUX.getUsername().trim().equalsIgnoreCase(radReplyNetMask.getUsername().trim()) && radReplyNetMask.getAttribute().equalsIgnoreCase("Framed-IP-Netmask"))
                    {
                        modem.setRadreplyNetMaskRepresentativo(radReplyNetMask);
                    }
                }
                arrRespuetas.add(modem);
            }
            
        }
        
        return arrRespuetas;
    }
    public static java.util.ArrayList<model.ModemRadx> findAllModemRadx(String orderBy)
    {
        java.util.ArrayList<model.ModemRadx> arrRespuetas = findAllModemRadx();
        if(orderBy.equals("direccionIP"))
        {
            System.out.println("ModemRadx -> Odenando by:" + orderBy);
            Collections.sort(arrRespuetas,new Comparator<model.ModemRadx>() 
            {
                public int compare(model.ModemRadx modemRadx1, model.ModemRadx modemRadx2) 
                {
                    return modemRadx1.getDireccionIP().compareToIgnoreCase(modemRadx2.getDireccionIP());
                }
            });
        }
        else if(orderBy.equals("descripcion"))
        {
            System.out.println("ModemRadx -> Odenando by:" + orderBy);
            
            Collections.sort(arrRespuetas,new Comparator<model.ModemRadx>() 
            {
                public int compare(model.ModemRadx modemRadx1, model.ModemRadx modemRadx2) 
                {
                    if(modemRadx1.getDescripcion() != null && modemRadx2.getDescripcion()!=null)
                    {
                        int salida = modemRadx1.getDescripcion().toLowerCase().compareTo(modemRadx2.getDescripcion().toLowerCase());
                        if(salida < 0)
                        {
                            return -1;
                        }
                        else
                        {
                            return 1;
                        }
                    }
                    else
                    {
                        if(modemRadx1.getDescripcion() != null)
                        {
                            return 1;
                        }
                        else
                        {
                            return -1;
                        }
                    }
                    
                }
            });
        }
        else
        {
            System.out.println("ModemRadx -> UNSORTED: " + orderBy);
        }
        
        
        return arrRespuetas;
    }

    public static boolean save(ModemRadx modemRadx)
    {
        boolean inserto = false;
        
        int maxIDRadcheck = daos.RadcheckDAO.getMaxID();
        int maxIDRadcreply1 = daos.RadreplyDAO.getMaxID();
        int maxIDRadcreply2 = maxIDRadcreply1 + 1;
        
        model.Radcheck radcheckAUX = modemRadx.getRadcheckRepresentativo();
        radcheckAUX.setId(maxIDRadcheck);
        modemRadx.setRadcheckRepresentativo(radcheckAUX);
        System.out.println("maxIDRadcheck" + maxIDRadcheck);
        System.out.println("" + radcheckAUX.toString());
        
        model.Radreply radreplyAUX1 = modemRadx.getRadreplyRepresentativo();
        radreplyAUX1.setId(maxIDRadcreply1);
        modemRadx.setRadreplyRepresentativo(radreplyAUX1);
        System.out.println("maxIDRadcreply1 : " + maxIDRadcreply1);
        System.out.println("" + radreplyAUX1.toString());
        
        model.Radreply radreplyAUX2 = modemRadx.getRadreplyNetMaskRepresentativo();
        radreplyAUX2.setId(maxIDRadcreply2);
        modemRadx.setRadreplyNetMaskRepresentativo(radreplyAUX2);
        System.out.println("maxIDRadcreply2 : " + maxIDRadcreply2);
        System.out.println("" + radreplyAUX2.toString());
        
        
        Session session = daos.AbstractDAO.conectar();
        Transaction transaction = session.beginTransaction(); 
        
        boolean ok1=false,ok2=false,ok3 =false;
        try
        {
            if(!daos.RadcheckDAO.existeTalRadcheckByUsername(radcheckAUX.getUsername()))
            {
                session.save(radcheckAUX);
                ok1 = true;
            }
            if(!daos.RadreplyDAO.existeTalRadreplyByUsername(radreplyAUX1.getUsername()))
            {
                session.save(modemRadx.getRadreplyRepresentativo()); 
                ok2 = true;
            }
            if(!daos.RadreplyDAO.existeTalRadreplyByUsername(radreplyAUX2.getUsername()))
            {
                session.save(modemRadx.getRadreplyNetMaskRepresentativo()); 
                ok3 = true;
            }
            
            if(ok1 && ok2 && ok3)
            {
                 transaction.commit();
                 daos.AbstractDAO.desconectar(session);
                 inserto = true;
            }
            else
            {
                transaction.rollback();
                daos.AbstractDAO.desconectar(session);
                inserto= false;
            }
        }
        catch(Exception e)
        {
            transaction.rollback();
            e.printStackTrace();
            System.out.println("ERROR: ModemRadxDAO -> save: " +modemRadx.toString());
        }

        
        /*
        boolean ok1 = daos.RadcheckDAO.save(modemRadx.getRadcheckRepresentativo());
        boolean ok2 = daos.RadreplyDAO.save(modemRadx.getRadreplyRepresentativo());
        boolean ok3 = daos.RadreplyDAO.save(modemRadx.getRadreplyNetMaskRepresentativo());

        if(ok1 && ok2 && ok3)
        {
            inserto = true;
        }
        */
        
        
        
        return inserto;
    }
}
