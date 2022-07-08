<%-- 
    Document   : index
    Created on : Jan 21, 2022, 8:22:50 AM
    Author     : KIM DUONG
--%>

<%@page import="daisy.dao.PlantDAO"%>
<%@page import="daisy.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <section class="banner-area" style="background-image: url('img/banner/banner-bg1.jpg'); height:580px; ">
            <div class="container">
                <div class="row fullscreen align-items-center justify-content-start">
                    <div class="col-lg-12">
                        <div class="active-banner-slider owl-carousel">
                            <!-- single-slide -->
                            <div class="row single-slide align-items-center d-flex">
                                <div class="col-lg-5 col-md-6">
                                    <div class="banner-content">
                                        <h1 style='margin-top:80px;'>Welcome to Daisy's Flowers <br>Shop!</h1>
                                        <p>We provide the best flowers in the area.</p>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <div class="banner-img">
                                        <img class="img-fluid" src="img/banner/banner-img.png" style='margin-left:183px; margin-top:80px;'>
                                    </div>
                                </div>
                            </div>
                            <!-- single-slide -->
                            <div class="col-lg-7">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End banner Area -->
    <section class="features-area section_gap">
        <div class="container">
            <div class="row features-inner">
                <!-- single features -->
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="single-features">
                        <div class="f-icon">
                            <img src="img/features/f-icon1.png" alt="">
                        </div>
                        <h6>Free Delivery</h6>
                        <p>Free Shipping on all order</p>
                    </div>
                </div>
                <!-- single features -->
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="single-features">
                        <div class="f-icon">
                            <img src="img/features/f-icon2.png" alt="">
                        </div>
                        <h6>Return Policy</h6>
                        <p>Free Shipping on all order</p>
                    </div>
                </div>
                <!-- single features -->
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="single-features">
                        <div class="f-icon">
                            <img src="img/features/f-icon3.png" alt="">
                        </div>
                        <h6>24/7 Support</h6>
                        <p>Free Shipping on all order</p>
                    </div>
                </div>
                <!-- single features -->
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="single-features">
                        <div class="f-icon">
                            <img src="img/features/f-icon4.png" alt="">
                        </div>
                        <h6>Secure Payment</h6>
                        <p>Free Shipping on all order</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end features Area -->
    <!-- Start category Area -->
    <section class="category-area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-lg-8 col-md-8">
                            <div class="single-deal">
                                <div class="overlay"></div>
                                <img class="img-fluid w-100" src="img/category/c6.jpg" alt="" style="height:200px;">
                                <a href="img/category/c6.jpg" class="img-pop-up" target="_blank">
                                    <div class="deal-details">
                                        <h6 class="deal-title">HOA LAN</h6>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="single-deal">
                                <div class="overlay"></div>
                                <img class="img-fluid w-100" src="img/category/c7.jpg" alt="" style="height:200px;">
                                <a href="img/category/c7.jpg" class="img-pop-up" target="_blank">
                                    <div class="deal-details">
                                        <h6 class="deal-title">LAN HỒ ĐIỆP</h6>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="single-deal">
                                <div class="overlay"></div>
                                <img class="img-fluid w-100" src="img/category/c8.jpg" alt="" style="height:200px;">
                                <a href="img/category/c8.jpg" class="img-pop-up" target="_blank">
                                    <div class="deal-details">
                                        <h6 class="deal-title">HOA HỒNG ĐỎ</h6>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-8">
                            <div class="single-deal">
                                <div class="overlay"></div>
                                <img class="img-fluid w-100" src="img/category/c9.jpg" alt="" style="height:200px;">
                                <a href="img/category/c9.jpg" class="img-pop-up" target="_blank">
                                    <div class="deal-details">
                                        <h6 class="deal-title">HOA HỒNG TRẮNG</h6>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-deal">
                        <div class="overlay"></div>
                        <img class="img-fluid w-100" src="img/category/c5.jpg" alt="" style='height: 430px'>
                        <a href="img/category/c10.jpg" class="img-pop-up" target="_blank">
                            <div class="deal-details">
                                <h6 class="deal-title">Ưu đãi cực lớn hàng tuần</h6>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End category Area -->

    <section class="section_gap" style="padding:0px;">
        <!-- single product slide -->
        <div class="single-product-slider">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 text-center">
                        <div class="section-title">
                            <h1>Our Products</h1>
                            <p>We have many types of flowers that suitable for your garden, office, bedroom.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <%
                        String keyword = request.getParameter("txtsearch");
                        String searchby = request.getParameter("searchby");
                        ArrayList<Plant> list;
                        String[] tmp = {"out of stock", "availble"};
                        if (keyword == null && searchby == null) {
                            list = PlantDAO.getPlants("", "");
                        } else {
                            list = PlantDAO.getPlants(keyword, searchby);
                        }
                        if (list != null && !list.isEmpty()) {
                            for (Plant p : list) {%>
                    <!-- single product -->
                    <div class="col-lg-3 col-md-6">
                        <div class="single-product">
                            <img class="img-fluid" src='<%= p.getImgpath()%>' style="height:250px;" alt="">
                            <div class="product-details">
                                <h6><%= p.getName()%></h6>
                                <div class="price">
                                    <h6><%= p.getPrice()%> VND</h6>
                                    <h6 class="l-through">1.200.000 VND</h6>
                                </div>
                                <h6>Status: <%= tmp[p.getStatus()]%></h6>
                                <div class="prd-bottom">
                                    <a href="mainController?action=addtocart&pid=<%= p.getId()%>" class="social-info">
                                        <span class="ti-bag"></span>
                                        <p class="hover-text">ADD CART</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}
                        }
                    %>
                </div>
            </div>
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
</body>
</html>
