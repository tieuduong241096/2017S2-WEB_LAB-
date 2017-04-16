<%-- 
    Document   : header
    Created on : Nov 18, 2016, 10:05:54 PM
    Author     : tuan
--%>

<%@page import="dao.AdminDAOImpl"%>
<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String un = (String) request.getSession().getAttribute("user");
   %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <div id="header">
	<div class="inHeader">
		<div class="mosAdmin">
		Hello, <%=un%><br>
		
		</div>
	<div class="clear"></div>
	</div>
</div>
    </body>
</html>
