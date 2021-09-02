/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Linda Monterroso
 */

@WebServlet(name = "RegistrarDatos", urlPatterns = "/Registrar")
public class RegistrarMateriaPrima extends HttpServlet {
    
    private static final String USER = "root";
    private static final String PASSWORD = "";
    private static final String URL_MYSQL = "jdbc:mariadb://localhost:3307/mimuebleria";
    private static final String baseDatos = "materiaprima";
    private static final String cantidadCadena = "cantidad";
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
        try {
            PreparedStatement insert = connection
                    .prepareStatement(String.format(
                            "UPDATE %s SET Cantidad = ? WHERE  Tipo = \"?\"", baseDatos
                    ));
            int cantidad = Integer.valueOf(request.getParameter("cantidad"));
            String tipo = request.getParameter("materiaPrima");
            insert.setInt(1, cantidad);
            insert.setString(2, tipo);

            insert.executeUpdate();
            
            response.sendRedirect(String.format("JSP/respuestaAccion.jsp?result=%s&errorMsg=&error=false", "hecho"));
            

        } catch (SQLException e) {
            response.sendRedirect(String.format("JSP/respuestaAccion.jsp?result=&errorMsg=%s&error=true", e.getMessage()));
               
        } 
    }
    
    
    
}
