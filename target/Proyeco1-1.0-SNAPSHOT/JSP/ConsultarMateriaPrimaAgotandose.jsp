<%-- 
    Document   : ConsultarMateriaPrimaAgotandose
    Created on : 31 ago 2021, 10:32:34
    Author     : Linda Monterroso
--%>

<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar matera prima por agotarse o agotada</title>
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
                <%ResultSet result = CadenaDeDatos.getTablaAgotada("materiaprima");
                while(result.next()){%>
                <tr>
                    <td><%=result.getString("Tipo")%></td>
                    <td><%=result.getString("Costo")%></td>
                    <td><%=result.getString("Cantidad")%></td>
                </tr>
                <%}%>
                </div>
                <div class="row">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Regresar</button>
                </div>
            </table>
    </body>
</html>
