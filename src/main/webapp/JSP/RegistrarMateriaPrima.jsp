<%-- 
    Document   : RegistrarMateriaPrima
    Created on : 24 ago 2021, 17:31:56
    Author     : Linda Monterroso
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.proyeco1.ConeccionDB.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <title>Registrar Materia Prima</title>
        <link rel="stylesheet" href="../Css/opMateriaPrima.css" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="registrar">
                <label for="materiaPrima">Escribe la materia prima y la cantida que desea registrar: </label>

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
                        <label for="materiaPrima">Escribe el tipo de materia prima de la lista de arriba a la cual deseas agregar: </label>
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
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Registra  a base de Datos</button>
                </div>
            </form>
        </div>

    </body>
</html>
