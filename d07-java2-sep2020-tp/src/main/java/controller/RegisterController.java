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
import javax.servlet.http.HttpSession;
import model.entities.Category;
import model.entities.User;
import model.managers.CategoryManager;
import model.managers.UserManager;

/**
 *
 * @author waugusti
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/registerController"})
public class RegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> asideCategories = CategoryManager.getNavBar();
        request.setAttribute("asideCategories", asideCategories);

        String urlReturn = "WEB-INF/register.jsp";
        String createUser = request.getParameter("create");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("confirmPassword");
        String phoneNumber = request.getParameter("field3");
        String address = request.getParameter("address");

        ArrayList<String> errorMessages = new ArrayList<>();
        boolean userCreated = false;
        boolean isMatch = false;
        boolean isEmailExist = false;

        User user = null;

        if (createUser != null) {
            if (firstName.isBlank()) {
                errorMessages.add("Please enter your first name");
            }
            if (lastName.isBlank()) {
                errorMessages.add("Please enter your last name");
            }
            if (email.isBlank()) {
                errorMessages.add("Please enter your email");
            } else {
                isEmailExist = UserManager.isEmailUnique(email);
                if (isEmailExist) {
                    errorMessages.add("This email is already connected to an account");
                }
            }
            if (password.isBlank()) {
                errorMessages.add("Please enter a password");
            }
            if (passwordConfirm.isBlank()) {
                errorMessages.add("Please confirm your password");
            }
            if (!password.isBlank() && !passwordConfirm.isBlank()) {
                isMatch = UserManager.isPasswordMatch(password, passwordConfirm);
                if (isMatch == false) {
                    errorMessages.add("Please enter the same password for both field");
                }
            }

            if (address.isBlank()) {
                errorMessages.add("Please enter your address");
            }

            if (errorMessages.isEmpty()) {
                user = new User();

                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmail(email);
                user.setPassword(password);
                user.setTelephone(phoneNumber);
                user.setAddress(address);

                userCreated = UserManager.createUser(user);                
            } else {
                request.setAttribute("errorFields", errorMessages);
            }
        }

        if (userCreated) {
            urlReturn = "WEB-INF/login.jsp";
        }

        request.getRequestDispatcher(urlReturn).forward(request, response);
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
