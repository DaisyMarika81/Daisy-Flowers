<%-- 
    Document   : viewCart
    Created on : Feb 15, 2022, 9:08:22 AM
    Author     : KIM DUONG
--%>

<%@page import="daisy.dto.Plant"%>
<%@page import="daisy.dao.PlantDAO"%>
<%--<%@page import="java.sql.Date"%>--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/nouislider.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
        <%@include file = "header.jsp" %>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Shopping Cart</h1>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Cart Area =================-->
        <section class="cart_area">
            <div style='color:red; font-size:30px; text-align: center'><%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%> </div>
            <div class="container">
                <div class="cart_inner">
                    <div class="table-responsive">

                        <%
                            String name = (String) session.getAttribute("name");
                            if (name != null) {
                        %>
                        <h3 style="text-align: center; margin-top: 70px; margin-bottom: 70px; font-size:40px;" >Welcome back, <%= session.getAttribute("name")%>! </h3>
                        <%
                            }
                        %>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">Product ID</th>
                                    <th scope="col" style="width:30px">Quantity</th>
                                    <th scope="col">Action</th>
                                    <th scope="col" style="width:130px">Price</th>

                                </tr>
                            </thead>
                            <%
                                int total = 0;
                                HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                                if (cart != null) {
                                    Set<String> pids = cart.keySet();

                                    for (String pid : pids) {
                                        int quantity = cart.get(pid);
                                        Plant plant = PlantDAO.getPlant(Integer.parseInt(pid));
                            %>
                            <tbody>
                            <form action ="mainController" method = "post">
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="<%= plant.getImgpath()%>" style="height:180px; width:180px;">
                                            </div>
                                            <div class="media-body">
                                                <p><%= plant.getName()%></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="text-align: center">
                                        <h5><input type = "hidden" value = "<%= pid%>" name ="pid" ><a href="getPlantServlet?&pid=<%= pid%>"><%= pid%></a></h5>
                                    </td>
                                    <td style="width:30px">
                                        <div class="product_count">
                                            <input type = "number" value = "<%= quantity%>" name = "quantity" min="0">
                                        </div>
                                    </td>
                                    <td>
                                        <input type = "submit" value = "updatecart" name = "action" class="primary-btn">
                                        <input type = "submit" value = "deletecart" name = "action" class="primary-btn">
                                    </td>
                                    <td>
                                        <h5><%= plant.getPrice() * cart.get(pid)%> VND</h5>
                                    </td>
                                </tr>
                            </form>
                            <%
                                        total = total + plant.getPrice() * cart.get(pid);
                                    }
                                }
                            %>
                            <tr>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <h5>Subtotal</h5>
                                </td>
                                <td>
                                    <h5><%= total%> VND</h5>
                                </td>
                            </tr>

                            <tr class="bottom_button">
                                <td>
                                    <div class="checkout_btn_inner d-flex align-items-center">
                                        <a class="gray_btn" href="index.jsp">Continue Shopping</a>
                                    </div>
                                </td>
                                <td>

                                </td>
                                <td>

                                </td>

                                <td>

                                </td>
                                <td>
                                    <div class="cupon_text d-flex align-items-center">
                                        <a class="primary-btn" href="mainController?action=saveOrder" style="margin-left: 350px;">Save Order</a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Cart Area =================-->

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <script src="js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
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
