<%-- 
    Document   : changeProfile
    Created on : Jan 26, 2022, 9:41:11 PM
    Author     : KIM DUONG
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <<body>
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
        <!-- End Banner Area -->

        <section class="login_box_area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login_box_img">
                            <img class="img-fluid" src="img/login.jpg" style="height:700px;">
                            <div class="hover">
                                <h4>UPDATE YOUR ACCOUNT</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="login_form_inner">
                            <h3>Updating Your Account</h3>

                            <form class="row login_form" action="mainController" method="post">
                                <c:set var="errors" value = "${requestScope.PROFILE_ERROR}"/>
                                <div style="font-size: 20px;margin-left:24px; margin-bottom: 15px; margin-top:15px">Your current full name: ${sessionScope.name} </div>
                                <div class="col-md-12 form-group">
                                    <input input name="txtfullnameupdate" required="" type="text"  class="form-control" id="name" placeholder="Enter new fullname" value="${param.name}"
                                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter new fullname'"
                                           style="width:300px;">
                                </div>
                                <c:if test="${not empty errors.fullnameLengthErr}">
                                    <font style="color: red; margin-left: 26px">
                                    ${errors.fullnameLengthErr}
                                    </font>
                                </c:if>
                                <div style="font-size: 20px;margin-left:24px; margin-bottom: 15px; margin-top:15px">Your current phone: ${sessionScope.phone} </div>
                                <div class="col-md-12 form-group">
                                    <input class="form-control" id="name" name="phoneupdate" type="text" placeholder="Enter new phone"
                                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter new phone'"
                                           style="width:300px;">
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
                                <div class="col-md-12 form-group" style="text-align: center; padding-top: 20px;"><button  name="action" class="primary-btn" type="submit" value="Update">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>