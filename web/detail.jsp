<%-- 
    Document   : detail
    Created on : Oct 12, 2016, 5:24:59 PM
    Author     : tuan
--%>

<%@page import="dao.BrandDAOImpl"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ProductDAOImpl pro = new ProductDAOImpl();
    BrandDAOImpl bra = new BrandDAOImpl();

    Product pr = new Product();
    String id = request.getParameter("productid")==null ? pro.getMin() : request.getParameter("productid");

    pr = pro.getProductDetailByProductID(id);
%>
<div id="detailContent">
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.8&appId=1206835189398398";
            fjs.parentNode.insertBefore(js, fjs);

        }(document, 'script', 'facebook-jssdk'));

    </script>
    <div class="product-details"><!--product-details-->
        <div class="col-sm-5">
            <div class="view-product">


                <img id="small" width="200px" height="200px" src="resources/images/user/<%= pr.getProductImage()%>" alt="" />

                <h3>ZOOM</h3>
            </div>


        </div>
        <div class="col-sm-7">
            <div class="product-information"><!--/product-information-->
                <img src="resources/images/product-details/new.jpg" class="newarrival" alt="" />
                <h2><%= pr.getProductName()%></h2>

                <span>
                    <span>US $<%= new Double(pr.getProductPrice()).intValue()%></span>

                    <a href="CartServlet?action=cart&command=insert&productid=<%=pr.getProductID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
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
            <div class="fb-comments" data-href="detail.jsp?<%=id%>" data-width="600" data-numposts="5"></div>

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
                                    <a href="javascript:void(0)" class="menudetail" data-id="<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""/></a>
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
                                    <a href="javascript:void(0)" class="menudetail" data-id="<%= p.getProductID()%>"><img src="resources/images/user/<%= p.getProductImage()%>" alt=""></a>
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
