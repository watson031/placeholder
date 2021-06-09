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
import model.entities.User;
import model.services.DBConnectionHelper;

/**
 *
 * @author waugusti
 */
public class UserManager {

    private static String queryAddUser = "insert into users(first_name,last_name,email,password,telephone,address) values (?,?,?,?,?,?)";
    private static String queryReadUser = "SELECT * FROM users WHERE email like ? and password like ?";
    private static String queryGetAll = "SELECT * FROM users";

    public static boolean createUser(User userToAdd) {
        Boolean userCreated = false;
        int retour = 0;
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryAddUser);

        try {
            preparedStatement.setString(1, userToAdd.getFirstName());
            preparedStatement.setString(2, userToAdd.getLastName());
            preparedStatement.setString(3, userToAdd.getEmail());
            preparedStatement.setString(4, userToAdd.getPassword());
            preparedStatement.setString(5, userToAdd.getTelephone());
            preparedStatement.setString(6, userToAdd.getAddress());
            retour = preparedStatement.executeUpdate();
            DBConnectionHelper.closeConnection();
            userCreated = true;
        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userCreated;
    }

    public static User readUser(String email, String password) {
        User user = null;
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryReadUser);
        try {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.isBeforeFirst()) {
                user = new User();
                while (resultSet.next()) {

                    user.setId(resultSet.getInt("id"));
                    user.setFirstName(resultSet.getString("first_name"));
                    user.setLastName(resultSet.getString("last_name"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(resultSet.getString("password"));
                    user.setTelephone(resultSet.getString("telephone"));
                    user.setAddress(resultSet.getString("address"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        DBConnectionHelper.closeConnection();

        return user;
    }

    public static ArrayList<User> getAll() {
        ArrayList<User> users = null;
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryGetAll);

        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.isBeforeFirst()) {
                users = new ArrayList<>();
                while (resultSet.next()) {
                    User user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setFirstName(resultSet.getString("first_name"));
                    user.setLastName(resultSet.getString("last_name"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(resultSet.getString("password"));
                    user.setTelephone(resultSet.getString("telephone"));
                    user.setAddress(resultSet.getString("address"));
                    users.add(user);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        DBConnectionHelper.closeConnection();

        return users;
    }

    public static boolean isEmailUnique(String email) {
        boolean isEmail = false;
        ArrayList<User> users = UserManager.getAll();

        if (users != null) {
            for (User user : users) {
                if (user.getEmail().equals(email)) {
                    isEmail = true;
                }
            }
        }

        return isEmail;
    }

    public static boolean isPasswordMatch(String password, String confirmPassword) {
        boolean isMatch = false;

        if (password.equals(confirmPassword)) {
            isMatch = true;
        }

        return isMatch;
    }

}
