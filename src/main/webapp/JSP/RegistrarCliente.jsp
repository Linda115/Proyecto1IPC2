<%-- 
    Document   : RegistrarUsuario
    Created on : 2 sep 2021, 21:17:14
    Author     : Linda Monterroso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Cliente</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="Css/opMateriaPrima.css" type="text/css"/>
    </head>
    <body>
        <h1>Registrar Cliente</h1>

        <form action="RegistrarCliente" method="POST">
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre" placeholder="Nombre...">

            <label for="nit">Nit</label>
            <input type="number" id="nit" name="nit" placeholder="Nit...">

            <label for="direccion">Dirección</label>
            <input type="text" id="direccion" name="direccion" placeholder="Dirección...">

            <label for="departamento">Departamento</label>
            <input type="text" id="departamento" name="departamento" placeholder="Departamento...">
           
            <label for="municipio">Municipio</label>
            <input type="text" id="municipio" name="municipio" placeholder="Municipio...">
            
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
