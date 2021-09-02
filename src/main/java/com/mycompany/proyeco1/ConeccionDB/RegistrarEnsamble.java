/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Linda Monterroso
 */
public class RegistrarEnsamble {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("Mueble");
        System.out.println(tipo+"tipo mateia ");
        
        
        EliminarMateriaPrimaDB.DeletePIEZAS(tipo, 0);
        response.sendRedirect(String.format("TablaEnsambleDePiezas.jsp?result=%s", tipo));      
    }
}
