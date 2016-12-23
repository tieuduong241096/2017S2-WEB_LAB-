<%-- 
    Document   : content
    Created on : Oct 12, 2016, 4:28:43 PM
    Author     : tuan
--%>



<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTENT</title>
        <script src="resources/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%

            CategoryDAOImpl cat = new CategoryDAOImpl();
            ProductDAOImpl pro = new ProductDAOImpl();
            
            
            
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart==null){
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
           
            
        %>
        <div class="col-sm-9 padding-right">
            <div class="features_items"><!--features_items-->
                <h2 class="title text-center">Features Items</h2>
                
                
                <!-- Neu user chon category de xem sp-->
                <% if(request.getParameter("category") != null){%>
                
                    <% if(request.getParameter("category").startsWith("c")){%>
                        
                    <% for(Product p : pro.getProductListByCategory(request.getParameter("category").substring(1),"")){ %>
                    <div class="col-sm-4">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <a href="detail.jsp?productid=<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""></a>
                                <h2>$<%= new Double(p.getProductPrice()).intValue()  %></h2>
                                <p><%= p.getProductName()%></p>
                                <a href="CartServlet?action=cart&command=insert&productid=<%=p.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                            </div>
                            
                        </div>
                        <div class="choose">
                            <ul class="nav nav-pills nav-justified">
                                
                                <li><a href="detail.jsp?productid=<%= p.getProductID()%>"><i class="fa fa-plus-square"></i>More Detail</a></li>
                            </ul>
                        </div>
                    </div>
                    </div>

                    <%}%>
                
                    <%}%>
                    
                        
                
                <%}%>
                
                
                <!--Neu nguoi dung chon brand de xem sp -->
                <% if(request.getParameter("brand") != null){%>
                
                    <% if(request.getParameter("brand").startsWith("b")){%>
                       
                    <% for(Product p : pro.getProductListByBrand(request.getParameter("brand").substring(1),"")){ %>
                     <div class="col-sm-4">
                        <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <a href="detail.jsp?productid=<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""></a>
                                <h2>$<%= new Double(p.getProductPrice()).intValue()  %></h2>
                                <p><%= p.getProductName()%></p>
                                <a href="CartServlet?action=cart&command=insert&productid=<%=p.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                            </div>
                            
                        </div>
                        <div class="choose">
                            <ul class="nav nav-pills nav-justified">
                                
                                <li><a href="detail.jsp?productid=<%= p.getProductID()%>"><i class="fa fa-plus-square"></i>More Detail</a></li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
                <%}%>
                    <%}%>
                    
                        
                
                <%}%>
                
                
                <!-- Neu k chon brand hay category thi load nhung sp mac dinh len -->
                <% if(request.getParameter("category") == null && request.getParameter("brand") == null){%>
                <% for(Product p : pro.getProductList("GROUP BY productid DESC LIMIT 6")){%>
                <div class="col-sm-4">
                    
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <a href="detail.jsp?productid=<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""></a>
                                <h2>$<%= new Double(p.getProductPrice()).intValue()  %></h2>
                                <p><%= p.getProductName()%></p>
                                <a href="CartServlet?action=cart&command=insert&productid=<%=p.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                            </div>
                            
                        </div>
                        <div class="choose">
                            <ul class="nav nav-pills nav-justified">
                                
                                <li><a href="detail.jsp?productid=<%= p.getProductID()%>"><i class="fa fa-plus-square"></i>More Detail</a></li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
                <%}%>
                <%}%>

            </div><!--features_items-->
            
            
            <!-- mac dinh-->
            <% if(request.getParameter("category") == null && request.getParameter("brand") == null){%>
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
                                        <a href="detail.jsp?productid=<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                        <h2>$<%= new Double(prod.getProductPrice()).intValue()  %></h2>
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
                                        <a href="detail.jsp?productid=<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                        <h2>$<%= new Double(prod.getProductPrice()).intValue()  %></h2>
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
            <% if(request.getParameter("category") != null){%>
            <div class="category-tab"><!--category-tab-->


                <div class="col-sm-12">
                    <ul class="nav nav-tabs">
                        <%for (Category cate : cat.getCategoryListByBrand(cat.getBrandIDByCategoryID(request.getParameter("category").substring(1)),"LIMIT 5")) {%>
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


                    <%for (Category cate : cat.getCategoryListByBrand(cat.getBrandIDByCategoryID(request.getParameter("category").substring(1)),"LIMIT 5")) { %>

                    <% if (cat.checkMin(cate)) {%>
                    
                    <div class="tab-pane fade active in" id ="<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" >
                        <% for (Product prod : pro.getProductListByCategory(new Long(cate.getCategoryID()).toString(), "LIMIT 4")) {%>
                        <div class="col-sm-3">

                            <div class="product-image-wrapper">
                                <div class="single-products">

                                    <div class="productinfo text-center">
                                        <a href="detail.jsp?productid=<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                        <h2>$<%= new Double(prod.getProductPrice()).intValue()  %></h2>
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
                                        <a href="detail.jsp?productid=<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                        <h2>$<%= new Double(prod.getProductPrice()).intValue()  %></h2>
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
            <% if(request.getParameter("brand") != null){%>
            <div class="category-tab"><!--category-tab-->


                <div class="col-sm-12">
                    <ul class="nav nav-tabs">
                        <%for (Category cate : cat.getCategoryListByBrand(request.getParameter("brand").substring(1),"LIMIT 5")) {%>
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


                    <%for (Category cate : cat.getCategoryListByBrand(request.getParameter("brand").substring(1),"LIMIT 5")) { %>

                    <% if (cat.checkMin(cate)) {%>
                    
                    <div class="tab-pane fade active in" id ="<%= cat.trimAllWhiteSpace(cate.getCategoryName())%>" >
                        <% for (Product prod : pro.getProductListByCategory(new Long(cate.getCategoryID()).toString(), "LIMIT 4")) {%>
                        <div class="col-sm-3">

                            <div class="product-image-wrapper">
                                <div class="single-products">

                                    <div class="productinfo text-center">
                                        <a href="detail.jsp?productid=<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                        <h2>$<%= new Double(prod.getProductPrice()).intValue()  %></h2>
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
                                        <a href="detail.jsp?productid=<%= prod.getProductID()%>"><img src="resources/images/user/<%= prod.getProductImage()%>" alt=""></a>
                                        <h2>$<%= new Double(prod.getProductPrice()).intValue()  %></h2>
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
                            <% for(Product p : pro.getProductList("ORDER BY productid DESC LIMIT 3")) { %>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="detail.jsp?productid=<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""/></a>
                                            <h2>$<%= new Double(p.getProductPrice()).intValue()  %></h2>
                                            <p><%= p.getProductName()%></p>
                                            <a href="CartServlet?action=cart&command=insert&productid=<%=p.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%}%>
                            
                            
                        </div>
                            
                        
                        <div class="item">
                            <% for(Product p : pro.getProductList("LIMIT 3")) { %>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="detail.jsp?productid=<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""></a>
                                            <h2>$<%= new Double(p.getProductPrice()).intValue()  %></h2>
                                            <p><%= p .getProductName() %></p>
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
    </body>
</html>
