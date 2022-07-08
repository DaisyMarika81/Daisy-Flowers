<%-- 
    Document   : canceledOrders
    Created on : Jan 26, 2022, 9:41:35 PM
    Author     : KIM DUONG
--%>

<%@page import="daisy.dao.OrderDAO"%>
<%@page import="daisy.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Canceled Orders</h1>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->
        <section> 
            <%
                String email = (String) session.getAttribute("email");
                ArrayList<Order> list = OrderDAO.getOrdersStatus(email, 3);
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {%>


            <table class="table" style="border-color: black">
                <thead>
                    <tr>
                        <th scope="col" style='text-align: center'>Order ID</th>
                        <th scope="col" style='text-align: center'>Order Date</th>
                        <th scope="col" style='text-align: center'>Ship Date</th>
                        <th scope="col" style='text-align: center'>Order's Status</th>
                        <th scope="col" style='text-align: center'>Action</th>
                    </tr>
                </thead>
                <tr><td class="details" style='text-align: center'><%= ord.getOrderID()%></td>
                    <td class="details" style='text-align: center'><%= ord.getOrderDate()%></td>
                    <td class="details" style='text-align: center'><%= ord.getShipDate()%></td>
                    <td class="details" style = 'color: red; text-align: center'><%= "Canceled"%>
                        <br/><a style = 'color: #039dfc' href="mainController?action=orderagain" >Order again</a>
                    </td>
                    <td class="details" style='text-align: center' >
                        <a href="orderDetail.jsp?orderid=<%= ord.getOrderID()%>">Detail</a>
                    </td>
                </tr>
            </table>
            <%
                }
            } else {
            %>
            <div style="text-align: center; font-size: 30px; margin-top: 100px; margin-bottom: 100px;">You don't have any canceled order!</div>
            <% }%>         
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
