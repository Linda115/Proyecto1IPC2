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
public class EliminarMateriaPrimaDB {

    private static final String USER = "root";
    private static final String PASSWORD = "";
    private static final String URL_MYSQL = "jdbc:mysql://localhost:3306/mymuebleria";
    private static final String baseDatos = "materiaprima";
 
    
    public static boolean Delete(String tipo) {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
         
            
            PreparedStatement insert = connection
                    .prepareStatement(String.format(
                            "Delete FROM %s WHERE Tipo = ?", baseDatos
                    ));
            insert.setString(1, tipo);

            insert.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {

                }
            }
        }
        return false;
    }
    
    public static boolean DeletePIEZAS(String tipo, int cantidad) {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            
            PreparedStatement insert = connection
                    .prepareStatement(String.format(
                            "UPDATE %s SET Cantidad = \"?\" WHERE Tipo = \"?\"", baseDatos
                    ));
            insert.setInt(1,(CadenaDeDatos.getDatoColumna(baseDatos, "Cantidad", tipo, "Tipo")-cantidad));
            insert.setString(1, tipo);

            insert.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {

                }
            }
        }
        return false;
    }
}
