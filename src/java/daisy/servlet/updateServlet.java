/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daisy.servlet;

import daisy.dao.AccountDAO;
import daisy.dto.Account;
import daisy.dto.RegistrationError;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KIM DUONG
 */
public class updateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        String email = (String) session.getAttribute("email");
        Account acc = AccountDAO.getAccountByEmail(email);

        session.setAttribute("oldPhone", acc.getPhone());
        session.setAttribute("oldFullname", acc.getPhone());

        String fullName = request.getParameter("txtfullnameupdate");
        String phone = request.getParameter("phoneupdate");
        RegistrationError errors = new RegistrationError();
        boolean foundErr = false;
        String url = "changeProfile.jsp";

        try {
            if (fullName.trim().length() < 6 || fullName.trim().length() > 30) {
                foundErr = true;
                errors.setFullnameLengthErr("Full name is required from 6 to 30 chars");
            }
            if (phone.trim().length() != 12) {
                foundErr = true;
                errors.setPhoneLengthErr("Phone must be 12 chars length");
            }
            if (!phone.matches("[0-9]+")) {
                foundErr = true;
                errors.setPhoneContainLetter("Phone number must not contain letter");
            }
            if (foundErr) {
                request.setAttribute("PROFILE_ERROR", errors);
            } else {
                boolean result = AccountDAO.updateAccount1(email, fullName, phone);
                if (result) {
                    url = "update.jsp";
                }
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }

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
