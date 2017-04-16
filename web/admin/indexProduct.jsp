<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page import="dao.CategoryDAOImpl"%>
<%@page import="dao.AdminDAOImpl"%>
<%@page import="model.Admin"%>
<%@page import="dao.BrandDAOImpl"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.ProductDAO"%>
<%@page import="dao.ProductDAOImpl"%>


<%
    ProductDAOImpl proDAO = new ProductDAOImpl();
    BrandDAOImpl braDAO = new BrandDAOImpl();
%>
<p><a href="insertProduct.jsp">Add new Product</a></p>
<h3>Product's Info</h3>
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
    <% for (Product product : proDAO.getProductList(" order by productid desc")) {%>
    <tr>
        <td><%=product.getProductID()%></td>
        <td><%=product.getProductName()%></td>
        <td><%=product.getProductPrice()%></td>
        <td><img style="width: 100px; height: 100px;" src="../resources/images/user/<%=product.getProductImage()%>" alt=""/></td>
        <td><%=product.getProductQuantity()%></td>
        <td><%=product.getDescription() == null ? "" : product.getDescription()%></td>
        <td><%=product.getDiscount()%></td>
        <td><%=braDAO.getBrandNameByBrandID(new Long(product.getBrand().getBrandID()).toString())%></td>
        <td><%=new CategoryDAOImpl().getCategoryNameByCategoryID(new Long(product.getCategory().getCategoryID()).toString())%></td>
        <td><a href="handleProduct.jsp?id=<%=product.getProductID()%>">edit</a> | <a href="../ProductServlet?action=delete">delete</a></td>
    </tr>
    <%}%>
</table>
</div>
<div class="clear"></div>


