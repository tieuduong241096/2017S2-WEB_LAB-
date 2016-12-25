<%-- 
    Document   : handleBrand
    Created on : Dec 22, 2016, 9:06:27 PM
    Author     : LMD0207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                <%
                    String id = request.getParameter("id");
                    if (id.equals("empty")) {
                        id = "";
                    }

                %>
                <form action="../AdminBrandServlet" method="POST">

                    <%if (!id.equals("")) {%>
                          <input type="hidden" name="id" id="id" style="margin-left: 68px;
                                     padding-right: 25px;" value="<%=id%>"><br/>
                                <input type="hidden" name="action" value="edit"/>
                    <%}%>
                    <%if (id.equals("")) {%>
                    <input type="hidden" name="action" value="add"/>
                    <%}%>
                    Name:     <input type="text" name="name" placeholder="Brand Name..." style="margin-left: 46px;
                                     padding-right: 25px;" value="<%= request.getParameter("name").equals("empty")?"":request.getParameter("name")%>"><br/><br/><br/>
                    <input type="submit" value="Submit" />
                </form>

            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
