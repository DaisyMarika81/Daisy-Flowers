/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daisy.servlet;

import daisy.dao.OrderDAO;
import daisy.dto.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KIM DUONG
 */
public class personalPageServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            ArrayList<Order> list = OrderDAO.getOrders(email);

            String txtord1 = request.getParameter("txtord1");
            String txtord2 = request.getParameter("txtord2");

            if (txtord1 != null && txtord2 != null) {
                java.util.Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(txtord1);
                java.sql.Date sqldate1 = new java.sql.Date(date1.getTime());
                java.util.Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(txtord2);
                java.sql.Date sqldate2 = new java.sql.Date(date2.getTime());
                if (sqldate1 != null && sqldate2 != null) {
                    list = OrderDAO.getOrdersStatusByDate(email, sqldate1, sqldate2);
                }
            }

            String[] status = {"", "Processing", "Completed", "Canceled"};
            session.setAttribute("status", status);
            session.setAttribute("allList", list);
            response.sendRedirect("personalPage.jsp");
        } catch (ParseException e) {

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
