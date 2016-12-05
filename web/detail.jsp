<%-- 
    Document   : detail
    Created on : Oct 12, 2016, 5:24:59 PM
    Author     : tuan
--%>

<%@page import="dao.BrandDAOImpl"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRODUCT DETAIL</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/css/font-awesome.min.css" rel="stylesheet">
        <link href="resources/css/prettyPhoto.css" rel="stylesheet">
        <link href="resources/css/price-range.css" rel="stylesheet">
        <link href="resources/css/animate.css" rel="stylesheet">
        <link href="resources/css/main.css" rel="stylesheet">
        <link href="resources/css/responsive.css" rel="stylesheet">


        <script src="resources/js/html5shiv.js"></script>


        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery.scrollUp.min.js"></script>
        <script src="resources/js/price-range.js"></script>
        <script src="resources/js/jquery.prettyPhoto.js"></script>
        <script src="resources/js/main.js"></script>
    </head>
    <body>
        <!--HEADER-->
        <jsp:include page="header.jsp"></jsp:include>

        <%
            ProductDAOImpl pro = new ProductDAOImpl();
            BrandDAOImpl bra = new BrandDAOImpl();
            
            
            Product pr = new Product();
             pr = pro.getProductDetailByProductID(request.getParameter("productid"));
        %>

        <!--MAIN CONTENT + CATEGORY MENU-->
        <section>
            <div class="container">
                <div class="row">
                    <jsp:include page="menu.jsp"></jsp:include>

                        <div class="col-sm-9 padding-right">
                            <div class="product-details"><!--product-details-->
                                <div class="col-sm-5">
                                    <div class="view-product">
                                        <img src="resources/images/user/<%= pr.getProductImage()%>" alt="">
                                        <h3>ZOOM</h3>
                                    </div>
                                    <div id="similar-product" class="carousel slide" data-ride="carousel">

                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
                                                <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
                                                <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
                                            </div>
                                            <div class="item">
                                                <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
                                                <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
                                                <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
                                            </div>
                                            <div class="item">
                                                <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
                                                <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
                                                <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
                                            </div>

                                        </div>

                                        <!-- Controls -->
                                        <a class="left item-control" href="#similar-product" data-slide="prev">
                                            <i class="fa fa-angle-left"></i>
                                        </a>
                                        <a class="right item-control" href="#similar-product" data-slide="next">
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>

                                </div>
                                <div class="col-sm-7">
                                    <div class="product-information"><!--/product-information-->
                                        <img src="resources/images/product-details/new.jpg" class="newarrival" alt="" />
                                        <h2><%= pr.getProductName()%></h2>

                                        <span>
                                            <span>US $<%= new Double(pr.getProductPrice()).intValue()  %></span>
                                            <label>Quantity:</label>
                                            <input type="text" value="3" />
                                            <button type="button" class="btn btn-fefault cart">
                                                <i class="fa fa-shopping-cart"></i>
                                                Add to cart
                                            </button>
                                        </span>
                                        <p><b>Availability: </b> In Stock</p>
                                        <p><b>Condition: </b> New</p>
                                        <p><b>Brand: </b><%= bra.getBrandNameByBrandID(Long.toString(pr.getBrand().getBrandID()))%></p>

                                    </div><!--/product-information-->
                                </div>
                            </div><!--/product-details-->

                            <div class="category-tab shop-details-tab"><!--category-tab-->
                                <div class="col-sm-12">
                                    <ul class="nav nav-tabs">
                                        
                                        
                                        
                                        <li class="active"><a href="#reviews" data-toggle="tab">Reviews</a></li>
                                    </ul>
                                </div>
                                <div class="tab-content">
                                    
                                    

                                   
                                    <!--Review-->
                                    <div class="tab-pane fade active in" id="reviews" >
                                        <div class="col-sm-12">
                                            <ul>
                                                <li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
                                                <li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
                                                <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                            <p><b>Write Your Review</b></p>

                                            <form action="#">
                                                <span>
                                                    <input type="text" placeholder="Your Name"/>
                                                    <input type="email" placeholder="Email Address"/>
                                                </span>
                                                <textarea name="" ></textarea>
                                                <b>Rating: </b> <img src="images/product-details/rating.png" alt="" />
                                                <button type="button" class="btn btn-default pull-right">
                                                    Submit
                                                </button>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </div><!--/category-tab-->

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
                                                        <a href="detail.jsp?productid=<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""/></a>
                                                        <h2>$<%= new Double(p.getProductPrice()).intValue()%></h2>
                                                        <p><%= p.getProductName()%></p>
                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
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
                                                        <a href="detail.jsp?productid=<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""></a>
                                                        <h2>$<%= new Double(p.getProductPrice()).intValue()%></h2>
                                                        <p><%= p.getProductName()%></p>
                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
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
                </div>
            </div>
        </section>

        <!--FOOTER-->
        <jsp:include page="footer.jsp"></jsp:include>
        
    </body>
</html>
