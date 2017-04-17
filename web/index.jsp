<%@page import="model.Category"%>
<%@page import="model.Brand"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="dao.BrandDAOImpl"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/css/font-awesome.min.css" rel="stylesheet">
        <link href="resources/css/prettyPhoto.css" rel="stylesheet">
        <link href="resources/css/price-range.css" rel="stylesheet">
        <link href="resources/css/animate.css" rel="stylesheet">
        <link href="resources/css/main.css" rel="stylesheet">
        <link href="resources/css/responsive.css" rel="stylesheet">
        <link href="resources/css/searchBox.css" rel="stylesheet">

        <script src="resources/js/html5shiv.js"></script>


        <script src="resources/js/jquery.js"></script>
        <script src="resources/ajax/navigate.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery.scrollUp.min.js"></script>
        <script src="resources/js/price-range.js"></script>
        <script src="resources/js/jquery.prettyPhoto.js"></script>
        <script src="resources/js/main.js"></script>
        <script src="resources/js/jquery.jscroll.min.js"></script>



    </head>

    <body>


        <%
            BrandDAOImpl braDAO = new BrandDAOImpl();
            CategoryDAOImpl cat = new CategoryDAOImpl();
            ProductDAOImpl pro = new ProductDAOImpl();
        %>
        <!--HEADER-->
        <jsp:include page="header.jsp"></jsp:include>

            <!--SLIDER-->
        <jsp:include page="slider.jsp"></jsp:include>

            <!--MAIN CONTENT + CATEGORY MENU-->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar" style="height: 0px">
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
                                        <ul class="hihi">
                                            <% for (Category cate : cat.getCategoryListByBrand(Long.toString(brand.getBrandID()), "")) {%>
                                            <li><a href="javascript:void(0)" class="menuidcategory" data-id="c<%=cate.getCategoryID()%>"> <span class="pull-right">(<%=pro.countNumberOfProductByCategory(cate)%>)</span><%= cate.getCategoryName()%></a></li>
                                                <%}%>
                                        </ul>
                                    </div>
                                </div>




                            </div>
                            <% }%>



                        </div><!--/category-products-->

                        <div class="brands_products"><!--brands_products-->
                            <h2>Brands</h2>
                            <div class="brands-name">
                                <% for (Brand bra : braDAO.getBrandList("")) {%>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="javascript:void(0)" class="menuidbrand" data-id="b<%=bra.getBrandID()%>"><span class="pull-right">(<%=pro.countNumberOfProductByBrand(bra)%>)</span><%= bra.getBrandName()%></a></li>

                                </ul>
                                <%}%>
                            </div>
                        </div><!--/brands_products-->



                        <div class="header-bottom"><!--Search-->
                            <div class="container">
                                <div class="row">

                                    <div class="col-sm-3">
                                        <form id="form1" runat="server">
                                            <fieldset class="search_box" style="width:15%; height:100%">
                                                <div class="contentArea">
                                                    <input type="text" class="search" id="inputSearch" autocomplete="off" placeholder="Search..." />
                                                    <p style="color: red" id="searcherr"></p>
                                                    <div id="divResult">
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div><!--/search-->

                    </div>
                </div>

                            <div class="col-sm-9 padding-right" id="dynamicContent" style="height: 100%">
                      
                </div>
                <div class="col-sm-9 padding-right" style="
    margin-left: 259px;" id="recommendit"></div>
            </div>
        </div>
    </section>

    <!--FOOTER-->
    <jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
