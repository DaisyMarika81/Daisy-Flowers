<%-- 
    Document   : manageAccounts
    Created on : Mar 2, 2022, 9:58:55 PM
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
    <body>
        <c:import url="header.jsp"></c:import>
            <!--End of header-->

            <!-- Banner Area -->
            <section class="banner-area organic-breadcrumb">
                <div class="container">
                    <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                        <div class="col-first">
                            <h1>Manage Accounts</h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End banner Area -->
            <form action="mainController" method="post" class="form-inline">
                <div class="form-group" style="color:black; background-color: white" >
                    <input type="text" class="form-control" placeholder="Enter account" name="txtAccountSearch" value="<%= (request.getParameter("txtAccountSearch") == null) ? "" : request.getParameter("txtAccountSearch")%>">
            </div>
            <button type="submit" value="searchAccount" name="action" class="btn btn-outline-warning my-2 my-sm-0">Search</button>
        </form>
        <table>
            <table class="table" style="border-color: black; margin-top: 40px; margin-bottom: 40px; color:black">
                <thead>
                    <tr>
                        <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>ID</th>
                        <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Email</th>
                        <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Full name</th>
                        <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Status</th>
                        <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Phone</th>
                        <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Role</th>
                        <th scope="col" style='text-align: center; border: 1px solid black; background-color: orange'>Action</th>
                    </tr>
                </thead>

                <c:forEach var="acc" items="${requestScope.accountSearchList}">

                    <tr><td class="details" style='text-align: center; border: 1px solid black'><c:out value="${acc.getAccID()}"></c:out></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${acc.getEmail()}"></c:out></td>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${acc.getFullname()}"></c:out></td>
                            <td class="details" style='text-align: center; border: 1px solid black'>
                            <c:if test="${acc.getStatus() eq 1}"><div style="color:green">Active</div></c:if>
                            <c:if test="${acc.getStatus() eq 0}"><div style="color:red">Inactive</div></c:if>
                        <td class="details" style='text-align: center; border: 1px solid black'><c:out value="${acc.getPhone()}"></c:out></td>
                            <td class="details" style='text-align: center; border: 1px solid black'>
                            <c:if test="${acc.getRole() eq 1}"><div style="color:red">Admin</div></c:if>
                            <c:if test="${acc.getRole() eq 0}"><div>User</div></c:if>
                            </td>
                            <td class="details" style='text-align: center; border: 1px solid black'><c:if test="${acc.getRole() eq 0}"> 
                                <c:url var="mylink" value="mainController">
                                    <c:param name="email" value ="${acc.getEmail()}"></c:param>
                                    <c:param name="status" value ="${acc.getStatus()}"></c:param>
                                    <c:param name="action" value ="updateStatusAccount"></c:param>
                                </c:url>
                                <a href="${mylink}">Block/Unblock</a>
                            </c:if></td>
                    </tr>
                </c:forEach>
            </table>
            <!--Footer-->
            <c:import url="footer.jsp"></c:import>>
    </body>
</html>
