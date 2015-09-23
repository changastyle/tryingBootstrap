package daos;
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
}
