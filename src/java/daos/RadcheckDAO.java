package daos;

import model.Radcheck;

public class RadcheckDAO
{
    public static java.util.ArrayList<model.Radcheck> findAllRadchecks()
    {
        java.util.ArrayList<model.Radcheck> arrRespuetas = new java.util.ArrayList<model.Radcheck>();
        java.util.List<Object> listaProvisoria = daos.AbstractDAO.findAll(model.Radcheck.class, "username" , true);
        
        for(Object o : listaProvisoria)
        {
            model.Radcheck radcheckAux = (model.Radcheck) o;
            arrRespuetas.add(radcheckAux);
        }
        
        
        return arrRespuetas;
    }
    public static java.util.ArrayList<model.Radcheck> findAllRadchecks(String orderBy)
    {
        java.util.ArrayList<model.Radcheck> arrRespuetas = new java.util.ArrayList<model.Radcheck>();
        java.util.List<Object> listaProvisoria = daos.AbstractDAO.findAll(model.Radcheck.class, orderBy , true);
        
        for(Object o : listaProvisoria)
        {
            model.Radcheck radcheckAux = (model.Radcheck) o;
            arrRespuetas.add(radcheckAux);
        }
        
        
        return arrRespuetas;
    }

    public static int getMaxID()
    {
        int maxID = 1;
        for(Radcheck radcheck : findAllRadchecks())
        {
            if(maxID <= radcheck.getId())
            {
                maxID = radcheck.getId() + 1;
            }
        }
        
        return maxID;
    }
    
    public static boolean save(Radcheck radcheckRepresentativo)
    {
        boolean inserto = false;
        int id = getMaxID();
        radcheckRepresentativo.setId(id);
        if( daos.AbstractDAO.save(radcheckRepresentativo)  != -1 )
        {
            inserto = true;
        }
        return inserto;
    }
    public static boolean existeTalRadcheckByUsername(String username)
    {
        boolean existe = false;
        for(Radcheck radcheck :findAllRadchecks())
        {
            if(radcheck.getUsername().equalsIgnoreCase(username))
            {
                existe = true;
            }
        }
        return existe;
    }
}
