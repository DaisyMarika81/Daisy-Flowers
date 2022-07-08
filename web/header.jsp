<%-- 
    Document   : header
    Created on : Jan 21, 2022, 7:58:44 AM
    Author     : KIM DUONG
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/nouislider.min.css">
        <link rel="stylesheet" href="css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
        <c:if test="${sessionScope.name eq null}">
            <header class="header_area sticky-header">
                <div class="main_menu">
                    <nav class="navbar navbar-expand-lg navbar-light main_box justify-content-between">
                        <div class="container" style="height: 80px;">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <a class="navbar-brand logo_h" href="index.jsp">Daisy</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                                <ul class="nav navbar-nav menu_nav ml-auto" style="margin-right:150px;">
                                    <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                                           aria-haspopup="true" aria-expanded="false">Pages</a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a class="nav-link" href="registration.html">Register</a></li>
                                            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                                            <li class="nav-item"><a class="nav-link" href="mainController?action=viewcart">View Cart</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <div>
                                    <nav class="navbar navbar-light bg-light">
                                        <form action="mainController" method="post" class="form-inline">
                                            <input type="text" class="form-control" placeholder="Search" name="txtsearch" value="<%= (request.getParameter("txtsearch") == null) ? "" : request.getParameter("txtsearch")%>">
                                            <select name="searchby" style="height:30px; color: black" >
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        Action <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><option value="byname">By name</option></li>
                                                        <li><option value="bycate">By category</option></li>
                                                    </ul>
                                                </div>
                                            </select>
                                            <button type="submit" value="search" name="action" class="btn btn-outline-warning my-2 my-sm-0">Search</button>
                                        </form>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
        </c:if>

        <c:if test="${sessionScope.role eq 1}">
            <header class="header_area sticky-header">
                <div class="main_menu">
                    <nav class="navbar navbar-expand-lg navbar-light main_box ">
                        <div class="container" style="height:80px;">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <a class="navbar-brand logo_h" href="index.jsp">Daisy</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                                <ul class="nav navbar-nav menu_nav ml-auto justify-content-between" style="margin-right:600px;">
                                    <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                                           aria-haspopup="true" aria-expanded="false">Pages</a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a class="nav-link" href="mainController?action=manageAccounts">Manage Accounts</a></li>
                                            <li class="nav-item"><a class="nav-link" href="mainController?action=manageOrders">Manage Orders</a></li>
                                            <li class="nav-item"><a class="nav-link" href="mainController?action=managePlants">Manage Plants</a></li>
                                            <li class="nav-item"><a class="nav-link" href="mainController?action=manageCategories">Manage Categories</a></li>
                                            <li class="nav-item"><a class="nav-link" href="mainController?action=logout">Log out</a></li>
                                        </ul>
                                    <li class="nav-item"><a class="nav-link"">Welcome ${sessionScope.name}!</a></li>
                                    </li>                                                           
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
        </c:if>
        <c:if test="${sessionScope.role eq 0}">
            <header class="header_area sticky-header">
                <div class="main_menu">
                    <nav class="navbar navbar-expand-lg navbar-light main_box ">
                        <div class="container" style="height:80px;">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <a class="navbar-brand logo_h" href="index.jsp">Daisy</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                                <ul class="nav navbar-nav menu_nav ml-auto justify-content-between">
                                    <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                                    <li class="nav-item"><a class="nav-link" href="mainController?action=personalPage">Personal Page</a></li>
                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                                           aria-haspopup="true" aria-expanded="false">Pages</a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a class="nav-link" href="changeProfile.jsp">Change Profile</a></li>
                                            <li class="nav-item"><a class="nav-link" href="completedOrders.jsp">Completed Orders</a></li>
                                            <li class="nav-item"><a class="nav-link" href="processingOrders.jsp">Processing Orders</a></li>
                                            <li class="nav-item"><a class="nav-link" href="canceledOrders.jsp">Canceled Orders</a></li>
                                            <li class="nav-item"><a class="nav-link" href="mainController?action=viewcart">View Cart</a></li>
                                            <li class="nav-item"><a class="nav-link" href="mainController?action=logout">Log out</a></li>
                                        </ul>
                                    </li>                            
                                    <nav class="navbar navbar-light bg-light">
                                        <form action="mainController" method="post" class="form-inline">
                                            <div class="form-group" style="color:black; background-color: white" >From
                                                <input type="text" class="form-control" required="" placeholder="yyyy-mm-dd" name="txtord1" value="<%= (request.getParameter("txtord1") == null) ? "" : request.getParameter("txtord1")%>">
                                            </div>
                                            <div class="form-group" style="color:black">To
                                                <input type="text" class="form-control" required="" placeholder="yyyy-mm-dd" name="txtord2" value="<%= (request.getParameter("txtord2") == null) ? "" : request.getParameter("txtord2")%>">
                                            </div>
                                            <button type="submit" value="searchByDate" name="action" class="btn btn-outline-warning my-2 my-sm-0">Search</button>
                                        </form>

                                    </nav>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
        </c:if>

        <!--        <header>
                    <div class="container-fluid">
                        Nội dung Menu
                        <nav class="navbar navbar-inverse bg-primary" role="navigation">
                            <div class="container-fluid">
                                 Brand and toggle get grouped for better mobile display 
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                                            data-target="#bs-example-navbar-collapse-1">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
        
                                </div>
        
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav">
        
                                        <li><a href="index.jsp">Home</a></li>
                                        <li><a href="registration.jsp">Register</a></li>
                                        <li><a href="login.jsp">Login</a></li>
                                        <li><a href="mainController?action=viewcart">View Cart</a></li>
                                        
                                    </ul>
                                    <form action="mainController" method="post" class="formsearch navbar-form navbar-right">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search" name="txtsearch" value="<%= (request.getParameter("txtsearch") == null) ? "" : request.getParameter("txtsearch")%>">
                                        </div>
        
                                        <select name="searchby" style="height:30px; color: black" >
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Action <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li><option value="byname">By name</option></li>
                                                    <li><option value="bycate">By category</option></li>
                                                </ul>
                                            </div>
                                        </select>
                                        <button type="submit" value="search" name="action" class="btn btn-default">Search</button>
                                    </form>
                                </div>
                                 /.navbar-collapse 
                            </div>
                             /.container-fluid 
                        </nav>
                </header>-->
        <script src="js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/countdown.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="js/gmaps.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
