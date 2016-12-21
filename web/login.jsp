<%-- 
    Document   : account
    Created on : Oct 12, 2016, 5:22:03 PM
    Author     : tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account | S-LAB</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/css/font-awesome.min.css" rel="stylesheet">
        <link href="resources/css/prettyPhoto.css" rel="stylesheet">
        <link href="resources/css/price-range.css" rel="stylesheet">
        <link href="resources/css/animate.css" rel="stylesheet">
        <link href="resources/css/main.css" rel="stylesheet">
        <link href="resources/css/responsive.css" rel="stylesheet">


        <script src="resources/js/html5shiv.js"></script>
        <script src="javascript/validateAccount.js"></script>

        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery.scrollUp.min.js"></script>
        <script src="resources/js/price-range.js"></script>
        <script src="resources/js/jquery.prettyPhoto.js"></script>
        <script src="resources/js/main.js"></script>
    </head>
    <body>
        <!--HEADER-->
        <jsp:include page="header.jsp"></jsp:include>
        <%
            String username_err = "",password_err="",email_err="",fullname_err="",age_err="",address_err="",phone_err="",email_login_err="",login_err="";
            if (request.getAttribute("username_err")!=null) {
                   username_err =  (String)request.getAttribute("username_err");
            }
            if (request.getAttribute("password_err")!=null) {
                   password_err =  (String)request.getAttribute("password_err");
            }
            if (request.getAttribute("email_err")!=null) {
                   email_err =  (String)request.getAttribute("email_err");
            }
            if (request.getAttribute("fullname_err")!=null) {
                   fullname_err =  (String)request.getAttribute("fullname_err");
            }
            if (request.getAttribute("age_err")!=null) {
                   age_err =  (String)request.getAttribute("age_err");
            }
            if (request.getAttribute("address_err")!=null) {
                   address_err =  (String)request.getAttribute("address_err");
            }
            if (request.getAttribute("phone_err")!=null) {
                   phone_err =  (String)request.getAttribute("phone_err");
            }
            String username = "", password = "", email = "", fullname = "", age = "", address = "", phone = "";
            if (request.getAttribute("username")!=null) {
                   username =  (String)request.getAttribute("username");
            }
            
            if (request.getAttribute("email")!=null) {
                   email =  (String)request.getAttribute("email");
            }
            if (request.getAttribute("fullname")!=null) {
                   fullname =  (String)request.getAttribute("fullname");
            }
            if (request.getAttribute("age")!=null) {
                   age =  (String)request.getAttribute("age");
            }
            if (request.getAttribute("address")!=null) {
                   address =  (String)request.getAttribute("address");
            }
            if (request.getAttribute("phone")!=null) {
                   phone =  (String)request.getAttribute("phone");
            }
            
            if (request.getAttribute("email_login_err")!=null) {
                   email_login_err =  (String)request.getAttribute("email_login_err");
            }
            if (request.getAttribute("login_err")!=null) {
                   login_err =  (String)request.getAttribute("login_err");
            }
        
        %>

            
            <!--MAIN CONTENT + CATEGORY MENU-->
            <section id="form"><!--form-->
                
                <div class="container">
                    <div class="breadcrumbs">
                        <ol class="breadcrumb">
                            <li><a href="#">Home</a></li>
                            <li class="active">Login & Signup</li>
                        </ol>
            </div>
                    <div class="row">
                        <div class="col-sm-4 col-sm-offset-1">
                            <div class="login-form"><!--login form-->
                                <h2>Login to your account</h2>
                                <form action="AccountController" method="post">
                                    <p style="color: red"><%= email_login_err%></p>
                                    <p id="err8" style="color: red"></p>
                                    <input type="text" placeholder="Email Address" name ="email1" id="email1" oninput="checkEmail_login()" />
                                    
                                    <input type="password" placeholder="Password" name="password" />
                                    <p style="color: red"><%= login_err%></p>
                                    <span>
                                        <input type="checkbox" class="checkbox" name="remember"> 
                                        Keep me signed in
                                    </span>
                                    <input type="hidden" name="action" value="login" />
                                    <%if(request.getParameter("checkout").equals("true")){%><input type="hidden" name="checkout" value="checkout" /><%}%>
                                    <button type="submit" class="btn btn-default">Login</button>
                                </form>
                            </div><!--/login form-->
                        </div>
                        <div class="col-sm-1">
                            <h2 class="or">OR</h2>
                        </div>
                        <div class="col-sm-4">
                            <div class="signup-form"><!--sign up form-->
                                <h2>Sign Up!</h2>
                                <form action="AccountController" method="post" >
                                    <p style="color: red"><%= username_err%></p>
                                    <p id="err1" style="color: red"></p>
                                    <input type="text" placeholder="User Name" name="username" id="username" value="<%= username %>" oninput="checkUsername()"/>
                                    
                                    <p style="color: red"><%= password_err%></p>
                                    <p id="err2" style="color: red"></p>
                                    <input type="password" placeholder="Password" id="password" name="password" oninput="checkPassword()"/>
                                    
                                    <p style="color: red"><%= email_err%></p>
                                    <p id="err3" style="color: red"></p>
                                    <input type="text" placeholder="Email" name="email" id="email" value="<%= email %>" oninput="checkEmail()"/>
                                    
                                    <p style="color: red"><%= fullname_err%></p>
                                    <p id="err4" style="color: red"></p>
                                    <input type="text" placeholder="Full Name" name="fullname" id="fullname" value="<%= fullname %>" oninput="checkFullname()"/>
                                    
                                    <p style="color: red"><%= age_err%></p>
                                    <p id="err5" style="color: red"></p>
                                    <input type="number" placeholder="Age" name="age" id="age" min="18" max="30" style="width: 20%" value="<%= age %>" oninput="checkAge()"/>
                                    <div>
                                        Male<input type="radio" name="gender" value="male" checked="checked" style="height: 15px;width:20%"/>
                                        Female<input type="radio" name="gender" value="female" style="height: 15px;width: 20%"/>
                                    </div>
                                    
                                    <p style="color: red"><%= address_err%></p>
                                    <p id="err6" style="color: red"></p>
                                    <input type="text" placeholder="Address" name="address" id="address" value="<%= address %>" oninput="checkAddress()"/>
                                    
                                    <p style="color: red"><%= phone_err%></p>
                                    <p id="err7" style="color: red"></p>
                                    <input type="text" placeholder="Phone" name="phone" id="phone" value="<%= phone %>" oninput="checkPhone()"/>
                                    <input type="hidden" name="action" value="signup"/>
                                    <button type="submit" class="btn btn-default">Sign Up</button>
                                </form>
                            </div><!--/sign up form-->
                        </div>
                    </div>
                </div>
            </section><!--/form-->

            <!--FOOTER-->
        <jsp:include page="footer.jsp"></jsp:include>
        
    </body>
</html>
