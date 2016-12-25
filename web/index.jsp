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


        <script src="resources/js/html5shiv.js"></script>


        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery.scrollUp.min.js"></script>
        <script src="resources/js/price-range.js"></script>
        <script src="resources/js/jquery.prettyPhoto.js"></script>
        <script src="resources/js/main.js"></script>
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


        <!--JQuery-->
        <script type="text/javascript">


            $(document).ready(function () {
                //mac dinh
                 $.ajax({
                            type: "GET",
                            url: "content.jsp",
                            data: {category: null, brand : null},
                            cache: false,
                            success: function (html) {

                                $("#dynamicContent").html(html);
                                $("#dynamicContent").fadeIn('slow');
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                if (xhr.status == 404) {
                                    alert(thrownError);
                                }
                            },
                            complete: function (html) {

                            }
                        });
                
                
                //click vao category
                $('.hihi li').on('click', '.menuidcategory', function () {
                    var cat = $(this).data("id");
                    if (cat !== null) {

                        $.ajax({
                            type: "GET",
                            url: "content.jsp",
                            data: {category: cat},
                            cache: false,
                            success: function (html) {

                                $("#dynamicContent").html(html);
                                $("#dynamicContent").fadeIn('slow');
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                if (xhr.status == 404) {
                                    alert(thrownError);
                                }
                            },
                            complete: function (html) {

                            }
                        });
                    }

                });

                //click vào brand
                $('.nav-stacked').on('click', '.menuidbrand', function () {
                    var bra = $(this).data("id");
                    if (bra !== null) {

                        $.ajax({
                            type: "GET",
                            url: "content.jsp",
                            data: {brand: bra},
                            cache: false,
                            success: function (html) {

                                $("#dynamicContent").html(html);
                                $("#dynamicContent").fadeIn('slow');
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                if (xhr.status == 404) {
                                    alert(thrownError);
                                }
                            },
                            complete: function (html) {

                            }
                        });
                    }

                });

                //click để xem detail
                $(document).on('click', '.menudetail', function () {
                    var detail = $(this).data("id");
                    if (detail != null) {
                        $.ajax({
                            type: "GET",
                            url: "detail.jsp",
                            data: {productid: detail},
                            cache: false,
                            success: function (html) {

                                $("#dynamicContent").html(html);
                                $("#dynamicContent").fadeIn('slow');
                                $("html, body").animate({
                                    scrollTop: 390
                                }, 1000);
                                $("#dynamicContent").load('this.href', function () {
                                    FB.XFBML.parse();
                                });
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                if (xhr.status == 404) {
                                    alert(thrownError);
                                }
                            },
                            complete: function (html) {

                            }
                        });
                    }

                });



            });


        </script>
        <!--JQuery-->

        <!--search-->
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

                    $.ajax({
                        type: "GET",
                        url: "detail.jsp",
                        data: {productid: name},
                        cache: false,
                        success: function (html) {

                            $("#dynamicContent").html(html);
                            $("html, body").animate({
                                scrollTop: 390
                            }, 1000);
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            if (xhr.status == 404) {
                                alert(thrownError);
                            }
                        },
                        complete: function (html) {

                        }
                    });

                });
                $(document).on("click", function (e) {
                    var $clicked = $(e.target);
                    if (!$clicked.hasClass("search")) {
                        jQuery("#divResult").fadeOut();
                    }
                });



            });
        </script>
        <!--Search-->



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
                                        <ul class="hihi">
                                            <% for (Category cate : cat.getCategoryListByBrand(Long.toString(brand.getBrandID()), "")) {%>
                                            <li><a href="javascript:void(0)" class="menuidcategory" data-id="c<%=cate.getCategoryID()%>"> <span class="pull-right">(<%=pro.countNumberOfProductByCategory(cate)%>)</span><%= cate.getCategoryName()%></a></li>
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
                <div class="col-sm-9 padding-right" id="dynamicContent">

                </div>
            </div>
        </div>
    </section>

    <!--FOOTER-->
    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
