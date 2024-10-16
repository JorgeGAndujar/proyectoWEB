
package examen;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

public class ServletExamen extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Connection conexion = ConexionMysqlBD_CadenaAgencias.obtenerConexion();
            if (conexion != null) {
                out.println("OK:CONEXION"); 
                String query = "SELECT h.nombre AS nombreHotel, COUNT(th.turista_codigoTurista) AS cantidadTuristas " +
                               "FROM hotel h " +
                               "JOIN turista_has_hotel th ON h.codigoHotel = th.hotel_codigoHotel " +
                               "GROUP BY h.nombre;";
                try {
                    PreparedStatement ps = conexion.prepareStatement(query);
                    ResultSet rs = ps.executeQuery();
                    
                    // Comienza a recorrer el ResultSet
                    out.println("<table border='1'>");
                    out.println("<tr><th>Nombre del Hotel</th><th>Cantidad de Turistas</th></tr>");
                    while (rs.next()) {
                        String nombreHotel = rs.getString("nombreHotel");
                        int cantidadTuristas = rs.getInt("cantidadTuristas");
                        
                        // Imprimir los resultados en una tabla HTML
                        out.println("<tr><td>" + nombreHotel + "</td><td>" + cantidadTuristas + "</td></tr>");
                    }
                    out.println("</table>");
                    
                    // Cerrar el ResultSet y PreparedStatement
                    rs.close();
                    ps.close();
                } catch(SQLException e) {
                    out.println("ERROR: QUERY - " + e.getMessage());
                }
            } else {
                out.println("ERROR: CONEXION");
            }
            
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

