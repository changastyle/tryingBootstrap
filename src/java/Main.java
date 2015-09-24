
public class Main
{
    public static void main(String args[])
    {
        java.util.ArrayList<model.ModemRadx> arr = controller.Controller.findAllModemRadx();
        
        for(model.ModemRadx modem : arr)
        {
            System.out.println(modem.minimalToString());
        }
    }
}
