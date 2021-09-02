

<%@page import="com.mycompany.proyeco1.ConeccionDB.ComprobarUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

    </head>
    <body>
        <script type="text/javascript">
            }
            if (<%ComprobarUsuario.ExisteUsusario(request.getParameter("Nombre"), request.getParameter("contraseña"));%>) {
                if (<%=request.getParameter("area").equals("fabrica")%> ) {
                    
                    alert("Secion iniciada");
                    document.fvalida.submit();
                }else (<%=request.getParameter("area").equals("Ventas")%>){
                        alert("Secion iniciada");
                        document.fvalida.submit();
                    } else{
                        alert("Secion iniciada");
                        document.fvalida.submit();
                    }
                } else {
                    console.log('No se envió el parámetro variable');
                }
            }
            else {
                alert("Usuario incorrecto")
            }
            //el formulario se envia
         
            }




        </script>



    </body>
</html>
<%%>
