<%-- 
    Document   : header
    Created on : Oct 12, 2016, 3:54:58 PM
    Author     : tuan
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.TreeMap"%>
<%@page import="model.Product"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
        <!--Use Jquery to save cookie-->
        <script src="resources/js/js.cookie.js"></script>
        <script type="text/javascript">
                function fade_out() {
                    
                   
                   var dataString = $('.promptDiv').val();
                    $.ajax({
                            type: "POST",
                            url: "SessionServlet",
                            data: {dataString: dataString},
                            cache: false,
                            success: function (html) {
                                $('.promptDiv').remove();

                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                if (xhr.status == 404) {
                                    alert(thrownError);
                                }
                            }
                        });
                }
                $(function() {
                    setTimeout(fade_out, 5000);
                });
                
                function blinker() {
                    $('.promptDiv').fadeOut(500);
                    $('.promptDiv').fadeIn(500);
                }
                setInterval(blinker, 1000);

                

                
            
            
        </script>

    </head>
    <body>
        <%

            HashMap<Product, Integer> list = null;
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


        %>
        <%  String successPrompt = "";
        
            if(request.getSession().getAttribute("success")!=null){
                successPrompt = (String)request.getSession().getAttribute("success");
            }
            
        %>
        
        <header id="header"><!--header-->
            
            <%-----
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href="#"><i class="fa fa-phone"></i> +84 0123456789</a></li>
                                    <li><a href="#"><i class="fa fa-envelope"></i> ShoeStore@gmail.com</a></li>
                                    <li class="promptDiv"><a href="#" style="color: red;font-weight: bold"><%=successPrompt%></a></li>
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
            
            ----%>
            
            <%-----Header Top-----%>
            <div class="header">
            <div class="top-header">
                <div class="container">
                    <div class="top-header-left">
                        <ul class="support">
                            <li><a href="error.jsp"><label> </label></a></li>
                            <li><a href="error.jsp">Dịch vụ hổ trợ trưc tuyến<span class="live"></span></a>
                               
                            </li>
                        </ul>
                        <ul class="support">
                            <li class="van"><a href="error.jsp"><label> </label></a></li>
                            <li><a href="error.jsp">Miễn phí giao hàng cho hoá đơn trên 500k<span class="live"></span></a></li>
                        </ul>
                    </div>
                    <div class="top-header-right">
                        <ul class="support">
                            <li><a href="language?lang=vi">Tiếng Việt</a><a href="#">|</a> 
                            <li><a href="language?lang=en">English</a>
                        </ul>        
                    </div>
                </div>
                <!---->
                <div class="clearfix"> </div>	
            </div>
            <div class="clearfix"> </div>		
        </div>
                        
                        <%-----/////Header Top-----%>
                        
                        
                        
                        

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
                                    <li><a href="account.jsp?account=<%=s.getAttribute("email")%>"><i class="fa fa-user"></i> <%=s.getAttribute("email")%></a></li>
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
