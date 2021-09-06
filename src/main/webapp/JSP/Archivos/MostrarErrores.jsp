<%-- 
    Document   : MostrarErrores
    Created on : 6 sep 2021, 6:06:13
    Author     : Linda Monterroso
--%>

<%!String errores = "";

%>
<%
    errores = request.getParameter("errores");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Errores al leer el archivo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="../Css/index.css" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <label for="materiaPrima"><%=errores%> </label>
        </div>
    </body>
</html>
