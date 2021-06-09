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
import model.entities.ContactEmail;
import model.entities.OrderEmail;
import model.managers.CategoryManager;
import model.managers.EmailManager;

/**
 *
 * @author abrossea
 */
@WebServlet(name = "ContactUsController", urlPatterns = {"/contactUsController"})
public class ContactUsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> asideCategories = CategoryManager.getNavBar();
        request.setAttribute("asideCategories", asideCategories);

        String submit = request.getParameter("submit");
        ContactEmail contactEmail;

        Boolean isComment = false;
        Boolean emailSent = false;

        if (submit != null) {
            contactEmail = new ContactEmail();

            String fullName = request.getParameter("full_name");
            contactEmail.setFullName(fullName);

            String email = request.getParameter("email");
            contactEmail.setEmail(email);

            String phoneNumber = request.getParameter("phone_number");
            contactEmail.setPhoneNumber(phoneNumber);

            String subject = request.getParameter("contact_method");
            contactEmail.setContactMethod(subject);

            String message = request.getParameter("message");
            contactEmail.setMessage(message);

            String contactTime = request.getParameter("contact_time");
            contactEmail.setContactTime(contactTime);

            String commentOnly = request.getParameter("comment");
            
            if (commentOnly != null) {
                isComment = true;
            }

            contactEmail.setIsComment(isComment);

            EmailManager.sendContactEmail(contactEmail);
            emailSent = true;
            request.setAttribute("emailSent", emailSent);
        }

        request.getRequestDispatcher("/WEB-INF/contactus.jsp").forward(request, response);
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
