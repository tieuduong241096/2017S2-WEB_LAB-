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
    String id = request.getParameter("productid");

    pr = pro.getProductDetailByProductID(id);
%>
<div id="detailContent">
    
    <div class="product-details"><!--product-details-->
        <div class="col-sm-5">
            <div class="view-product">

                
                <img id="small" width="200px" height="200px" src="resources/images/user/<%= pr.getProductImage()%>" alt="" />

                
                
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

    

    

</div>
