<%-- 
    Document   : login
    Created on : Dec 23, 2016, 12:22:42 PM
    Author     : tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="resources/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
       
        <%
            String login_err = "";
            if (request.getAttribute("login_err")!=null) {
                   login_err =  (String)request.getAttribute("login_err");
            }
        %>
                
        <div id="wrapper">
            <div id="rightContent">
                <form action="LoginServlet" method="POST" style="text-align: center; margin-right: 150px;">
                    <input type="text" name="name" value="" placeholder="name..." />
                    <input type="password" name="password" value="" placeholder="password" />
                    <input type="submit" value="Login" name="login" />
                </form>
                <p style="color: red;"><%=login_err%></p>
            </div>
        
        <div class="clear"></div>
        <jsp:include page="/admin/footer.jsp"></jsp:include>
       </div>
    </body>
</html>
