<%-- 
    Document   : sendOTP
    Created on : Feb 21, 2022, 9:58:05 PM
    Author     : KIM DUONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Registration</h1>
                    </div>
                </div>
            </div>
        </section>
        <%            String email = (String) request.getAttribute("email_newAccount");
        %>
        <div style="font-size:20px; margin-bottom: 30px; margin-top: 30px; text-align: center ">Please check your email: " + email + ", a confirm code is sent to you.</div>
        <%@include file="footer.jsp" %>
    </body>
</html>
