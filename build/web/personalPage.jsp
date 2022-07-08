<%-- 
    Document   : personalPage
    Created on : Jan 24, 2022, 11:44:32 AM
    Author     : KIM DUONG
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="daisy.dto.Account"%>
<%@page import="daisy.dao.AccountDAO"%>
<%@page import="daisy.dto.Order"%>
<%@page import="daisy.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
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
                        <h1>Personal Page</h1>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->
        <c:set var="list" value = "${allList}" scope="session"/>
        <c:set var="status" value = "${status}" scope="session"/>

        <c:if test="${sessionScope.name eq null}">
            <p><font color="red">You must login to view personal page!</font></p>
            </c:if>
        <section>
            <h3 style="text-align: center; margin-top:40px; font-size: 30px;">Welcome back, ${sessionScope.name}!</h3>
            <br/>
        </section>
        <section> 

            <c:if test="${(list eq null) && (empty list)}">  
                <div style="text-align: center; font-size: 30px; margin-top: 100px; margin-bottom: 100px;">You don't have any order!</div>   
            </c:if> 

            <c:forEach items="${list}" var = "ord">
                <table class="table" style="border:1px solid black; color:black; margin-top: 40px; margin-bottom: 40px">
                    <thead>
                        <tr>
                            <th scope="col" style='text-align: center; background-color: orange; border:1px solid black'>Order ID</th>
                            <th scope="col" style='text-align: center; background-color: orange; border:1px solid black'>Order Date</th>
                            <th scope="col" style='text-align: center; background-color: orange; border:1px solid black'>Ship Date</th>
                            <th scope="col" style='text-align: center; background-color: orange; border:1px solid black'>Order's Status</th>
                            <th scope="col" style='text-align: center; background-color: orange; border:1px solid black'>Action</th>
                        </tr>
                    </thead>

                    <tr><td class="details" style='text-align: center; border: 1px solid black '>${ord.orderID}</td>
                        <td class="details" style='text-align: center; border: 1px solid black'>${ord.orderDate}</td>
                        <td class="details" style='text-align: center; border: 1px solid black'>${ord.shipDate}</td>
                        <td class="details" style="border:1px solid black">${status[ord.status]}
                            <br/>
                            <c:if test="${ord.status == 1}">
                                <a href="mainController?action=cancelorder" style="color:red;">Cancel order</a>
                            </c:if>                        
                        </td>
                        <td class="details" style="border:1px solid black">
                            <a href="orderDetail.jsp?orderid=${ord.orderID}">Detail</a>
                        </td>
                    </tr>
                </table>
            </c:forEach>    
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
