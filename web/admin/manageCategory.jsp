<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page import="dao.AdminDAOImpl"%>
<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.Controller"%>
<!DOCTYPE html>
<%Cookie[] cookies = request.getCookies();
    Cookie c = null;
    boolean isLogin = false;
    for (int i = 0; i < cookies.length; i++) {
            c = cookies[i];
            if (new AdminDAOImpl().checkLogin(new Admin(c.getName(),c.getValue()))) {
                    isLogin = true;
                }
            
        }
    if (!isLogin) {
            response.sendRedirect("login.jsp");
        }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        


<link href="../resources/css/mos-style.css" rel='stylesheet' type='text/css' />

        
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        
        <div id="wrapper">
        <jsp:include page="menu.jsp"></jsp:include>
       <div id="rightContent">
	        <h1>Category's Info</h1>
	
	
		<%

            String query = "Select * from category";

            ResultSet rs = Controller.queryExecute(query);
            out.println("<table class='data' border=1>");
            out.println("<tr class='data'>");
            out.println("<th class='data'><b><center>Category ID</center></b></th>");
            out.println("<th class='data'><b><center>Category Name</center></b></th>");
            out.println("<th class='data'>||</th>");
            out.println("<th class='data'><b>Brand ID</b></th>");
            out.println("<th class='data'><b>Action</b></th>");
            out.println("</tr>");

            while (rs.next()) {
                String cid = rs.getString("categoryid");
                String cname = rs.getString("categoryname");
                String bid = rs.getString("brandid");
                out.println("<tr><td align=center>" + cid + "</td>");
                out.println("<td align=left>" + cname + "</a></td>");
                out.println("<td><td align=center>" + bid + "</td>");
                out.println("<td><a href=\"../Action/edit.jsp?id=" + cid + "\">Edit</a> | ");
                out.println("<a href=\"../Action/delete.jsp?id=" + cid + "\">Delete</a></td>");
                out.println("</tr>");

            }
            out.println("</table>");

            rs.close();
        %>
        <br>
        <a href="../Action/add.jsp">New Category</a><br/>
        <hr>
	</div>
        <div class="clear"></div>
        <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
