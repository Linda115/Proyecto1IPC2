/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Linda Monterroso
 */
@WebServlet(name = "InscribirDatos", urlPatterns = "/inscribir")
public class PostInscribirDatos extends HttpServlet {

    private static final String USER = "root";
    private static final String PASSWORD = "";
    private static final String URL_MYSQL = "jdbc:mariadb://localhost:3307/mimuebleria";
    private static final String baseDatos = "materiaprima";

    public static Connection getConection(){
        Connection connection = null;

        try{
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");
            
        } catch(ClassNotFoundException | SQLException e){
            System.out.print(e);
        }
        return connection;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection coneccion = PostInscribirDatos.getConection();
        
            
        try {
            PreparedStatement insert = coneccion
                    .prepareStatement(String.format(
                            "INSERT INTO %s (Tipo, Costo, Cantidad) VALUES(?,?,?)", baseDatos
                    ));
            String tipo = request.getParameter("tipo");
            float costo = Float.parseFloat(request.getParameter("costo"));
            insert.setString(1, tipo);
            insert.setFloat(2, costo);
            insert.setInt(3, 0);

            insert.executeUpdate();
            
            response.sendRedirect(String.format("respuestaAccion.jsp?result=%s&errorMsg=&error=false", "hecho"));
            

        } catch (SQLException e) {
            response.sendRedirect(String.format("respuestaAccion.jsp?result=&errorMsg=%s&error=true", e.getMessage()));
            
            
        } finally {
            if (coneccion != null) {
                try {
                    coneccion.close();
                    
                } catch (SQLException ex) {

                }
            }
        }
    }
}

