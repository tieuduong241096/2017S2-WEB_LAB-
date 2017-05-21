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
        
        
        
        
        
        
        
        
        
        <%----- addLibrary ----%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="ContentType" content="text/html" charset="utf-8"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/my-script.js"></script>
        <script src="js/base-ajax.js"></script>
        <link href="css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"glyphicon glyphicon-headphones />
    

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
                            <li><a href="error.jsp"><span></span>Dịch vụ hổ trợ trưc tuyến</a>
                               
                            </li>
                        </ul>
                        <ul class="support">
                            <li class="van"><a href="error.jsp"><label> </label></a></li>
                            <li><a href="error.jsp"><span></span>Miễn phí giao hàng cho hoá đơn trên 500k</a></li>
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
                        
                        
                        
                        
                        <%------Old
            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                            
                             <div class="logo">
                                <a href="index.jsp">E-<span>COMMERCE</span></a>
                             </div>
                            
                            
                            
                            <div class="logo pull-left">
                                <a href="index.jsp"><img src="resources/images/home/Logomakr_2HHT9q.png" alt="" /></a>

                            </div>
                            
                          


                        </div>
                            
                        
                            
                        <div class="col-sm-4">
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
            -----%>
                        
                        
       <div class="bottom-header">
        <div class="row">
            <div class="col-md-3 header-bottom-left">
                <div class="logo">
                    <a href="index.jsp">E-<span>COMMERCE</span></a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="search1">
                    <%-- <input type="text" value="" placeholder="Nhập từ khoá" > --%>
                    <input type="text" class="search" id="inputSearch" autocomplete="off" placeholder="Nhập từ khoá" />
                    <p style="color: red" id="searcherr"></p>
                    <div id="divResult">
                        
                    </div>

                </div>
                
            </div>

         

               <%--- <% if (ush.getAccrole() == UserRole.GUEST) {%>    ---%>
               <div class="col-md-2 header-bottom-right">
                   <% if(s.getAttribute("username") != null) { %>
                   <div class="account"><a><span></span>Xin chào <%=s.getAttribute("email")%></a></div>
                   <% } else {%>
                    <div class="account"><a href="login.jsp"><span></span>Tài khoản của tôi</a></div>
                    <% } %>
               </div>
               
               <div class="col-md-2 header-bottom-right">
                <ul class="login">
                    <% if(s.getAttribute("username") != null) { %>
                    <li><a href="account.jsp?account=<%=s.getAttribute("email")%>"><span> </span>Tài khoản</a></li>
                    <li><a data-toggle="modal" data-target="#registerModal">| Đăng xuất</a></li>
                    <% } else {%>
                    <li><a href="login.jsp"><span> </span>Đăng nhập</a></li>
                    <li><a data-toggle="modal" data-target="#registerModal">| Đăng ký</a></li>
                    <% } %>
                </ul>
                    
               </div>
        <%---        <% } else {
                    String settings = "";
                    if (ush.getAccrole().equals(UserRole.ADMINISTRATOR)) {
                        settings = "admin.jsp";
                        cartSettings = "data-toggle=\"modal\" data-target=\"#myModal\"";
                    } else if (ush.getAccrole().equals(UserRole.CUSTOMER)) {
                        settings = "account.jsp";
                        cartSettings = "data-toggle=\"modal\" data-target=\"#myModal\"";
                    } else if (ush.getAccrole().equals(UserRole.STAFF)) {
                        settings = "staff.jsp";
                        cartSettings = "data-toggle=\"modal\" data-target=\"#myModal\"";
                    }

                %>     ---%>
                
                <%----
                <div class="account"><a href="#"><span></span><%=map.get("account.welcome")%><%=ush.getAccname()%></a></div>
                <ul class="login">
                    <li><a href="<%=settings%>"><span> </span><%=map.get("account.setting")%> </a></li> 
                    <li><a href="logout">| <%=map.get("logout")%> </a></li>
                </ul>
                <%}%>
                
                ----%>
                
                <div class="col-md-2 header-bottom-right">
                    <div class="cart"><a href="cart.jsp"><span></span>Giỏ hàng</a></div>
                </div>
                
                
                
               
          

           	
        </div>
    </div>
</div>


        </header><!--/header-->
    </body>
</html>
