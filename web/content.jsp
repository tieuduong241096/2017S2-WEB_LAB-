<%-- 
    Document   : item
    Created on : Dec 25, 2016, 9:36:17 AM
    Author     : tuan
--%>


<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page import="dao.CategoryDAO"%>

<div id="productContent">
    <%

        CategoryDAOImpl cat = new CategoryDAOImpl();
        ProductDAOImpl pro = new ProductDAOImpl();

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        String categoryRequest = request.getParameter("category") == null ? "" : request.getParameter("category");
        String brandRequest = request.getParameter("brand") == null ? "" : request.getParameter("brand");
    %>
    <div class="features_items"><!--features_items-->
        <h2 class="title text-center">Features Items</h2>


        <!-- Neu user chon category de xem sp-->
        <% if (!categoryRequest.equals("")) {%>

        <% if (categoryRequest.startsWith("c")) {%>

        <% for (Product p : pro.getProductListByCategory(categoryRequest.substring(1), "")) {%>
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



        <%}%>


        <!--Neu nguoi dung chon brand de xem sp -->
        <% if (!brandRequest.equals("")) {%>

        <% if (brandRequest.startsWith("b")) {%>

        <% for (Product p : pro.getProductListByBrand(brandRequest.substring(1), "")) {%>
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



        <%}%>


        <!-- Neu k chon brand hay category thi load nhung sp mac dinh len -->
        <% if (categoryRequest.equals("") && brandRequest.equals("")) {%>
        <% for (Product p : pro.getProductList("GROUP BY productid DESC")) {%>
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

    </div><!--features_items-->


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
</div>
