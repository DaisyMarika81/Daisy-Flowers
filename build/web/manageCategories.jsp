<%-- 
    Document   : manageCategories
    Created on : Mar 4, 2022, 5:04:23 PM
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
                            <h1>Manage Categories</h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End banner Area -->

            <table>
                <table class="table" style="border-color: black; margin-top: 40px; margin-bottom: 40px; color:black">
                    <thead>
                        <tr>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Category ID</th>
                            <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Category Name</th> 
                        </tr>
                    </thead>

                <c:forEach var="cat" items="${requestScope.cateList}">
                    <tr><td class="details" style='text-align: center; border: 1px solid black'><c:out value="${cat.getCateid()}"></c:out></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${cat.getCatename()}"></c:out></td>
                    </c:forEach>
            </table>
            <!--Footer-->
            <c:import url="footer.jsp"></c:import>
            <!--End of footer-->
    </body>
</html>
