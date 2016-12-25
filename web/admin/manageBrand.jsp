<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page import="model.Brand"%>
<%@page import="dao.BrandDAOImpl"%>
<%@page import="dao.AdminDAOImpl"%>
<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


        <link href="../resources/css/mos-style.css" rel='stylesheet' type='text/css' />


    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">

                <%
                    BrandDAOImpl braDAO = new BrandDAOImpl();
                %>
                <table class="data">
                    <tr class="data">
                        <th class="data">Brand ID</th>
                        <th class="data">Brand Name</th>
                        <th class="data">Modify</th>
                    </tr>
                    <% for (Brand brand : braDAO.getBrandList("")) {%>
                    <tr>
                        <td><%=brand.getBrandID()%></td>
                        <td><%=brand.getBrandName()%></td>
                        <td><a href="handleBrand.jsp?id=<%=brand.getBrandID()%>&name=<%=brand.getBrandName()%>">edit</a> | <a href="../AdminBrandServlet?action=delete&id=<%=brand.getBrandID()%>&name=<%=brand.getBrandName()%>">delete</a></td>
                    </tr>
                    <%}%>
                </table>


                <div class="clear"></div>
                <p><a href="handleBrand.jsp?id=empty&name=empty">Add new Brand</a></p>


            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
