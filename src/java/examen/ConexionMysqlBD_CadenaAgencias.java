
package examen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionMysqlBD_CadenaAgencias {
    
    public static Connection obtenerConexion(){
        String url = "jdbc:mysql://localhost:3307/BD_CadenaAgencias";
        String usuario = "root";
        String clave = "12345678";
        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException  | ClassNotFoundException e){
            conexion = null;
        }
        return conexion;
    }
}
