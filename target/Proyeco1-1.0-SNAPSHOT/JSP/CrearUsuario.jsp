<%-- 
    Document   : CrearUsuario
    Created on : 31 ago 2021, 0:19:56
    Author     : Linda Monterroso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="Css/opMateriaPrima.css" type="text/css"/>
    </head>
    <body>
        <<div class="container">

            <form  method="POST" action="RegistrarUsuario">
                <label >Escriba los caracteres del nuevo usuario a crear</label>               
                <div class="row">
                    <div class="col-25">
                        <label for="Nombre">Nombre</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="Nombre" name="Nombre" placeholder="Nombre" required>
                    </div>
                </div>               
                <div class="row">
                    <div class="col-25">
                        <label for="contrasena">Contraseña</label>
                    </div>
                    <div class="col-75">
                        <input type="text"  id="contrasena" name="contrasena" placeholder="Contraseña" required>
                    </div>

                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="area">Tipo 1. Area de fabrica/2. area de ventas/3. area de administracion</label>
                    </div>
                    <div class="col-75">
                        <input type="number"  id="area" name="area" placeholder="Area" required>
                    </div>

                </div>
                <div class="row">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Registra  a base de Datos</button>
                </div>
            </form>
        </div>
    </body>
</html>
