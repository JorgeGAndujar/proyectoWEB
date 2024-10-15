
package ejemplo15;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OperacionesCrud {
    public static boolean insertarProducto(Connection conexion, 
            String nombre, 
            String marca, 
            String modelo,
            double precio,
            String pantalla,
            String resolucion) {
        boolean bandera = true;
        try {
            //"{\"nombre\":" + nombre + "\"marca\":" + marca + "\"modelo\":" + modelo + "}"
            String json = "{\"nombre\":" + nombre + "\"marca\":" + marca + "\"modelo\":" + modelo + "}";
            String query = "INSERT INTO Producto(nombre,detalle)VALUES(?,?::jsonb)";
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, json);
            int numero = ps.executeUpdate();
            if (numero > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            bandera = false;
        }
        return bandera;
    }
}
