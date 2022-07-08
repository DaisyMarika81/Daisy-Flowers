<%-- 
    Document   : update
    Created on : Jan 27, 2022, 5:34:02 PM
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
        <header>
            <%@include file="header.jsp" %>
        </header>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Change Your Profile</h1>
                    </div>
                </div>
            </div>
        </section>
        <h1 style="text-align: center; color: green; margin-top: 10px; margin-bottom: 20px">Update Successfully, please log in again!!!</h1>
        <% session.invalidate();%>
        <div style="text-align: center; color: green ; margin-top: 10px; margin-bottom: 20px; font-size: 20px">Please click <a href="index.jsp">here </a>to return to home page!</div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>