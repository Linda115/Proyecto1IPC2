<%-- 
    Document   : ConsultarMuebles
    Created on : 5 sep 2021, 23:46:00
    Author     : Linda Monterroso
--%>

<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar muebles del sistema</title>
        <link rel="stylesheet" href="../Css/tablas.css" type="text/css"/>
    </head>
    <body>
        <h1>Materia Prima</h1>
        <form method="POST" action="ensamblar">
            <table id="customers">
                <tr>
                    <th>Tipo/Nombre mueble</th>
                    <th>Costo</th>
                </tr>
                <%ResultSet result = CadenaDeDatos.getTabla("mueble");
                    while (result.next()) {%>
                <tr>
                    <td><%=result.getString("Nombre")%></td>
                    <td><%=result.getString("Precio")%></td>
                </tr>
                <%}%>

                
            </table>
        </form>
    </body>
</html>
