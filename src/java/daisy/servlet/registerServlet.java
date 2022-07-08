/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daisy.servlet;

import daisy.dao.AccountDAO;
import daisy.dto.RegistrationError;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KIM DUONG
 */
public class registerServlet extends HttpServlet {

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
        String username = request.getParameter("txtemail");
        String fullName = request.getParameter("txtfullname");
        String password = request.getParameter("txtpassword");
        String phone = request.getParameter("txtphone");

        RegistrationError errors = new RegistrationError();
        boolean foundErr = false;
        String url = "registration.jsp";

        try {
            /* TODO output your page here. You may use following sample code. */
            if (username.trim().length() == 0 || username.trim().length() < 6 || username.trim().length() > 30) {
                foundErr = true;
                errors.setUsernameLengthErr("Username is required from 6 to 30 chars");
            }
            if (username.trim().length() == 0 || password.trim().length() < 6 || password.trim().length() > 30) {
                foundErr = true;
                errors.setPasswordLengthErr("Password is required from 6 to 30 chars");
            }
            if (username.trim().length() == 0 || fullName.trim().length() < 6 || fullName.trim().length() > 30) {
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
                request.setAttribute("REGIS_ERROR", errors);
            } else {
                int status = 1;
                int role = 0;
                String token = null;
                boolean result = AccountDAO.insertAccount(username, password, fullName, phone, status, role, token);
                if (result) {
                    url = "login.jsp";
                }
            }
        } catch (SQLException ex) {
            String msg = ex.getMessage();
            log("registerServlet _ SQL " + msg);
            if (msg.contains("duplicate")) {
                errors.setUsernameIsExisted(username + " existed! Please try another username!");
                request.setAttribute("REGIS_ERROR", errors);
            }
        } catch (NamingException ex) {
            log("registerServlet _ Naming " + ex.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
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
