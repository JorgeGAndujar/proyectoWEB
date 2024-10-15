package ejemplo15;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OperacionesCrud {

    public static boolean insertarProducto(Connection conexion,
            String nombre,
            String marca,
            String modelo,
            double precio,
            String pantalla,
            String resolucion) {
        boolean bandera = false;  // Inicializar como false para asumir el fallo en caso de error
        PreparedStatement ps = null;

        try {
            // Crear el JSON correctamente con el punto como separador decimal
            String json = "{\"nombre\":\"" + nombre
                    + "\", \"marca\":\"" + marca
                    + "\", \"modelo\":\"" + modelo
                    + "\", \"precio\":" + precio
                    + ", \"pantalla\":\"" + pantalla
                    + "\", \"resolucion\":\"" + resolucion
                    + "\"}";
            // Query para insertar en la tabla Producto
            String query = "INSERT INTO Producto(nombre, detalles) VALUES (?, ?::jsonb)";

            // Preparar el statement
            ps = conexion.prepareStatement(query);

            // Asignar los valores a los parámetros
            ps.setString(1, nombre);
            ps.setString(2, json);

            // Ejecutar la consulta
            int filaAfectada = ps.executeUpdate();

            // Si se afectó al menos una fila, el insert fue exitoso
            if (filaAfectada > 0) {
                bandera = true;  // Operación exitosa
            }

        } catch (SQLException e) {
            e.printStackTrace();  // Mostrar la excepción en la consola
        } finally {
            // Cerrar el PreparedStatement para evitar fugas de recursos
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return bandera;
    }

    public static List<String> mostrarProductos(Connection conexion) {
        List<String> productos_al = new ArrayList<>();
        try {
            String query = "SELECT nombre, detalles FROM Producto";
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String nombre = rs.getString("nombre");
                String detalles = rs.getString("detalles");

      

                // Agregar el array a la lista
                productos_al.add(nombre);
                productos_al.add(detalles);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Imprimir error para saber qué ha pasado
            productos_al = null;  // Retornar null en caso de error
        }
        return productos_al;
    }

}
