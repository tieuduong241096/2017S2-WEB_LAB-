<%-- 
    Document   : recommendItem
    Created on : Mar 26, 2017, 4:39:20 PM
    Author     : Sean
--%>

<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ProductDAOImpl pro = new ProductDAOImpl();
            CategoryDAOImpl cat = new CategoryDAOImpl();
            String categoryRequest = request.getParameter("category") == null ? "" : request.getParameter("category");
            String brandRequest = request.getParameter("brand") == null ? "" : request.getParameter("brand");
            
        %>
    </head>
    <body>
        <!-- mac dinh-->
        <% if (categoryRequest.equals("") && brandRequest.equals("")) {%>
        <div class="category-tab"><!--category-tab-->


            <div class="col-sm-12">
                <ul class="nav nav-tabs">
                    <%for (Category cate : cat.getCategoryList("LIMIT 5")) {%>
                    <%if (cat.checkMin(cate)) {%>
                    <li class="active"><a href="#<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" data-toggle="tab"><%=cate.getCategoryName()%></a></li>
                        <%}%>
                        <%if (!cat.checkMin(cate)) {%>
                    <li><a href="#<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" data-toggle="tab"><%=cate.getCategoryName()%></a></li>
                        <%}%>

                    <%}%>
                </ul>
            </div>


            <div class="tab-content">


                <%for (Category cate : cat.getCategoryList("LIMIT 5")) { %>

                <% if (cat.checkMin(cate)) {%>

                <div class="tab-pane fade active in" id ="<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" >
                    <% for (Product prod : pro.getProductListByCategory(new Long(cate.getCategoryID()).toString(), "LIMIT 4")) {%>
                    <div class="col-sm-3">

                        <div class="product-image-wrapper">
                            <div class="single-products">

                                <div class="productinfo text-center">
                                    <a href="javascript:void(0)" class="menudetail" data-id="<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                    <h2>$<%= new Double(prod.getProductPrice()).intValue()%></h2>
                                    <p><%= prod.getProductName()%></p>
                                    <a href="CartServlet?action=cart&command=insert&productid=<%=prod.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
                <%}%>
                <% if (!cat.checkMin(cate)) {%>
                <div class="tab-pane fade" id ="<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" >
                    <% for (Product prod : pro.getProductListByCategory(new Long(cate.getCategoryID()).toString(), "LIMIT 4")) {%>
                    <div class="col-sm-3">

                        <div class="product-image-wrapper">
                            <div class="single-products">

                                <div class="productinfo text-center">
                                    <a href="javascript:void(0)" class="menudetail" data-id="<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                    <h2>$<%= new Double(prod.getProductPrice()).intValue()%></h2>
                                    <p><%= prod.getProductName()%></p>
                                    <a href="CartServlet?action=cart&command=insert&productid=<%=prod.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                </div>

                            </div>
                        </div>

                    </div>
                    <%}%>

                </div>
                <%}%>

                <%}%>
            </div>

        </div><!--/category-tab-->
        <%}%>


        <!--- khi user chon category thi hien dung brand cua category do len-->

        <% if (!categoryRequest.equals("")) {%>
        <div class="category-tab"><!--category-tab-->


            <div class="col-sm-12">
                <ul class="nav nav-tabs">
                    <%for (Category cate : cat.getCategoryListByBrand(cat.getBrandIDByCategoryID(categoryRequest.substring(1)), "LIMIT 5")) {%>
                    <%if (cat.checkMin(cate)) {%>
                    <li class="active"><a href="#<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" data-toggle="tab"><%=cate.getCategoryName()%></a></li>
                        <%}%>
                        <%if (!cat.checkMin(cate)) {%>
                    <li><a href="#<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" data-toggle="tab"><%=cate.getCategoryName()%></a></li>
                        <%}%>

                    <%}%>
                </ul>
            </div>


            <div class="tab-content">


                <%for (Category cate : cat.getCategoryListByBrand(cat.getBrandIDByCategoryID(categoryRequest.substring(1)), "LIMIT 5")) { %>

                <% if (cat.checkMin(cate)) {%>

                <div class="tab-pane fade active in" id ="<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" >
                    <% for (Product prod : pro.getProductListByCategory(new Long(cate.getCategoryID()).toString(), "LIMIT 4")) {%>
                    <div class="col-sm-3">

                        <div class="product-image-wrapper">
                            <div class="single-products">

                                <div class="productinfo text-center">
                                    <a href="javascript:void(0)" class="menudetail" data-id="<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                    <h2>$<%= new Double(prod.getProductPrice()).intValue()%></h2>
                                    <p><%= prod.getProductName()%></p>
                                    <a href="CartServlet?action=cart&command=insert&productid=<%=prod.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
                <%}%>
                <% if (!cat.checkMin(cate)) {%>
                <div class="tab-pane fade" id ="<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" >
                    <% for (Product prod : pro.getProductListByCategory(new Long(cate.getCategoryID()).toString(), "LIMIT 4")) {%>
                    <div class="col-sm-3">

                        <div class="product-image-wrapper">
                            <div class="single-products">

                                <div class="productinfo text-center">
                                    <a href="javascript:void(0)" class="menudetail" data-id="<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                    <h2>$<%= new Double(prod.getProductPrice()).intValue()%></h2>
                                    <p><%= prod.getProductName()%></p>
                                    <a href="CartServlet?action=cart&command=insert&productid=<%=prod.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                </div>

                            </div>
                        </div>

                    </div>
                    <%}%>

                </div>
                <%}%>

                <%}%>
            </div>

        </div><!--/category-tab-->
        <%}%>

        <!--- khi user chon brand thi hien dung brand  do len-->
        <% if (!brandRequest.equals("")) {%>
        <div class="category-tab"><!--category-tab-->


            <div class="col-sm-12">
                <ul class="nav nav-tabs">
                    <%for (Category cate : cat.getCategoryListByBrand(brandRequest.substring(1), "LIMIT 5")) {%>
                    <%if (cat.checkMin(cate)) {%>
                    <li class="active"><a href="#<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" data-toggle="tab"><%=cate.getCategoryName()%></a></li>
                        <%}%>
                        <%if (!cat.checkMin(cate)) {%>
                    <li><a href="#<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" data-toggle="tab"><%=cate.getCategoryName()%></a></li>
                        <%}%>

                    <%}%>
                </ul>
            </div>


            <div class="tab-content">


                <%for (Category cate : cat.getCategoryListByBrand(brandRequest.substring(1), "LIMIT 5")) { %>

                <% if (cat.checkMin(cate)) {%>

                <div class="tab-pane fade active in" id ="<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" >
                    <% for (Product prod : pro.getProductListByCategory(new Long(cate.getCategoryID()).toString(), "LIMIT 4")) {%>
                    <div class="col-sm-3">

                        <div class="product-image-wrapper">
                            <div class="single-products">

                                <div class="productinfo text-center">
                                    <a href="javascript:void(0)" class="menudetail" data-id="<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                    <h2>$<%= new Double(prod.getProductPrice()).intValue()%></h2>
                                    <p><%= prod.getProductName()%></p>
                                    <a href="CartServlet?action=cart&command=insert&productid=<%=prod.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
                <%}%>
                <% if (!cat.checkMin(cate)) {%>
                <div class="tab-pane fade" id ="<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" >
                    <% for (Product prod : pro.getProductListByCategory(new Long(cate.getCategoryID()).toString(), "LIMIT 4")) {%>
                    <div class="col-sm-3">

                        <div class="product-image-wrapper">
                            <div class="single-products">

                                <div class="productinfo text-center">
                                    <a href="javascript:void(0)" class="menudetail" data-id="<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                    <h2>$<%= new Double(prod.getProductPrice()).intValue()%></h2>
                                    <p><%= prod.getProductName()%></p>
                                    <a href="CartServlet?action=cart&command=insert&productid=<%=prod.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                </div>

                            </div>
                        </div>

                    </div>
                    <%}%>

                </div>
                <%}%>

                <%}%>
            </div>

        </div><!--/category-tab-->
        <%}%>

        <div class="recommended_items"><!--recommended_items-->
            <h2 class="title text-center">recommended items</h2>

            <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="item active">
                        <% for (Product p : pro.getProductList("ORDER BY productid DESC LIMIT 3")) {%>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <a href="javascript:void(0)" class="menudetail" data-id="<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""/></a>
                                        <h2>$<%= new Double(p.getProductPrice()).intValue()%></h2>
                                        <p><%= p.getProductName()%></p>
                                        <a href="CartServlet?action=cart&command=insert&productid=<%=p.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <%}%>


                    </div>


                    <div class="item">
                        <% for (Product p : pro.getProductList("LIMIT 3")) {%>
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
                            </div>
                        </div>
                        <%}%>

                    </div>
                </div>
                <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                </a>
                <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                </a>			
            </div>
        </div><!--/recommended_items-->
    </body>
</html>
