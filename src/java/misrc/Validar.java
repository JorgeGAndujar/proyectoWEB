
package misrc;

public class Validar {
     
    public static boolean edad(String edad){
        String er = "[0-9]+";
        boolean correcto = edad.matches(er);
        return correcto;
    }
}
