<%-- 
    Document   : header
    Created on : Oct 12, 2016, 3:54:58 PM
    Author     : tuan
--%>

<%@page import="java.util.TreeMap"%>
<%@page import="model.Product"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>

        <!--        CSS
                <link href="/resources/css/animate.css" rel="stylesheet">
                <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

                <link href="/resources/css/main.css" rel="stylesheet">
                <link href="/resources/css/prettyPhoto.css"  rel="stylesheet">
                <link href="/resources/css/price-range.css"  rel="stylesheet">
                <link href="/resources/css/responsive.css"  rel="stylesheet">
        
        
        
                Script
                <script src="/resources/js/bootstrap.min.js" type="text/javascript"></script>
                <script src="/resources/js/contact.js" type="text/javascript"></script>
                <script src="/resources/js/gmaps.js" type="text/javascript"></script>
                <script src="/resources/js/html5shiv.js" type="text/javascript"></script>
                <script src="/resources/js/jquery.js" type="text/javascript"></script>
                <script src="/resources/js/jquery.prettyPhoto.js" type="text/javascript"></script>
                <script src="/resources/js/jquery.scrollUp.min.js" type="text/javascript"></script>
                <script src="/resources/js/main.js" type="text/javascript"></script>
                <script src="/resources/js/price-range.js" type="text/javascript"></script>-->
        <!--        <link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
                <link href="/resources/css/font-awesome.min.css" rel="stylesheet">-->
    </head>
    <body>
        <%
            
            TreeMap<Product, Integer> list = null;
            if (session.getAttribute("cart") != null) {
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = new Cart();
                    session.setAttribute("cart", cart);
                }

                list = cart.getList();
            }

            if (session.getAttribute("cart") == null) {
                Cart cart = new Cart();

                list = null;
            }
            
            int num = list==null?0:list.size();
            
            //session
            HttpSession s = request.getSession();
            

//            //cookie
//            Cookie[] cookies = request.getCookies();
//            String c = "";
//            for(Cookie cookie: cookies){
//                if(cookie.getName().equalsIgnoreCase("username")){
//                    c = cookie.getName();
//                }
//            }
        
        %>
        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href="#"><i class="fa fa-phone"></i> +84 0123456789</a></li>
                                    <li><a href="#"><i class="fa fa-envelope"></i> ShoeStore@gmail.com</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="social-icons pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header_top-->

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
                            </div>
                            

                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <%if(s.getAttribute("username")!=null){%>
                                        <li><a href="#"><i class="fa fa-user"></i> Account</a></li>
                                    <%}%>
                                    
                                    <li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i><span style="color: red"> <%= num%></span></a>



                                    </li>
                                    <%if(s.getAttribute("username")!=null){%>
                                        <li><a href="AccountController?action=signout"><i class="fa fa-sign-out"></i> Sign out</a></li>
                                    <%}%>
                                    <%if(s.getAttribute("username")==null){%>
                                    <li><a href="login.jsp"><i class="fa fa-lock"></i> Login</a></li>
                                    <%}%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->

            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="index.jsp" class="active">Home</a></li>
                                    <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="product.html">Products</a></li>
                                            <li><a href="detail.html">Product Details</a></li> 
                                            <li><a href="checkout.html">Checkout</a></li> 
                                            <li><a href="cart.html">Cart</a></li> 
                                            <li><a href="account.html">Login</a></li> 
                                        </ul>
                                    </li> 
                                    <li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="blog.html">Blog List</a></li>
                                            <li><a href="blog-single.html">Blog Single</a></li>
                                        </ul>
                                    </li> 
                                    <li><a href="404.html">404</a></li>
                                    <li><a href="contactUs.html">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="search_box pull-right90">
                                <input type="text" placeholder="Search"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->
    </body>
</html>
