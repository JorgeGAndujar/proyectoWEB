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

    public static boolean eliminarProductos(Connection conexion, String nombreProducto) {
        boolean bandera = true;
        try {
            String query = "DELETE FROM Producto WHERE nombre = ?";
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, nombreProducto);
            int filaAfectada = ps.executeUpdate();

            if (filaAfectada > 0) {
                bandera = true;
            } else {
                bandera = false;
            }
        } catch (SQLException e) {
            bandera = false;
        }
        return bandera;
    }
    public static boolean actualizarProductos(Connection conexion, String nombreN, String marcaN, String modeloN, double precioN, String pantallaN, String resolucionN, String nombreCondicion) {
    boolean bandera = false; // Cambié el valor inicial a false
    try {
        // Consulta SQL de actualización
        String query = "UPDATE Producto SET nombre = ?, marca = ?, modelo = ?, precio = ?, pantalla = ?, resolucion = ? WHERE nombre = ?";
        PreparedStatement ps = conexion.prepareStatement(query);

        // Asignar valores a los parámetros
        ps.setString(1, nombreN);
        ps.setString(2, marcaN);
        ps.setString(3, modeloN);
        ps.setDouble(4, precioN);
        ps.setString(5, pantallaN);
        ps.setString(6, resolucionN);
        ps.setString(7, nombreCondicion); // Para la condición del WHERE

        // Ejecutar actualización
        int filasAfectadas = ps.executeUpdate();

        // Verificar si se actualizó alguna fila
        if (filasAfectadas > 0) {
            bandera = true;
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Imprime la excepción para depuración
        bandera = false;
    }
    return bandera;
}


}
