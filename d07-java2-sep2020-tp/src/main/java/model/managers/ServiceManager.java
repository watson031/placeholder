/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.managers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.entities.Service;
import model.services.DBConnectionHelper;

/**
 *
 * @author Alex
 */
public class ServiceManager {
    private static String queryGetAll = "SELECT * FROM services";
    private static ArrayList<Service> services;
    
    public static ArrayList<Service> getAll() {
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryGetAll);
        try {
            services = null;
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.isBeforeFirst()) {
                services = new ArrayList<>();
                while (resultSet.next()) {                    
                    Service s = new Service();
                    s.setId(resultSet.getInt("id"));
                    s.setName(resultSet.getString("name"));
                    s.setPrice(resultSet.getDouble("price"));
                    s.setDelay(resultSet.getString("delay"));
                    services.add(s);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        DBConnectionHelper.closeConnection();

        return services;
    }
}
