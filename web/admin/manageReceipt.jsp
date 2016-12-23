<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.Controller"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        

<c:set var="root" value="${pageContext.request.contextPath}"/>
<link href="${root}/resources/css/mos-style.css" rel='stylesheet' type='text/css' />

        
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        
        <div id="wrapper">
        <jsp:include page="menu.jsp"></jsp:include>
       <div id="rightContent">
	        <h1>Category's Info</h1>
	
	<div class="informasi">
	ini adalah notifikasi pertanda informasi
	</div>
	
	<div class="gagal">
	ini adalah notifikasi pertanda gagal
	</div>
	
	<div class="sukses">
	ini adalah notifikasi pertanda sukses
	</div>
		<%

            String query = "Select * from receipt";

            ResultSet rs = Controller.queryExecute(query);
            out.println("<table class='data' border=1>");
            out.println("<tr class='data'>");
            out.println("<th class='data'><b><center>Receipt ID</center></b></th>");
            out.println("<th class='data'><b><center>Book date</center></b></th>");
            out.println("<th class='data'>||</th>");
            out.println("<th class='data'><b><center>Pay mode</center></b></th>");
            out.println("<th class='data'><b><center>Ship date</center></b></th>");
            out.println("<th class='data'><b><center>Ship address</center></b></th>");
            out.println("<th class='data'><b><center>User ID</center></b></th>");
            out.println("<th class='data'><b><center>Status</center></b></th>");
            out.println("</tr>");

            while (rs.next()) {
                String rid = rs.getString("receiptid");
                String bd = rs.getString("bookdate");
                String pm = rs.getString("paymode");
                String sd = rs.getString("shipdate");
                String sa = rs.getString("shipaddress");
                String uid = rs.getString("userid");
                String s = rs.getString("status");
                out.println("<tr><td align=center>" + rid + "</td>");
                out.println("<td align=left>" + bd + "</a></td>");
                out.println("<td><td align=left>" + pm + "</td>");
                out.println("<td align=left>" + sd + "</a></td>");
                out.println("<td align=left>" + sa + "</a></td>");
                out.println("<td align=left>" + uid + "</a></td>");
                out.println("<td align=left>" + s + "</a></td>");
                out.println("</tr>");

            }
            out.println("</table>");

            rs.close();
        %>
        <br>
        <hr>
	</div>
        <div class="clear"></div>
        <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
