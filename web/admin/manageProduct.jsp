<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page import="dao.BrandDAOImpl"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="dao.ProductDAO"%>
<%@page import="dao.ProductDAOImpl"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>CATEGORY MENU</title>        

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/resources/css/mos-style.css" rel='stylesheet' type='text/css' />


    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Tabel</h3>

                    <div class="informasi">
                        ini adalah notifikasi pertanda informasi
                    </div>

                    <div class="gagal">
                        ini adalah notifikasi pertanda gagal
                    </div>

                    <div class="sukses">
                        ini adalah notifikasi pertanda sukses

                    <%
                        ProductDAOImpl proDAO = new ProductDAOImpl();
                        BrandDAOImpl braDAO = new BrandDAOImpl();
                    %>
                </div>
                <table class="data">
                    <tr class="data">
                        <th class="data">ID</th>
                        <th class="data">Name</th>
                        <th class="data">Price</th>
                        <th class="data">Image</th>
                        <th class="data">Quantity</th>
                        <th class="data">Description</th>
                        <th class="data">Discount</th>
                        <th class="data">Brand</th>
                        <th class="data">Category</th>
                        <th class="data">Modify</th>
                       

                    </tr>
                    <% for (Product product : proDAO.getProductList("")) { %>
                    <tr>
                        <td><%=product.getProductID()%></td>
                        <td><%=product.getProductName()%></td>
                        <td><%=product.getProductPrice()%></td>
                        <td><img src=../resources/images/user/<%=product.getProductImage()%>" alt=""/></td>
                        <td><%=product.getProductQuantity()%></td>
                        <td><%=product.getDescription()%></td>
                        <td><%=product.getDiscount()%></td>
                        <td><%=braDAO.getBrandNameByBrandID(new Long(product.getBrand().getBrandID()).toString())%></td>
                        <td><%=product.getProductID()%></td>
                        <td><a href="????">edit</a> | <a href="????">delete</a></td>
                    </tr>
                    <%}%>
                    <div class="clear"></div>
                    <jsp:include page="footer.jsp"></jsp:include>
            </div>
    </body>
</html>
