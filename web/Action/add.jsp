<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.Controller"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        

<link href="../resources/css/mos-style.css" rel='stylesheet' type='text/css' />

        
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
        <h1>Add new Category into system!</h1>
       
        <form method="post" action="../Action/addtoSQL.jsp">
          <table>
                <tr>
                    <td>Category ID</td>
                    <td><input type="text" name="cid"></td>
                </tr>
                <tr>
                    <td>Category name</td>
                    <td><input type="text" name="cname"></td>
                </tr>
                <tr>
                    <td>Brand ID</td>
                    <td>
                        <select name="bid">
                            <%
            String query = "select brandid from brand";

            ResultSet rs = Controller.queryExecute(query);

            String bid ="";
            while(rs.next()) {
                
                bid = rs.getString("brandid");
                %><option><%=bid%>
            </option><%              
            }           
            rs.close();%>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="s3" value="Add"></td>
                    <td>
                        <input type="button" onclick="location.href='../admin/manageCategory.jsp';" value="Cancel" />
                    </td>
                </tr>
            </table>
            </form>        
        <br>
        <hr>
	</div>
        <div class="clear"></div>
        <jsp:include page="../admin/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
