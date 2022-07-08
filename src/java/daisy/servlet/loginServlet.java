/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daisy.servlet;

import daisy.dao.AccountDAO;
import daisy.dto.Account;
import daisy.dto.RandomString;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KIM DUONG
 */
public class loginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            RandomString rand = new RandomString();
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            String save = request.getParameter("savelogin");
            Account acc = null;
            try {
                if (email == null || email.equals("") || password == null || password.equals("")) {
                    Cookie[] c = request.getCookies();
                    String token = "";
                    if (c != null) {
                        for (Cookie aCookie : c) {
                            if (aCookie.getName().equals("selector")) {
                                token = aCookie.getValue();
                            }
                        }
                    }
                    if (token.equals("")) {
                        response.sendRedirect("personalPage.jsp");
                    } else {
                        response.sendRedirect("errorpage.html");
                    }
                } else {
                    acc = AccountDAO.getAccount(email, password);
                    if (acc != null) {
                        if (acc.getRole() == 1) {
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("name", acc.getFullname());
                                session.setAttribute("email", email);
                                session.setAttribute("role", acc.getRole());
                                if (save != null) {
                                    String token = rand.randomAlphaNumeric(10);
                                    AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 2);
                                    response.addCookie(cookie);
                                }
                                response.sendRedirect("AdminIndex.jsp");
                            }
                        } else {
//                        response.sendRedirect("welcome.html");
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("name", acc.getFullname());
                                session.setAttribute("phone", acc.getPhone());
                                session.setAttribute("email", email);
                                session.setAttribute("role", acc.getRole());
                                if (save != null) {
                                    String token = rand.randomAlphaNumeric(10);
                                    AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 2);
                                    response.addCookie(cookie);
                                }
                                response.sendRedirect("personalPageServlet");
                            }
                        }
                    } else {
                        request.setAttribute("ERROR1", "Username or Password is invalid, please try again!");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
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
