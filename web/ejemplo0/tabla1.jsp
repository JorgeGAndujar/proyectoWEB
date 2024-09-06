<%-- 
    Document   : tabla1
    Created on : 6 sept 2024, 9:25:02
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="estilo.css"/>
        <%--
        <style>
           
        </style>
        --%>
    </head>
    <body>
       
        <div style="text-align: center">
             <h1>TABLA DE MULTIPLICAR CON JSP</h1>
             <table border="1" cellspacing="5" cellpadding="5">

                <tbody>
                    <%
                        for (int i = 2; i <= 12; i++) {
                            for (int j = 1; j <= 12; j++) {
                    %>
                    <%--     
                    <%=i + "X" + j + "=" + (i*j)%><br>
                    --%>

                <input type="text" value="<%=i%>"/>
                <input type="text" value="X"/>
                <input type="text" value="<%=j%>"/>
                <input type="text" value="="/>
                <input type="text" value="<%=i * j%>"/><br>

                       <%-- 
                        <tr>
                           <td><%=i%></td>
                           <td>x</td>
                           <td><%=j%></td>
                           <td>=</td>
                           <td><%= i * j%></td>
                       </tr>
                       --%>
                       <%
                               }
                           }
                       %>
                       </tbody>
                   </table>
              </div>



           </body>
          </html>
