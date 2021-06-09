/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.managers;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.entities.Item;
import model.entities.Order;
import model.entities.Product;
import model.services.DBConnectionHelper;

/**
 *
 * @author abrossea
 */
public class OrderManager {

    private static String queryCreateOrder = "insert into orders(id, user_id, order_date) values (?, ?, ?)";
    private static String queryCreateOrderList = "insert into order_list(order_id, prod_id, quantity) values (?, ?, ?)";

    public static boolean createOrder(Order order, HashMap<Integer, Item> cart) {
        int modifLines = 0;
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryCreateOrder);

        try {
            preparedStatement.setInt(1, order.getId());
            preparedStatement.setInt(2, order.getUserId());
            preparedStatement.setString(3, String.valueOf(order.getDateTime()));
            modifLines = preparedStatement.executeUpdate();
            DBConnectionHelper.closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        createOrderList(order, cart);
        return modifLines > 0;
    }

    public static boolean createOrderList(Order order, HashMap<Integer, Item> cart) {
        int modifLines = 0;

        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryCreateOrderList);
        
        try {
            for (HashMap.Entry<Integer, Item> pair : cart.entrySet()) {
                Product prod = ProductManager.getById(pair.getValue().getId());
                ProductManager.modifyStock((prod.getStock() - pair.getValue().getQty()), pair.getValue().getId());
                
                preparedStatement.setInt(1, order.getId());
                preparedStatement.setInt(2, pair.getValue().getId());                
                preparedStatement.setInt(3, pair.getValue().getQty());
                modifLines = preparedStatement.executeUpdate();
            }
            DBConnectionHelper.closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        return modifLines > 0;
    }

    public static int generateOrderNo() {
        Random random = new Random();
        return random.ints(1, (10000 + 1)).findFirst().getAsInt();
    }
}
