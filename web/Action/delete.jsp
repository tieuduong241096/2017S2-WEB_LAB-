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
            String cid = (request.getParameter("cid"));
            //String bid = (request.getParameter("bid"));
            out.println("<h1>" + cid + "</h1>");
            String query = "delete from category where categoryid = " + cid;
            try{
                Controller.updateExecute(query);
                response.sendRedirect("../admin/manageCategory.jsp");
            }
            catch(Exception e){
                out.println("<script type=\"text/javascript\">");
   out.println("alert('Cannot delete this category!');");
   out.println("location='../admin/manageCategory.jsp';");
   out.println("</script>");
} 

            
        %>        
    </body>
</html>
