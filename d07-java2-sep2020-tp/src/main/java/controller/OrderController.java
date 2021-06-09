/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.entities.Category;
import model.entities.Item;
import model.entities.Order;
import model.entities.OrderEmail;
import model.entities.User;
import model.managers.CategoryManager;
import model.managers.EmailManager;
import model.managers.OrderManager;
import model.managers.SessionManager;

/**
 *
 * @author abrossea
 */
@WebServlet(name = "OrderController", urlPatterns = {"/orderController"})
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> asideCategories = CategoryManager.getNavBar();
        request.setAttribute("asideCategories", asideCategories);

        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) SessionManager.get("cart", request);

        String urlRedirect = "cartController";
        HttpSession session = request.getSession(true);

        User user = (User) session.getAttribute("userLogin");
        Order order = null;

        if (!cart.isEmpty()) {
            if (user != null) {
                order = new Order();
                int orderNo = OrderManager.generateOrderNo();
                order.setId(orderNo);
                order.setUserId(user.getId());
                
                OrderManager.createOrder(order, cart);

                OrderEmail orderEmail = new OrderEmail();
                orderEmail.setUser(user);
                orderEmail.setOrder(order);
                orderEmail.setCart(cart);

                EmailManager.sendOrderEmail(orderEmail);

                urlRedirect = "WEB-INF/order.jsp";
            } else {
                urlRedirect = "loginController";
            }
        } else {
            urlRedirect = "indexController";
        }

        request.setAttribute("order", order);
        request.getRequestDispatcher(urlRedirect).forward(request, response);
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
