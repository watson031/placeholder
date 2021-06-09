/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.managers;

import controller.CategoryController;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.entities.Product;
import model.services.DBConnectionHelper;

/**
 *
 * @author abrossea
 */
public class ProductManager {

    private static final String queryGetAll = "SELECT * FROM products";
    private static final String queryGetByCategory = "SELECT * FROM products WHERE category_id = ?";
    private static final String queryGetById = "SELECT * FROM products WHERE id = ?";
    private static final String queryGetPromos = "SELECT * FROM products WHERE promo > 0";
    private static final String queryModifyStock = "UPDATE products SET stock = ? WHERE id = ?";
    
    private static ArrayList<Product> products;
    private static ArrayList<Product> promoProducts;
    private static Product product;

    public static ArrayList<Product> getAll() {
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryGetAll);
        try {
            products = null;
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.isBeforeFirst()) {
                products = new ArrayList<>();
                while (resultSet.next()) {
                    Product p = new Product();
                    p.setId(resultSet.getInt("id"));
                    p.setCategory(resultSet.getInt("category_id"));
                    p.setName(resultSet.getString("name"));
                    p.setStock(resultSet.getInt("stock"));
                    p.setPrice(resultSet.getDouble("price"));
                    p.setPromo(resultSet.getDouble("promo"));
                    p.setDescription(resultSet.getString("description"));
                    p.setSpec_1(resultSet.getString("spec_1"));
                    p.setSpec_2(resultSet.getString("spec_2"));
                    p.setSpec_3(resultSet.getString("spec_3"));
                    p.setSpec_4(resultSet.getString("spec_4"));
                    p.setSpec_5(resultSet.getString("spec_5"));
                    p.setImgUrl(resultSet.getString("img_url"));
                    products.add(p);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        DBConnectionHelper.closeConnection();

        return products;
    }

    public static ArrayList<Product> getByCategory(int categoryId) {
        products = null;
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryGetByCategory);
        try {
            preparedStatement.setInt(1, categoryId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.isBeforeFirst()) {
                products = new ArrayList<>();
                while (resultSet.next()) {
                    Product p = new Product();
                    p.setId(resultSet.getInt("id"));
                    p.setCategory(resultSet.getInt("category_id"));
                    p.setName(resultSet.getString("name"));
                    p.setStock(resultSet.getInt("stock"));
                    p.setPrice(resultSet.getDouble("price"));
                    p.setPromo(resultSet.getDouble("promo"));
                    p.setDescription(resultSet.getString("description"));
                    p.setSpec_1(resultSet.getString("spec_1"));
                    p.setSpec_2(resultSet.getString("spec_2"));
                    p.setSpec_3(resultSet.getString("spec_3"));
                    p.setSpec_4(resultSet.getString("spec_4"));
                    p.setSpec_5(resultSet.getString("spec_5"));
                    p.setImgUrl(resultSet.getString("img_url"));
                    products.add(p);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        DBConnectionHelper.closeConnection();

        return products;
    }

    public static Product getById(int productId) {
        product = null;
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryGetById);
        try {
            preparedStatement.setInt(1, productId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.isBeforeFirst()) {
                product = new Product();
                while (resultSet.next()) {
                    product.setId(resultSet.getInt("id"));
                    product.setCategory(resultSet.getInt("category_id"));
                    product.setName(resultSet.getString("name"));
                    product.setStock(resultSet.getInt("stock"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setPromo(resultSet.getDouble("promo"));
                    product.setDescription(resultSet.getString("description"));
                    product.setSpec_1(resultSet.getString("spec_1"));
                    product.setSpec_2(resultSet.getString("spec_2"));
                    product.setSpec_3(resultSet.getString("spec_3"));
                    product.setSpec_4(resultSet.getString("spec_4"));
                    product.setSpec_5(resultSet.getString("spec_5"));
                    product.setImgUrl(resultSet.getString("img_url"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        DBConnectionHelper.closeConnection();

        return product;
    }

    public static ArrayList<Product> getPromos() {
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryGetPromos);
        try {
            products = null;
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.isBeforeFirst()) {
                products = new ArrayList<>();
                while (resultSet.next()) {
                    Product p = new Product();
                    p.setId(resultSet.getInt("id"));
                    p.setCategory(resultSet.getInt("category_id"));
                    p.setName(resultSet.getString("name"));
                    p.setStock(resultSet.getInt("stock"));
                    p.setPrice(resultSet.getDouble("price"));
                    p.setPromo(resultSet.getDouble("promo"));
                    p.setDescription(resultSet.getString("description"));
                    p.setSpec_1(resultSet.getString("spec_1"));
                    p.setSpec_2(resultSet.getString("spec_2"));
                    p.setSpec_3(resultSet.getString("spec_3"));
                    p.setSpec_4(resultSet.getString("spec_4"));
                    p.setSpec_5(resultSet.getString("spec_5"));
                    p.setImgUrl(resultSet.getString("img_url"));
                    products.add(p);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        DBConnectionHelper.closeConnection();

        return products;
    }

    public static ArrayList<Product> getIndexPromos() {
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryGetPromos);
        try {
            products = null;
            promoProducts = null;
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.isBeforeFirst()) {
                products = new ArrayList<>();
                while (resultSet.next()) {
                    Product p = new Product();
                    p.setId(resultSet.getInt("id"));
                    p.setCategory(resultSet.getInt("category_id"));
                    p.setName(resultSet.getString("name"));
                    p.setStock(resultSet.getInt("stock"));
                    p.setPrice(resultSet.getDouble("price"));
                    p.setPromo(resultSet.getDouble("promo"));
                    p.setDescription(resultSet.getString("description"));
                    p.setSpec_1(resultSet.getString("spec_1"));
                    p.setSpec_2(resultSet.getString("spec_2"));
                    p.setSpec_3(resultSet.getString("spec_3"));
                    p.setSpec_4(resultSet.getString("spec_4"));
                    p.setSpec_5(resultSet.getString("spec_5"));
                    p.setImgUrl(resultSet.getString("img_url"));
                    products.add(p);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        DBConnectionHelper.closeConnection();

        promoProducts = new ArrayList<>();
        int firstProduct = -1;
        int secondProduct = -1;
        int thirdProduct = -1;

        if (products.size() >= 3) {
            for (int i = 0; i < 3; i++) {
                int currentProduct = 0;

                if (firstProduct == -1) {
                    firstProduct = new Random().nextInt(products.size());
                    currentProduct = firstProduct;
                    promoProducts.add(products.get(currentProduct));
                } else if (firstProduct != -1 && secondProduct == -1) {
                    do {
                        secondProduct = new Random().nextInt(products.size());
                    } while (secondProduct == firstProduct);
                    currentProduct = secondProduct;
                    promoProducts.add(products.get(currentProduct));
                } else if (firstProduct != -1 && secondProduct != -1 && thirdProduct == -1) {
                    do {
                        thirdProduct = new Random().nextInt(products.size());
                    } while (thirdProduct == firstProduct || thirdProduct == secondProduct);
                    currentProduct = thirdProduct;
                    promoProducts.add(products.get(currentProduct));
                }
                currentProduct = 0;
            }
        }
        return promoProducts;
    }
    
    public static boolean modifyStock(int stock, int productId) {
        int modifLines = 0;
        PreparedStatement preparedStatement = DBConnectionHelper.getConnection(queryModifyStock);
        try {
            preparedStatement.setInt(1, stock);
            preparedStatement.setInt(2, productId);
            modifLines = preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        DBConnectionHelper.closeConnection();

        return modifLines > 0;
    }
}
