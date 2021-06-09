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
import model.entities.Category;
import model.services.DBConnectionHelper;

/**
 *
 * @author abrossea
 */
public class CategoryManager {

    private static String queryGetCategories = "SELECT * FROM categories";
    private static String getNavBar = "SELECT * FROM categories LIMIT 6";
    private static ArrayList<Category> categories;

    static {
        categories = null;
    }

    public static ArrayList<Category> getCategories() {
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryGetCategories);
        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.isBeforeFirst()) {
                categories = new ArrayList<>();
                while (resultSet.next()) {
                    Category c = new Category();
                    c.setId(resultSet.getInt("id"));
                    c.setDescription(resultSet.getString("description"));
                    c.setImg_url(resultSet.getString("img_url"));
                    categories.add(c);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        DBConnectionHelper.closeConnection();

        return categories;
    }
    
    public static ArrayList<Category> getNavBar() {
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(getNavBar);
        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.isBeforeFirst()) {
                categories = new ArrayList<>();
                while (resultSet.next()) {
                    Category c = new Category();
                    c.setId(resultSet.getInt("id"));
                    c.setDescription(resultSet.getString("description"));
                    c.setImg_url(resultSet.getString("img_url"));
                    categories.add(c);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        DBConnectionHelper.closeConnection();

        return categories;
    }
}
