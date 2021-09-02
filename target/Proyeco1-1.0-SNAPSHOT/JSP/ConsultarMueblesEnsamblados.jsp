<%-- 
    Document   : ConsultarMuebles
    Created on : 31 ago 2021, 0:11:47
    Author     : Linda Monterroso
--%>

<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! boolean menorMayor = false;
    boolean mayorMenor = false;
    boolean ordenar = false;
%>
<%
    menorMayor = Boolean.valueOf(request.getParameter("menor-mayor"));
    mayorMenor = Boolean.valueOf(request.getParameter("mayor-menor"));
    ordenar = Boolean.valueOf(request.getParameter("orden"));

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">        
        <title>Muebles ensamblados</title>
    </head>
    <body>
        <h1>Muebles Ensamblados</h1>

        <div class="row">
            <table id="customers">
                <tr>
                    <th>Fecha</th>
                    <th>Usuario</th>
                    <th>Costo</th>
                    <th>ID</th>
                    <th>Tipo de mueble</th>
                </tr>
                <%ResultSet result = null;
                    if (ordenar == false) {
                        result = CadenaDeDatos.getTabla("ensamblemueble");
                        while (result.next()) {%>
                <tr>
                    <td><%=result.getString("Fecha")%></td>
                    <td><%=result.getString("Usuario")%></td>
                    <td><%=result.getString("Costo")%></td>
                    <td><%=result.getString("ID")%></td>
                    <td><%=result.getString("Tipo")%></td>
                </tr>
                <%}%>
                <%} else {
                    if (menorMayor) {%>
                result = CadenaDeDatos.getTablaASC("ensamblemueble","Fecha");
                while(result.next()){%>
                <tr>
                    <td><%=result.getString("Fecha")%></td>
                    <td><%=result.getString("Usuario")%></td>
                    <td><%=result.getString("Costo")%></td>
                    <td><%=result.getString("ID")%></td>
                    <td><%=result.getString("Tipo")%></td>
                </tr>
                <%}%>
                <%}
                    if (mayorMenor) {%>
                result = CadenaDeDatos.getTablaDESC("ensamblemueble","Fecha");
                while(result.last()){%>
                <tr>
                    <td><%=result.getString("Fecha")%></td>
                    <td><%=result.getString("Usuario")%></td>
                    <td><%=result.getString("Costo")%></td>
                    <td><%=result.getString("ID")%></td>
                    <td><%=result.getString("Tipo")%></td>
                </tr>
                <%}%>
                <form method="POST" action="ConsultarMueblesEnsamblados.jsp?menor-mayor=false&mayor-menor=true&orden=trueRegistrar">
                    <div class="row">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Ordenar Mayor a Menor</button>
                    </div> 
                </form>
                <form method="POST" action="ConsultarMueblesEnsamblados.jsp?menor-mayor=true&mayor-menor=false&orden=trueRegistrar">
                    <div class="row">
                        <button type="submit"  class="btn btn-primary btn-lg btn-block">Ordenar Menor a Mayor</button>
                    </div>
                </form>
            </table>
        </div>

    </body>
</html>
