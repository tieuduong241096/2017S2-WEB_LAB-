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
        <jsp:include page="../admin/header.jsp"></jsp:include>
        
        <div id="wrapper">
        <jsp:include page="../admin/menu.jsp"></jsp:include>
       <div id="rightContent">
	        <h1>Staff's Info Manage</h1>
	
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
            Integer cid = Integer.parseInt(request.getParameter("cid"));
            String cname = request.getParameter("cname");
            String bid = request.getParameter("bid");
            if (cid != null && cname != null) {
                String query = "insert into category(categoryid,categoryname,brandid) values('"
                        + cid + "','" + cname + "','" + bid + "')";
                Controller.updateExecute(query);
                response.sendRedirect("../admin/manageCategory.jsp");
                return;
            }
        %>     
        <br>
        <hr>
	</div>
        <div class="clear"></div>
        <jsp:include page="../admin/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
