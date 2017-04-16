<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page import="model.Admin"%>
<%@page import="dao.AdminDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        


        <link href="../resources/css/mos-style.css" rel='stylesheet' type='text/css' />
        <script src="../resources/js/jquery.js"></script>
        <script src="../resources/js/jquery-1.9.0.min.js"></script>
        <script src="../resources/js/jquery-1.7.1.min.js"></script>
        <script src="../resources/ajax/adminNavigate.js"></script>
        
        
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        
        <div id="wrapper">
        <jsp:include page="menu.jsp"></jsp:include>
        <jsp:include page="content.jsp"></jsp:include>
        <div class="clear"></div>
        <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
