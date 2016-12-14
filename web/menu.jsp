<%-- 
    Document   : menu
    Created on : Oct 12, 2016, 4:32:32 PM
    Author     : tuan
--%>

<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page import="dao.BrandDAOImpl"%>
<%@page import="model.Brand"%>
<%@page import="dao.BrandDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CATEGORY MENU</title>
    </head>
    <body>
        <%
            BrandDAOImpl braDAO = new BrandDAOImpl();
            CategoryDAOImpl cat = new CategoryDAOImpl();
            ProductDAOImpl pro = new ProductDAOImpl();
        %>
        <div class="col-sm-3">
            <div class="left-sidebar">
                <h2>Category</h2>

                <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                    <%  for (Brand brand : braDAO.getBrandList("")) {%>
                    <div class="panel panel-default">
                        <!--1 vong lap cho brand-->

                        <div class="panel-heading">
                            <h4 class="panel-title">

                                <a data-toggle="collapse" data-parent="#accordian" href="#<%=brand.getBrandID()%>">
                                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                    <!--brand--><%=brand.getBrandName()%>
                                </a>

                            </h4>
                        </div>
                        <div id="<%=brand.getBrandID()%>" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul>
                                    <% for(Category cate : cat.getCategoryListByBrand(Long.toString(brand.getBrandID()),"")){ %>
                                    <li><a href="index.jsp?category=c<%= cate.getCategoryID()%>"> <span class="pull-right">(<%=pro.countNumberOfProductByCategory(cate)%>)</span><%= cate.getCategoryName()%></a></li>
                                    <%}%>
                                </ul>
                            </div>
                        </div>

                        <!--ket thuc vong lap cho brand-->

                        <!--bat dau vong lap cho category-->


                    </div>
                    <% }%>


                   
                </div><!--/category-products-->

                <div class="brands_products"><!--brands_products-->
                    <h2>Brands</h2>
                    <div class="brands-name">
                        <% for(Brand bra : braDAO.getBrandList("")){ %>
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="index.jsp?brand=b<%= bra.getBrandID()%>"> <span class="pull-right">(<%=pro.countNumberOfProductByBrand(bra)%>)</span><%= bra.getBrandName()%></a></li>
                            
                        </ul>
                        <%}%>
                    </div>
                </div><!--/brands_products-->

                

                <div class="shipping text-center"><!--shipping-->
                    <img src="images/home/shipping.jpg" alt="" />
                </div><!--/shipping-->

            </div>
        </div>
    </body>
</html>
