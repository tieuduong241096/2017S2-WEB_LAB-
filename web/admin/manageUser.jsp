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

            String query = "Select * from user";

            ResultSet rs = Controller.queryExecute(query);
            out.println("<table class='data' border=1>");
            out.println("<tr class='data'>");
            out.println("<th class='data'><b><center>User ID</center></b></th>");
            out.println("<th class='data'><b><center>User name</center></b></th>");
            out.println("<th class='data'>||</th>");
            out.println("<th class='data'><b><center>Password</center></b></th>");
            out.println("<th class='data'><b><center>Full name</center></b></th>");
            out.println("<th class='data'><b><center>Status</center></b></th>");
            out.println("<th class='data'><b><center>Age</center></b></th>");
            out.println("<th class='data'><b><center>Gender</center></b></th>");
            out.println("<th class='data'><b><center>Address</center></b></th>");
            out.println("<th class='data'><b><center>Email</center></b></th>");
            out.println("<th class='data'><b><center>Phone</center></b></th>");
            out.println("<th class='data'><b>Action</b></th>");
            out.println("</tr>");

            while (rs.next()) {
                String uid = rs.getString("userid");
                String un = rs.getString("username");
                String pass = rs.getString("password");
                String fn = rs.getString("fullname");
                String s = rs.getString("status");
                String age = rs.getString("age");
                String g = rs.getString("gender");
                String a = rs.getString("address");
                String e = rs.getString("email");
                String p = rs.getString("phone");
                out.println("<tr><td align=center>" + uid + "</td>");
                out.println("<td align=left>" + un + "</a></td>");
                out.println("<td><td align=left>" + pass + "</td>");
                out.println("<td align=left>" + fn + "</a></td>");
                out.println("<td align=left>" + s + "</a></td>");
                out.println("<td align=left>" + age + "</a></td>");
                out.println("<td align=left>" + g + "</a></td>");
                out.println("<td align=left>" + a + "</a></td>");
                out.println("<td align=left>" + e + "</a></td>");
                out.println("<td align=left>" + p + "</a></td>");
                out.println("<td><a href=\"../Action/edit.jsp?id=" + uid + "\">Edit</a> | ");
                out.println("<a href=\"../Action/delete.jsp?id=" + uid + "\">Delete</a></td>");
                out.println("</tr>");

            }
            out.println("</table>");

            rs.close();
        %>
        <br>
        <a href="../Action/add.jsp">New User</a><br/>
        <hr>
	</div>
        <div class="clear"></div>
        <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
