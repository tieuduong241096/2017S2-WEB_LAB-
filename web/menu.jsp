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
        <style type="text/css">

            .contentArea
            {
                width: 500px;
                margin: 0 auto;
            }
            #inputSearch
            {
                width: 250px;
                border: solid 1px #000;
                padding: 3px;
            }
            #divResult
            {
                position: inherit;
                width: 250px;
                display: none;
                margin-top: -1px;
                border: solid 1px #dedede;
                border-top: 0px;
                overflow: hidden;
                border-bottom-right-radius: 6px;
                border-bottom-left-radius: 6px;
                -moz-border-bottom-right-radius: 6px;
                -moz-border-bottom-left-radius: 6px;
                box-shadow: 0px 0px 5px #999;
                border-width: 3px 1px 1px;
                border-style: solid;
                border-color: #333 #DEDEDE #DEDEDE;
                background-color: white;
                height: 350px;
                overflow: auto;
            }
            #display_box
            {
                padding: 4px;
                border-top: solid 1px #dedede;
                font-size: 12px;
                height: 60px;
            }
            #display_box:hover
            {
                background: black;
                color: #FFFFFF;
                cursor: pointer;
            }
        </style>

        <script src="resources/js/price-range.js"></script>
        <script type="text/javascript">
            $(function () {
                $(".search").keyup(function () {
                    var inputSearch = $(this).val();
                    var dataString = inputSearch;
                    if (inputSearch == '')
                        jQuery("#divResult").fadeOut();
                    else if ($.isNumeric(dataString) || /^[a-zA-Z\s]+$/.test(dataString) == false) {
                        $("#searcherr").text("*letters only*");
                    } else {
                        $("#searcherr").text("");
                        $.ajax({
                            type: "POST",
                            url: "SearchServlet",
                            data: {dataString: dataString},
                            cache: false,
                            success: function (html) {
                                $("#divResult").html(html).fadeIn();

                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                if (xhr.status == 404) {
                                    alert(thrownError);
                                }
                            }
                        });
                    }
                    return false;
                });
                $(document).on("click", "#divResult", function (e) {
                    var $clicked = $(e.target);
                    var name = $clicked.find('.proid').html();
//                    var decoded = $("<div/>").html($name).text();
//                    $(window.location).attr('href', 'detail.jsp?productid='+decoded);
                    $(location).attr("href", "detail.jsp?productid=" + name);

                });
                $(document).on("click", function (e) {
                    var $clicked = $(e.target);
                    if (!$clicked.hasClass("search")) {
                        jQuery("#divResult").fadeOut();
                    }
                });
//                

            });
        </script>
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
                                    <% for (Category cate : cat.getCategoryListByBrand(Long.toString(brand.getBrandID()), "")) {%>
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
                        <% for (Brand bra : braDAO.getBrandList("")) {%>
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="index.jsp?brand=b<%= bra.getBrandID()%>"> <span class="pull-right">(<%=pro.countNumberOfProductByBrand(bra)%>)</span><%= bra.getBrandName()%></a></li>

                        </ul>
                        <%}%>
                    </div>
                </div><!--/brands_products-->



                <div class="header-bottom">
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
                </div><!--/header-bottom-->
                
            </div>
        </div>
    </body>
</html>
