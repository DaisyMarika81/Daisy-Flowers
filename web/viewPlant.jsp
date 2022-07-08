<%-- 
    Document   : viewPlant
    Created on : Feb 26, 2022, 10:58:59 AM
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
        <%@include file = "header.jsp" %>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Plant Details</h1>
                    </div>
                </div>
            </div>
        </section>
        <section style="margin-bottom: 30px">
            <jsp:useBean id="plantObj" class="daisy.dto.Plant" scope="request"/>

            <div class="product_image_area">
                <div class="container">
                    <div class="row s_product_inner">
                        <div class="col-lg-6">
                            <img src="${plantObj.imgpath}" style="height: 540px; width:583px;">
                        </div>
                        <div class="col-lg-5 offset-lg-1">
                            <div class="s_product_text">
                                <h3>${plantObj.name}</h3>
                                <h2 style="background: white; color: orange">${plantObj.price} VND</h2>
                                <ul class="list">
                                    <li><a><span>Plant ID</span> : ${plantObj.id}</a></li>
                                    <li><a><span>Category ID</span> : ${plantObj.cateid}</a></li>
                                    <li><a><span>Category</span> : ${plantObj.catename}</a></li>
                                    <li><a><span>Status</span> : ${plantObj.status}</a></li>
                                </ul>
                                <p>${plantObj.description}</p>
                                <div class="card_area d-flex align-items-center">
                                    <a class="primary-btn" href="viewCart.jsp">Back to cart</a>
                                </div>
                            </div>
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