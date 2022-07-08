<%-- 
    Document   : manageOrders
    Created on : Mar 4, 2022, 10:17:41 AM
    Author     : KIM DUONG
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
            <!--End of header-->

            <!-- Banner Area -->
            <section class="banner-area organic-breadcrumb">
                <div class="container">
                    <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                        <div class="col-first">
                            <h1>Manage Orders</h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End banner Area -->

            <table>
                <table class="table" style="border-color: black; margin-top: 40px; margin-bottom: 40px; color:black">
                    <thead>
                        <tr>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Account ID</th>       
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Order ID</th>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Order Date</th>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Ship Date</th>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Order Status</th>                            
                        </tr>
                    </thead>

                <c:forEach var="o" items="${requestScope.orderList}">
                    <tr><td class="details" style='text-align: center; border: 1px solid black'><c:out value="${o.getAccID()}"></c:out></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${o.getOrderID()}"></c:out></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${o.getOrderDate()}"></c:out></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${o.getShipDate()}"></c:out></td>
                            <td class="details" style='text-align: center; border: 1px solid black'>
                            <c:if test="${o.getStatus() eq 1}"><div style="color: blue">Processing</div></c:if>
                            <c:if test="${o.getStatus() eq 2}"><div style="color: green">Completed</div></c:if>
                            <c:if test="${o.getStatus() eq 3}"><div style="color: red">Canceled</div></c:if></td>
                        </tr>
                </c:forEach>
            </table>
            <!--Footer-->
            <c:import url="footer.jsp"></c:import>
            <!--End of footer-->
    </body>
</html>
