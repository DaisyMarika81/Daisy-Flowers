<%-- 
    Document   : registration
    Created on : Jan 24, 2022, 10:45:16 AM
    Author     : KIM DUONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/nouislider.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
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

        <!--================Login Box Area =================-->
       <section class="login_box_area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login_box_img">
                            <img class="img-fluid" src="img/login.jpg" style="height:700px;">
                            <div class="hover">
                                <h4>Already have an account?</h4>
                                <a class="primary-btn" href="login.jsp">Sign in</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="login_form_inner">
                            <h3>Registration</h3>

                            <form class="row login_form" action="mainController" method="post" id="contactForm">
                                <c:set var="errors" value = "${requestScope.REGIS_ERROR}"/>
                                <div class="col-md-12 form-group">
                                    <input name="txtemail" type="text" pattern = "^(\\w)+@(a-zA-Z]+([.](\\w+){1,2}"  class="form-control" id="name" placeholder="Username (6 - 30 characters)"
                                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username (6 - 30 characters)'"
                                           value = "${param.txtemail == null ? "" : param.txtemail}">
                                </div>
                                <c:if test="${not empty errors.usernameLengthErr}">
                                    <font style="color: red; margin-left: 26px">
                                    ${errors.usernameLengthErr}
                                    </font>
                                </c:if>

                                <c:if test="${not empty errors.usernameIsExisted}">
                                    <font style="color: red; margin-left: 26px">
                                    ${errors.usernameIsExisted}
                                    </font>
                                </c:if>
                                <div class="col-md-12 form-group">
                                    <input name="txtfullname" type="text" placeholder="Full Name (6 - 30 characters)" class="form-control" id="name"
                                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'Full Name (6 - 30 characters)'"
                                           value = "${param.txtfullname == null ? "" : param.txtfullname}">

                                </div>
                                <c:if test="${not empty errors.fullnameLengthErr}">
                                    <font style="color: red; margin-left: 26px">
                                    ${errors.fullnameLengthErr}
                                    </font>
                                </c:if>
                                <div class="col-md-12 form-group">
                                    <input name="txtpassword"  type="password"  class="form-control" id="name"  placeholder="Password (6 - 30 characters)"
                                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password (6 - 30 characters)'">
                                </div>
                                <c:if test="${not empty errors.passwordLengthErr}">
                                    <font style="color: red; margin-left: 26px">
                                    ${errors.passwordLengthErr}
                                    </font>
                                </c:if>
                                <div class="col-md-12 form-group">
                                    <input name="txtphone" type="text" placeholder="Phone (12 numbers)" class="form-control" id="name"
                                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone (12 numbers)'"
                                           value = "${param.txtphone == null ? "" : param.txtphone}">
                                    ${param.ERROR == null ? "" : param.ERROR}
                                </div>
                                <c:if test="${not empty errors.phoneLengthErr}">
                                    <font style="color: red; margin-left: 26px">
                                    ${errors.phoneLengthErr}
                                    </font>
                                </c:if>
                                <c:if test="${not empty errors.phoneContainLetter}">
                                    <font style="color: red; margin-left: 26px">
                                    ${errors.phoneContainLetter}
                                    </font>
                                </c:if>
                                <div class="col-md-12 form-group">
                                    <button name="action" type="submit" value="Register" class="primary-btn">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Login Box Area =================-->

        <!-- start footer Area -->
        <%@include file="footer.jsp" %>
        <script src="js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="js/gmaps.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
