<%-- 
    Document   : EliminarCantidadDeMateriaPrima
    Created on : 5 sep 2021, 4:13:16
    Author     : Linda Monterroso
--%>

<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../Css/tablas.css" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="eliminarCantidad">
                <label for="materiaPrima">Escribe la materia prima y la cantida que desea Eliminar: </label>

                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Tipo Materia Prima</label>
                    </div>
                    <div class="col-75">
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

                    </div>
                </div>

                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Escribe el tipo de materia prima de la lista de arriba a la cual deseas Eliminar: </label>
                        <label for="Tipo">Tipo</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="tipo" name="tipo" placeholder="Tipo">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="cantidad">Cantidad</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="cantidad" name="cantidad" placeholder="Cantidad">
                    </div>
                </div>
                <div class="row">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Eliminar de la base de Datos</button>
                </div>
            </form>
        </div>
    </body>
</html>
