<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*"%>
<%@page import="connect.Controller"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            String id = (request.getParameter("cid"));
            out.println("<h1>" + id + "</h1>");
            String query = "delete from category where categoryid = " + id;
            Controller.updateExecute(query);
            response.sendRedirect("../admin/manageCategory.jsp");
        %>        
    </body>
</html>
