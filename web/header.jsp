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

            int num = list == null ? 0 : list.size();

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
                                <a href="index.jsp"><img src="resources/images/home/Logomakr_2HHT9q.png" alt="" /></a>
                            </div>


                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <%if (s.getAttribute("username") != null) {%>
                                    <li><a href="#"><i class="fa fa-user"></i> <%=s.getAttribute("email")%></a></li>
                                        <%}%>

                                    <li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i><span style="color: red"> <%= num%></span></a>



                                    </li>
                                    
                                        <%if (s.getAttribute("username") != null) {%>
                                    <li><a href="AccountController?action=signout"><i class="fa fa-sign-out"></i> Sign out</a></li>
                                    <li><a href="AccountController?action=feedback"><i class="fa fa-comments-o"></i> Feedback</a></li>
                                        <%}%>
                                        <%if (s.getAttribute("username") == null) {%>
                                    <li><a href="login.jsp"><i class="fa fa-lock"></i> Login</a></li>

                                    <%}%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->

            
            
        </header><!--/header-->
    </body>
</html>
