package controller;

import java.util.ArrayList;

public class Controller
{
    public static ArrayList<model.Radcheck> findAllRadchecks(){return daos.RadcheckDAO.findAllRadchecks();}
    public static ArrayList<model.Radcheck> findAllRadchecks(String orderBy){return daos.RadcheckDAO.findAllRadchecks(orderBy);}
}
