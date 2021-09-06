<%-- 
    Document   : respuestaAccion
    Created on : 27 ago 2021, 22:14:19
    Author     : Linda Monterroso
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%!String result = "";
    String mensajeError = "";
    boolean hayError = false;
%>
<%
    result = request.getParameter("result");
    mensajeError = request.getParameter("errorMsg");
    hayError = Boolean.valueOf(request.getParameter("error"));
    
    pageContext.setAttribute("bandera", hayError);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Resultado</h1>
                    <%  if (mensajeError != null) {
                            if (mensajeError.length() == 0) {
                    %>
                    <h2>El resultado es <%=result%></h2>
                    <% } else {%>
                    <h2>Hay un error:</h2>
                    <p><%=mensajeError%></p>
                    <%
                            }
                        }else{%>
                        <h2>Hay un error:</h2>
                        <p>El mensaje de error es nulo</p><%

}
                    %>


                    <a class="btn btn-outline-primary" href="../index.html">Regresar!</a>
                </div>
            </div>
        </div>
    </body>
</html>
