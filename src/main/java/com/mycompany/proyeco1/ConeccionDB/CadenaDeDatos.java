/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import java.sql.*;
import java.util.*;

/**
 *
 * @author Linda Monterroso
 */
public class CadenaDeDatos {

    /**
     *
     * @param NombreTabla
     * @param NombreColumna
     * @return
     */
    private static final String USER = "administradorMuebe";
    private static final String PASSWORD = "admi2008";
    private static final String URL_MYSQL = "jdbc:mysql://localhost:3306/mymuebleria";
    private static final String baseDatos = "materiaprima";

    public static List<String> getDatosColumna(String NombreTabla, String NombreColumna) {
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }

        List<String> datos = new ArrayList<>();
        if (connection != null) {
            try {
                PreparedStatement recordQuery;
                recordQuery = connection
                        .prepareStatement(String.format("SELECT * FROM " + NombreTabla));
                ResultSet result = recordQuery.executeQuery();

                while (result.next()) {
                    datos.add(result.getString(NombreColumna));
                }

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException ex) {

                    }
                }
            }
        } else {
            System.out.println("La coneccion es nula ");
        }
        return datos;
    }

    public static ResultSet getTabla(String NombreTabla) {
        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
        ResultSet result = null;
        if (connection != null) {
            try {
                PreparedStatement recordQuery;
                recordQuery = connection
                        .prepareStatement(String.format("SELECT * FROM %s", NombreTabla));
                result = recordQuery.executeQuery();

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException ex) {

                    }
                }
            }
        } else {
            System.out.println("La coneccion es nula ");
        }
        return result;
    }

    public static ResultSet getTablaASC(String NombreTabla, String filaOrden) {
        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
        ResultSet result = null;
        if (connection != null) {
            try {
                PreparedStatement recordQuery;
                recordQuery = connection
                        .prepareStatement(String.format("SELECT * FROM %s ORDER BY ? ASC", NombreTabla));
                result = recordQuery.executeQuery();

                recordQuery.setString(1, filaOrden);

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException ex) {

                    }
                }
            }
        } else {
            System.out.println("La coneccion es nula ");
        }
        return result;
    }

    public static ResultSet getTablaDESC(String NombreTabla, String filaOrden) {
        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
        ResultSet result = null;
        if (connection != null) {
            try {
                PreparedStatement recordQuery;
                recordQuery = connection
                        .prepareStatement(String.format("SELECT * FROM %s ORDER BY ? DESC", NombreTabla));
                recordQuery.setString(1, filaOrden);
                result = recordQuery.executeQuery();


            } catch (SQLException e) {
                e.printStackTrace();
            } finally {

                try {
                    connection.close();
                } catch (SQLException ex) {

                }

            }
        } else {
            System.out.println("La coneccion es nula ");
        }
        return result;
    }

    public static ResultSet getTablaAgotada(String NombreTabla) {
        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
        ResultSet result = null;
        if (connection != null) {
            try {
                PreparedStatement recordQuery;
                recordQuery = connection
                        .prepareStatement(String.format("SELECT * FROM %s WHERE Cantidad<10", NombreTabla));
                result = recordQuery.executeQuery();

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException ex) {

                    }
                }
            }
        } else {
            System.out.println("La coneccion es nula ");
        }
        return result;
    }

    public static List<String> getDatosColumna(String NombreTabla, String NombreColumna, String NombreSegundaColumna) {
        List<String> datos = new ArrayList<>();
        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
        if (connection != null) {
            try {
                PreparedStatement recordQuery;
                recordQuery = connection
                        .prepareStatement(String.format("SELECT * FROM " + NombreTabla));
                ResultSet result = recordQuery.executeQuery();

                while (result.next()) {
                    datos.add(result.getString(NombreColumna));
                    datos.add(result.getString(NombreSegundaColumna));
                }

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {

                try {
                    connection.close();
                } catch (SQLException ex) {

                }

            }
        } else {
            System.out.println("La coneccion es nula ");
        }
        return datos;
    }

    public static List<String> getDatosColumna(String NombreTabla, String NombreColumna, String NombreSegundaColumna, String Condicional, String NombreCondicional) {
        List<String> datos = new ArrayList<>();
        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
        if (connection != null) {
            try {
                PreparedStatement recordQuery;
                recordQuery = connection
                        .prepareStatement(String.format("SELECT * FROM %s WHERE ? = \"?\"", NombreTabla));
                recordQuery.setString(1, NombreCondicional);
                recordQuery.setString(2, Condicional);

                ResultSet result = recordQuery.executeQuery();

                while (result.next()) {
                    datos.add(result.getString(NombreColumna));
                    datos.add(result.getString(NombreSegundaColumna));
                }

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {

                try {
                    connection.close();
                } catch (SQLException ex) {

                }

            }
        } else {
            System.out.println("La coneccion es nula ");
        }
        return datos;
    }

    public static int getDatoColumna(String NombreTabla, String NombreColumna, String Condicional, String NombreCondicional) {
        int resp = 0;
        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
        if (connection != null) {
            try {
                PreparedStatement recordQuery;
                recordQuery = connection
                        .prepareStatement(String.format("SELECT * FROM %s WHERE ? = \"?\"", NombreTabla));
                recordQuery.setString(1, NombreCondicional);
                recordQuery.setString(2, Condicional);

                ResultSet result = recordQuery.executeQuery();

                // while (result.next()) {
                resp = Integer.valueOf(result.getString(NombreColumna));
                //}

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {

                try {
                    connection.close();
                } catch (SQLException ex) {

                }

            }
        } else {
            System.out.println("La coneccion es nula ");
        }
        return resp;
    }

    public static ResultSet getDatosColumnaCondicional(String NombreTabla, String Condicional, String NombreCondicional) {
        int resp = 0;
        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
        ResultSet result = null;
        if (connection != null) {
            try {
                PreparedStatement recordQuery;
                recordQuery = connection
                        .prepareStatement(String.format("SELECT * FROM %s WHERE clientes = ?", NombreTabla));
                recordQuery.setString(1, NombreCondicional);
                recordQuery.setString(2, Condicional);

                result = recordQuery.executeQuery();

                

                // while (result.next()) {
                //}
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {

                try {
                    connection.close();
                } catch (SQLException ex) {

                }

            }
        } else {
            System.out.println("La coneccion es nula ");
        }
        return result;
    }
    
    public static ResultSet getDatosColumnaCondicional(String NombreTabla, long Condicional, String NombreCondicional) {
        int resp = 0;
        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.print("si entro");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
        ResultSet result = null;
        if (connection != null) {
            try {
                PreparedStatement recordQuery;
                recordQuery = connection
                        .prepareStatement(String.format("SELECT * FROM %s WHERE NIT = ?", NombreTabla));
                recordQuery.setLong(1, Condicional);

                result = recordQuery.executeQuery();

                

                // while (result.next()) {
                //}
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {

                try {
                    connection.close();
                } catch (SQLException ex) {

                }

            }
        } else {
            System.out.println("La coneccion es nula ");
        }
        return result;
    }

}
