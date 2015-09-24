package daos;

import static daos.RadcheckDAO.findAllRadchecks;
import model.Radcheck;
import model.Radreply;

public class RadreplyDAO
{
    public static java.util.ArrayList<model.Radreply> findAllRadreplys()
    {
        java.util.ArrayList<model.Radreply> arrRespuetas = new java.util.ArrayList<model.Radreply>();
        java.util.List<Object> listaProvisoria = daos.AbstractDAO.findAll(model.Radreply.class, "username" , true);
        
        for(Object o : listaProvisoria)
        {
            model.Radreply radreplyAux = (model.Radreply) o;
            arrRespuetas.add(radreplyAux);
        }
        
        
        return arrRespuetas;
    }
    public static java.util.ArrayList<model.Radreply> findAllRadreplys(String orderBy)
    {
        java.util.ArrayList<model.Radreply> arrRespuetas = new java.util.ArrayList<model.Radreply>();
        java.util.List<Object> listaProvisoria = daos.AbstractDAO.findAll(model.Radreply.class, orderBy , true);
        
        for(Object o : listaProvisoria)
        {
            model.Radreply radreplyAux = (model.Radreply) o;
            arrRespuetas.add(radreplyAux);
            System.out.println("" + radreplyAux.toString());
        }
        
        
        return arrRespuetas;
    }
    public static int getMaxID()
    {
        int maxID = 1;
        for(Radreply radreply : findAllRadreplys())
        {
            if(maxID <= radreply.getId())
            {
                maxID = radreply.getId() + 1;
            }
        }
        return maxID;
    }
    public static boolean save(Radreply radreplyRepresentativo)
    {
        boolean inserto = false;
        int id = getMaxID();
        radreplyRepresentativo.setId(id);
        if( daos.AbstractDAO.save(radreplyRepresentativo)  != -1 )
        {
            inserto = true;
        }
        return inserto;
    }
    public static boolean existeTalRadreplyByUsername(String username)
    {
        boolean existe = false;
        for(Radreply radreply :findAllRadreplys())
        {
            if(radreply.getUsername().equalsIgnoreCase(username))
            {
                existe = true;
            }
        }
        return existe;
    }
}
