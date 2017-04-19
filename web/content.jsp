<%-- 
    Document   : item
    Created on : Dec 25, 2016, 9:36:17 AM
    Author     : tuan
--%>


<%@page import="model.Brand"%>
<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page import="dao.CategoryDAO"%>
<%

    String categoryRequest = "";//request.getParameter("category") == null ? "" : request.getParameter("category");
    String brandRequest = "";//request.getParameter("brand") == null ? "" : request.getParameter("brand");
    ProductDAOImpl pro = new ProductDAOImpl();

    
    int total = 0;
    if (!categoryRequest.equals("")) {
        total = new Integer(pro.countNumberOfProductByCategory(new Category(Long.parseLong(categoryRequest.substring(1))))).intValue();
    } else if (!brandRequest.equals("")) {
        total = new Integer(pro.countNumberOfProductByBrand(new Brand(Long.parseLong(brandRequest.substring(1))))).intValue();
    } else {
        total = pro.countNumberOfProduct();
    }

    
    
    int rowsPerPage = 6;
    int current = 1;

    if (request.getParameter("p") != null) {
        current = Integer.parseInt(request.getParameter("p"));
    }

    int end = (int) Math.ceil(total * 1.0 / rowsPerPage);

    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }

%>





<!-- Neu user chon category de xem sp-->
<% if (!categoryRequest.equals("")) {%>
<%
    if (current <= end) {
        
%>
<% if (categoryRequest.startsWith("c")) {%>

<% for (Product p : new ProductDAOImpl().getPageList((rowsPerPage * (current - 1)) + rowsPerPage, rowsPerPage * (current - 1), "cat", pro.getProductListByCategory(categoryRequest.substring(1), ""))) {%>
<div class="col-sm-4">
    <div class="product-image-wrapper">
        <div class="single-products">
            <div class="productinfo text-center">
                <a href="javascript:void(0)" class="menudetail" data-id="<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""></a>
                <h2>$<%= new Double(p.getProductPrice()).intValue()%></h2>
                <p><%= p.getProductName()%></p>
                <a href="CartServlet?action=cart&command=insert&productid=<%=p.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
            </div>

        </div>
        <div class="choose">
            <ul class="nav nav-pills nav-justified">

                <li><a href="javascript:void(0)" class="menudetail" data-id="<%= p.getProductID()%>"><i class="fa fa-plus-square"></i>More Detail</a></li>
            </ul>
        </div>
    </div>
</div>

<%}%>

<%}%>


<a class="next-selector" href="content.jsp?p=<%=current + 1%>&category=<%=categoryRequest%>">Load more...</a>

<%}%>
<%}%>

<!--Neu nguoi dung chon brand de xem sp -->
<% if (!brandRequest.equals("")) {%>
<%
    if (current <= end) {
       System.err.println(current+ " "+ end);

%>
<% if (brandRequest.startsWith("b")) {%>

<% for (Product p : new ProductDAOImpl().getPageList((rowsPerPage * (current - 1)) + rowsPerPage, rowsPerPage * (current - 1), "bra", pro.getProductListByBrand(brandRequest.substring(1), ""))) {%>
<div class="col-sm-4">
    <div class="product-image-wrapper">
        <div class="single-products">
            <div class="productinfo text-center">
                <a href="javascript:void(0)" class="menudetail" data-id="<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""></a>
                <h2>$<%= new Double(p.getProductPrice()).intValue()%></h2>
                <p><%= p.getProductName()%></p>
                <a href="CartServlet?action=cart&command=insert&productid=<%=p.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
            </div>

        </div>
        <div class="choose">
            <ul class="nav nav-pills nav-justified">

                <li><a href="javascript:void(0)" class="menudetail" data-id="<%= p.getProductID()%>"><i class="fa fa-plus-square"></i>More Detail</a></li>
            </ul>
        </div>
    </div>

</div>
<%}%>
<%}%>

<a class="next-selector" href="content.jsp?p=<%=current + 1%>&brand=<%=brandRequest%>">Load more...</a>

<%}%>
<%}%>


<!-- Neu k chon brand hay category thi load nhung sp mac dinh len -->
<% if (categoryRequest.equals("") && brandRequest.equals("")) {%>
<%
    if (current <= end) {

%>
<% for (Product p : new ProductDAOImpl().getPageList((rowsPerPage * (current - 1)) + rowsPerPage, rowsPerPage * (current - 1), "pro", pro.getProductList(""))) {%>
<div class="col-sm-4">

    <div class="product-image-wrapper">
        <div class="single-products">
            <div class="productinfo text-center">
                <a href="javascript:void(0)" class="menudetail" data-id="<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""></a>
                <h2>$<%= new Double(p.getProductPrice()).intValue()%></h2>
                <p><%= p.getProductName()%></p>
                <a href="CartServlet?action=cart&command=insert&productid=<%=p.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
            </div>

        </div>
        <div class="choose">
            <ul class="nav nav-pills nav-justified">

                <li><a href="javascript:void(0)" class="menudetail" data-id="<%= p.getProductID()%>"><i class="fa fa-plus-square"></i>More Detail</a></li>
            </ul>
        </div>
    </div>

</div>

<%}%>

<a class="next-selector" href="content.jsp?p=<%=current + 1%>">Load more...</a>
<%}%>
<%}%>




