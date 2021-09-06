<%-- 
    Document   : ConsultaMateriaPrima
    Created on : 30 ago 2021, 23:58:04
    Author     : Linda Monterroso
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Materia Prima</title>
        <link rel="stylesheet" href="../Css/tablas.css" type="text/css"/>
    </head>
    <body>
        <h1>Materia Prima</h1>
        <form method="POST" action="ensamblar">
            <table id="customers">
                <tr>
                    <th>Tipo de pieza</th>
                    <th>Costo</th>
                    <th>Cantidad</th>
                </tr>
                <%ResultSet result = CadenaDeDatos.getTabla("materiaprima");
                    while (result.next()) {%>
                <tr>
                    <td><%=result.getString("Tipo")%></td>
                    <td><%=result.getString("Precio")%></td>
                    <td><%=result.getString("Cantidad")%></td>
                </tr>
                <%}%>

                
            </table>
        </form>
    </body>
</html>
