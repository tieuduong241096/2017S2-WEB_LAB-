<%-- 
    Document   : handleProduct
    Created on : Dec 21, 2016, 8:39:40 PM
    Author     : LMD0207
--%>

<%@page import="dao.CategoryDAOImpl"%>
<%@page import="model.Category"%>
<%@page import="dao.BrandDAOImpl"%>
<%@page import="model.Brand"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>CATEGORY MENU</title>        


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
                
                    <form action="../AdminProductServlet" method="POST" enctype="multipart/form-data">
                        <%if (!id.equals("")) {%>
                          <input type="hidden" name="id" id="id" style="margin-left: 68px;
                                     padding-right: 25px;" value="<%=id%>"><br/>
                                <input type="hidden" name="action" value="edit"/>
                        <%}%>
                        <%if (id.equals("")) {%>
                        <input type="hidden" name="action" value="add"/>
                        <%}%>
                    
                        Name:     <input type="text" name="name" style="margin-left: 47px;
                                         padding-right: 69px;"><br/>
                        Price:    <input type="text" name="price" style="margin-left: 52px;
                                         padding-right: 69px;"><br/>
                        Image:  <input type="file" name="uploadfile" style="margin-left: 46px;
                                         padding-right: 0px; "/><br/>
                        Quantity: <input type="numeber" name="quantity" style="    margin-left: 35px;
                                         padding-right: 69px;"><br/>
                        Description: <input type="text" name="description" style="    padding-right: 69px;
                                            margin-left: 18px;"><br/>
                        Discount: <input type="text" name="discount" style="margin-left: 32px;
                                         padding-right: 69px;"><br/>
                        Brand: <select name="brand">
                            <%for(Brand brand:new BrandDAOImpl().getBrandList("")){%>
                            <option><%=brand.getBrandName()%></option>
                            <%}%>
                        </select>
                        Category:
                        <select name="category">
                            <%for(Category category: new CategoryDAOImpl().getCategoryList("")){%>
                            <option><%=category.getCategoryName()%></option>
                            <%}%>
                        </select>
                        <input type="submit" value="Submit" style="margin-left: 86px"/>
                    </form>
                    <div class="clear"></div>

                <jsp:include page="footer.jsp"></jsp:include>
            </div>
    </body>
</html>
