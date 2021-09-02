/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Linda Monterroso
 */
@WebServlet(name = "InscribirDatos", urlPatterns = "/ensamblar")
public class PostEnsamble extends HttpServlet {
    
     
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("Mueble");
        System.out.println(tipo+"tipo mateia ");
        
        response.sendRedirect(String.format("TablaEnsambleDePiezas.jsp?result=%s", tipo));      
    }
    
}
