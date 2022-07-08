<%-- 
    Document   : managePlants
    Created on : Mar 4, 2022, 12:40:03 AM
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
                            <h1>Manage Plants</h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End banner Area -->

            <table>
                <table class="table" style="border-color: black; margin-top: 40px; margin-bottom: 40px; color:black">
                    <thead>
                        <tr>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Image</th>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>ID</th>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Name</th>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Price</th>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Status</th>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Category ID</th>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Category Name</th>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Description</th>

                        </tr>
                    </thead>

                <c:forEach var="p" items="${requestScope.plantList}">
                    <tr><td class="details" style='text-align: center; border: 1px solid black'><img src="${p.imgpath}" alt="alt" style="height:180px; width:180px"/></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${p.getId()}"></c:out></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${p.getName()}"></c:out></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${p.getPrice()}"></c:out></td>
                            <td class="details" style='text-align: center; border: 1px solid black'>
                            <c:if test="${p.getStatus() eq 1}">Available</c:if>
                            <c:if test="${p.getStatus() eq 0}">Out of Stock</c:if></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${p.getCateid()}"></c:out></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${p.getCatename()}"></c:out></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${p.getDescription()}"></c:out></td>
                        </tr>
                </c:forEach>
            </table>
            <!--Footer-->
            <c:import url="footer.jsp"></c:import>
            <!--End of footer-->
    </body>
</html>
