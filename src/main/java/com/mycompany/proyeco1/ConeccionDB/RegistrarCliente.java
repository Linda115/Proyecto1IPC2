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
@WebServlet(name = "RegistrarUsuario", urlPatterns = "/JSP/RegistrarCliente")
public class RegistrarCliente extends HttpServlet {

    private static final String USER = "root2";
    private static final String PASSWORD = "Root123456";
    private static final String URL_MYSQL = "jdbc:mysql://localhost:3308/mymuebleria";
    private static final String baseDatos = "clientes";

    public static Connection getConection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
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
        Connection coneccion = getConection();

        try {
            if (request.getParameter("Departamento") != null) {
                if (request.getParameter("Municipio") != null) {
                    PreparedStatement insert = coneccion
                            .prepareStatement(String.format(
                                    "INSERT INTO %s (Nit, Nombre, Direccion,Departamento,Municipio) VALUES(?,?,?,?,?)", baseDatos
                            ));
                    String nombre = request.getParameter("Nombre");
                    String direccion = request.getParameter("direccion");
                    int nit = Integer.valueOf(request.getParameter("nit"));
                    String departamento = request.getParameter("departamento");
                    String municipio = request.getParameter("municipio");
                    insert.setInt(1, nit);
                    insert.setString(2, nombre);
                    insert.setString(3, direccion);
                    insert.setString(4, departamento);
                    insert.setString(5, municipio);

                    insert.executeUpdate();
                } else{
                    response.sendRedirect(String.format("respuestaAccion.jsp?result=&mensaje-error=%s&error=true", "Hay departamento pero no municipio con lo cual no se puede realizar la inscripcion"));
                }
            }else{
                PreparedStatement insert = coneccion
                            .prepareStatement(String.format(
                                    "INSERT INTO %s (Nit, Nombre, Direccion) VALUES(?,?,?)", baseDatos
                            ));
                    String nombre = request.getParameter("Nombre");
                    String direccion = request.getParameter("direccion");
                    int nit = Integer.valueOf(request.getParameter("nit"));
                    insert.setInt(1, nit);
                    insert.setString(2, nombre);
                    insert.setString(3, direccion);

                    insert.executeUpdate();
            }

            response.sendRedirect(String.format("respuestaAccion.jsp?result=%s&errorMsg=&error=false", "hecho"));

        } catch (SQLException e) {
            System.out.println(e);
            response.sendRedirect(String.format("respuestaAccion.jsp?result=&mensaje-error=%s&error=true", e.getMessage()));

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
