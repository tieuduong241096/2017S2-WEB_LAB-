<%-- 
    Document   : header
    Created on : Nov 18, 2016, 10:05:54 PM
    Author     : tuan
--%>

<%@page import="dao.AdminDAOImpl"%>
<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%Cookie[] cookies = request.getCookies();
    Cookie c = null;
    
    for (int i = 0; i < cookies.length; i++) {
            c = cookies[i];
            if (new AdminDAOImpl().checkLogin(new Admin(c.getName(),c.getValue()))) {
                    
                    break;
                }
            
        }
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
		Hello, <%=c.getName()%><br>
		
		</div>
	<div class="clear"></div>
	</div>
</div>
    </body>
</html>
