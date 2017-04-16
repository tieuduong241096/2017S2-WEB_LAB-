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


<%
    BrandDAOImpl braDAO = new BrandDAOImpl();
%>
<p><a href="handleBrand.jsp?id=empty&name=empty">Add new Brand</a></p>
<h3>Brand 's Info</h3>
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



</div>

