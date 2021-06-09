/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author abrossea
 */
public class DBConnectionHelper {

    private static String connString = "jdbc:mariadb://localhost:3315/dbstore";
    private static String username = "root";
    private static String password = "abc123...";
    private static Connection connection;

    public static PreparedStatement getConnection(String query) {
        PreparedStatement returnStatement = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(connString, username, password);
            returnStatement = connection.prepareStatement(query);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnectionHelper.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnectionHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return returnStatement;
    }

    public static void closeConnection() {
        try {
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnectionHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
