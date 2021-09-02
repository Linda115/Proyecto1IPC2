<%-- 
    Document   : EliminarMateriaPrima
    Created on : 29 ago 2021, 23:09:50
    Author     : Linda Monterroso
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Materia Prima</title>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="Registrar">
                <label for="materiaPrima">Selecciona la materia prima que deseas eliminar del sistema</label>
                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Tipo Materia Prima</label>
                    </div>
                    <div class="col-75">
                        <select id="materiaPrima" class="custom-select d-block w-100" name="materiaPrima">
                            <option selected>Tipos de materia prima</option>
                            <% List<String> lista = CadenaDeDatos.getDatosColumna("materiaprima", "Tipo");
                                for (String cadena : lista) {%>
                            <option value "<%=cadena%>" > <%=cadena%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Eliminar de la base de Datos</button>
                </div>
            </form>
        </div>

    </body>
</html>
