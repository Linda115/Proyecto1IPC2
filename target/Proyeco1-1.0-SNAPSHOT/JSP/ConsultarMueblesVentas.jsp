<%-- 
    Document   : ConsultarMueblesVentas
    Created on : 31 ago 2021, 0:16:58
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
        <title>Consulta de muebles a la venta</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    </head>
    <body>
        <h1>Muebles en Venta</h1>
        <form method="POST" action="ensamblar">
            <table id="customers">
                <tr>
                    <th>Nombre</th>
                    <th>Cantidad</th>

                </tr>
                <%ResultSet result = CadenaDeDatos.getTabla("mueblesventa");
                    if (result != null) {
                        while (result.next()) {%>
                <tr>
                    <td><%=result.getString("Nombre")%></td>
                    <td><%=result.getString("Cantidad")%></td>

                </tr>
                <%}
                    }%>
                </div>
                <div class="row">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Ensamblar mueble y registrarlo a la sala de ventas</button>
                </div>
            </table>
        </form>
    </body>
</html>
