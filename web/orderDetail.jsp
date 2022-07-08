<%-- 
    Document   : orderDetail
    Created on : Jan 25, 2022, 8:59:31 PM
    Author     : KIM DUONG
--%>

<%@page import="daisy.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daisy.dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
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
                        <h1>Order Details</h1>
                    </div>
                </div>
            </div>
        </section>
        <%  String name = (String) session.getAttribute("name");
            if (name == null) {
        %>
        <div style="color: red; text-align: center";>You must login to view personal page!</div>
        <p></p>
        <%}
        %>
        <section>
            <div style="text-align: center; font-size: 35px; margin-bottom: 20px; margin-top:20px"><a href="personalPage.jsp" >View all orders</a></div>
        </section>
        <section>
            <% String orderid = request.getParameter("orderid");
                if (orderid != null) {
                    int orderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail detail : list) {%>
            <table class="order">
                <tr><td class="headDetails" style='background-color: orange'>Order ID</td><td class="headDetails" style='background-color: orange'>Plant ID</td><td class="headDetails" style='background-color: orange'>Plant Name</td><td class="headDetails" style='background-color: orange'>Image</td><td class="headDetails" style='background-color: orange'>Price</td><td class="headDetails" style='background-color: orange'>Quantity</td></tr>
                <tr><td class="details"><%=  detail.getOrderID()%></td>
                    <td class="details"><%=  detail.getPlantID()%></td>
                    <td class="details"><%=  detail.getPlantName()%></td>
                    <td class="details"><img src="<%=  detail.getImgPath()%>" class = "plantimg"/></td>
                    <td class="details"><%=  detail.getPrice()%></td>
                    <td class="details"><%=  detail.getQuantity()%></td>
                    <% money = money + detail.getPrice() * detail.getQuantity(); %>
                </tr>
            </table>
            <% }%>
            <h3 style='margin-left: 800px; margin-top:30px; margin-bottom: 30px'>Total Money: <%= money%></h3>
            <%     } else {
            %>
            <p>You don't have any order!</p>
            <%
                    }
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
