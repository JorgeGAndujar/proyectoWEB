package ejemplo12;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Crud {

    public static boolean insertarUsuario(Connection conexion, String nombre, String login, String clave) {
        boolean bandera = true;
        try {
            String query = "INSERT INTO Usuario (nombre,login,clave) \n"
                    + "VALUES (?, ?, AES_ENCRYPT(?,CONCAT(obtener_palabra_secreta(),'%')));";
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, login);
            ps.setString(3, clave);
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

    public static List<String[]> obtenerTodosUsuarios(Connection conexion) {
        List<String[]> usuarios_al = new ArrayList<>();
        try {
            String query = "SELECT idUsuario, nombre, login, CAST(AES_DECRYPT(clave,CONCAT(obtener_palabra_secreta(),'%')) AS CHAR)AS NOMBRECOLUMNA FROM Usuario";
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            String[] registro = new String[4];
            while (rs.next()) {
                registro[0] = rs.getInt("idUsuario") + "";
                registro[1] = rs.getString("nombre");
                registro[2] = rs.getString("login");
                registro[3] = rs.getString("NOMBRECOLUMNA");
                usuarios_al.add(registro);
            }
        } catch (SQLException e) {
            usuarios_al = null;
        }
        return usuarios_al;
    }
}
