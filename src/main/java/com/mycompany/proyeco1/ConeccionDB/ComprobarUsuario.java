/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import java.sql.*;

/**
 *
 * @author Linda Monterroso
 */
public class ComprobarUsuario {

    public static final String tabla = "usuario";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    private static final String URL_MYSQL = "jdbc:mysql://localhost:3306/mymuebleria";
    private static final String baseDatos = "materiaprima";

    public static boolean ExisteUsusario(String nombre) throws SQLException {
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }

        PreparedStatement query = connection.prepareStatement(String.format("SELECT * FROM %s WHERE Nombre = ?", tabla));
        query.setString(1, nombre);
        ResultSet resultado = query.executeQuery();

        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {

            }
        }

        return resultado.next();
    }

    public static boolean ComprobarContraseña(String nombre, String contraseña) throws SQLException {
        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }

        PreparedStatement query = connection.prepareStatement(String.format("SELECT * FROM %s WHERE Nombre = ? and contraseña = "+contraseña, tabla));
        query.setString(1, nombre);
        //query.setString(2, contraseña);
        ResultSet resultado = query.executeQuery();
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {

            }
        }

        return resultado.next();
    }

    public static int getTipo(String nombre, String contraseña) throws SQLException {
       Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }

        PreparedStatement query = connection.prepareStatement(String.format("SELECT * FROM %s Where Nombre = ?", tabla));
        query.setString(1, "\"" + nombre + "\"");
        ResultSet resultado = query.executeQuery();
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {

            }
        }

        while (resultado.next()) {

            if (resultado.getString("Contraseña").equals(contraseña)) {
                return resultado.getInt("Tipo");
            }
        }
        return 0;
    }

}
