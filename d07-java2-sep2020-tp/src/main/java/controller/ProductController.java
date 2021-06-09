/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.entities.Category;
import model.entities.Product;
import model.managers.CategoryManager;
import model.managers.ProductManager;

/**
 *
 * @author Alex
 */
@WebServlet(name = "ProductController", urlPatterns = {"/productController"})
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> asideCategories = CategoryManager.getNavBar();
        request.setAttribute("asideCategories", asideCategories);

        String productType = request.getParameter("prod_type");
        String categoryId = request.getParameter("category_id");
        String productId = request.getParameter("product_id");
        String forwardPage = "/WEB-INF/products.jsp";

        if (categoryId != null) {
            ArrayList<Product> products = ProductManager.getByCategory(Integer.parseInt(categoryId));
            request.setAttribute("products", products);
        } else if (productId != null) {
            forwardPage = "/WEB-INF/details.jsp";
            Product product = ProductManager.getById(Integer.parseInt(productId));
            request.setAttribute("product", product);
        } else if (productType.equals("promo_products")) {
            ArrayList<Product> products = ProductManager.getPromos();
            request.setAttribute("products", products);
        } else {
            ArrayList<Product> products = ProductManager.getAll();
            request.setAttribute("products", products);
        }

        request.getRequestDispatcher(forwardPage).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
