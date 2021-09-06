<%-- 
    Document   : ObtenerDatosRegistroVentas
    Created on : 31 ago 2021, 11:44:01
    Author     : Linda Monterroso
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!String Nombre = "";
    String nit = "";
    String Direccion = "";
    String Departamento = "";
    String Municipio = "";
    boolean hayError;
%>
<%
    Nombre = request.getParameter("nombre");
    nit = request.getParameter("nit");
    Direccion = request.getParameter("direccion");
    Departamento = request.getParameter("departamento");
    Municipio = request.getParameter("municipio");

    hayError = Boolean.valueOf(request.getParameter("hay-error"));

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear factura</title>
    </head>
    <body>
        <% if (hayError==false) {%>
        <h1>Creando Factura</h1>
        <<div class="container">
            <table id="customers">
                <tr>
                    <th>Nombre</th>
                    <th><%=Nombre%></th>
                </tr>
                <tr>
                    <th>NIT</th>
                    <th><%=nit%></th>
                </tr>
                <tr>
                    <th>Direccion</th>
                    <th><%=Direccion%></th>
                </tr>
                <%if (Departamento != null) {%>
                <tr>
                    <th>Departamento</th>
                    <th><%=Departamento%></th>
                </tr>
                <%}%>
                <%if (Municipio != null) {%>
                <tr>
                    <th>Municipio</th>
                    <th><%=Municipio%></th>
                </tr>
                <%}%>
        
            </table>
        </div>
        <form  method="POST" action="RegistrarUsuario">
            <label >Escriba los caracteres de la venta</label>               
            <div class="row">
                <div class="col-25">
                    <label for="mueble">Tipo De Mueble</label>
                </div>
                <div class="col-75">
                    <input type="number" id="NIT" name="NIT" placeholder="NIT" required>
                </div>
            </div>               

            <div class="row">
                <button type="submit" class="btn btn-primary btn-lg btn-block">Buscar</button>
            </div>
        </form>
        </div>
        <%} else {%>
        <h1>No existe el cliente con ese NIT</h1>
        <form  method="POST" action="RegistrarCliente.jsp">
             <div class="row">
                <button type="submit" class="btn btn-primary btn-lg btn-block">Registrar cliente a la base de datos</button>
            </div>
        </form> 
        <%}%>
    </body>
</html>
