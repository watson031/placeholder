/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.entities.Category;
import model.entities.User;
import model.managers.CategoryManager;
import model.managers.CookieManager;
import model.managers.UserManager;

/**
 *
 * @author Alex
 */
@WebServlet(name = "LoginController", urlPatterns = {"/loginController"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> asideCategories = CategoryManager.getNavBar();
        request.setAttribute("asideCategories", asideCategories);

        HttpSession session = request.getSession(true);

        Boolean isLoggedIn = null;

        String urlRedirect = "WEB-INF/login.jsp";
        String cookieKeyName = "emailUser";
        
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");
        String logout = request.getParameter("logout");
        String rememberMe = request.getParameter("remember");        

        Cookie cookieLogin = CookieManager.getCookie(cookieKeyName, request);

        if (userEmail != null && userPassword != null) {
            User user = UserManager.readUser(userEmail, userPassword);
            
            if (user != null) {
                if (rememberMe != null) {
                    CookieManager.createCookie(cookieKeyName, userEmail, response);
                } else {
                    CookieManager.deleteCookie(cookieLogin, response);
                }
                isLoggedIn = true;
                urlRedirect = "indexController";
                session.setAttribute("userLogin", user);
            } else {
                isLoggedIn = false;
                urlRedirect = "WEB-INF/login.jsp";
            }
        }      

        if (cookieLogin != null) {
            String valueEmail = cookieLogin.getValue();
            request.setAttribute("emailUser", valueEmail);
        }

        if (logout != null) {
            isLoggedIn = null;
            urlRedirect = "indexController";
            session.invalidate();
        }

        request.setAttribute("isLoggedIn", isLoggedIn);
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
