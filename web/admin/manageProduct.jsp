<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page import="dao.AdminDAOImpl"%>
<%@page import="model.Admin"%>
<%@page import="dao.BrandDAOImpl"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.ProductDAO"%>
<%@page import="dao.ProductDAOImpl"%>
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

        <title>CATEGORY MENU</title>        


        <link href="../resources/css/mos-style.css" rel='stylesheet' type='text/css' />


    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%
            ProductDAOImpl proDAO = new ProductDAOImpl();
            BrandDAOImpl braDAO = new BrandDAOImpl();
        %>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                
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
                        <td><a href="handleProduct.jsp?id=<%=product.getProductID()%>">edit</a> | <a href="../ProductServlet?action=delete">delete</a></td>
                    </tr>
                    <%}%>
                </table>
                     </div>
                    <div class="clear"></div>
                    <p><a href="handleProduct.jsp?id=empty">Add new Product</a></p>
                    <jsp:include page="footer.jsp"></jsp:include>
           
    </body>
</html>
