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
        
        
        
        
        
        <%--- Add Ajax from base project -----%>
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/my-script.js"></script>
        <script src="js/base-ajax.js"></script>



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
            <%----
        <jsp:include page="slider.jsp"></jsp:include>
            ----%>

            <!--MAIN CONTENT + CATEGORY MENU-->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        
                        
                        
                        
                        <%----- Menu of Son's Project
                        
                        
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
                            
                            
                          End of menu of Son's project-------%>   
                            
                            
                  <div class="sub-cate">
        <div class=" top-nav rsidebar span_1_of_left">
            <h3 class="cate">DANH MỤC SẢN PHẨM</h3>
            <ul class="menu">
                <li class="item1"><a href="error.jsp">Điện tử</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="phone.jsp">Điện thoại</a></li>
                        <li class="subitem2"><a href="laptop.jsp">Laptop</a></li>
                        <li class="subitem3"><a href="tablet.jsp">Máy tính bảng</a></li>
                        <li class="subitem4"><a href="television.jsp">Ti vi</a></li>
                        <li class="subitem5"><a href="error.jsp">Máy ảnh</a></li>
                    </ul>
                </li>
                <li class="item2"><a href="error.jsp">Quần áo</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="error.jsp">Quần áo nam</a></li>
                        <li class="subitem2"><a href="error.jsp">Quần áo nữ</a></li>
                        <li class="subitem2"><a href="error.jsp">Quần áo trẻ em</a></li>
                    </ul>
                </li>
                <li class="item3"><a href="error.jsp">Phụ kiện</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="error.jsp">Túi xách</a></li>
                        <li class="subitem2"><a href="error.jsp">Mắt kính</a></li>
                        <li class="subitem3"><a href="error.jsp">Mũ, nón</a></li>
                        <li class="subitem3"><a href="error.jsp">Giày, dép</a></li>
                    </ul>
                </li>
                <li class="item3"><a href="error.jsp">Sinh hoạt</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="error.jsp">Dụng cụ nấu ăn</a></li>
                        <li class="subitem2"><a href="error.jsp">Dụng cụ vệ sinh</a></li>
                        <li class="subitem3"><a href="error.jsp">Sản phẩm giặt giũ</a></li>
                        <li class="subitem3"><a href="error.jsp">Dụng cụ phòng tắm</a></li>
                        <li class="subitem3"><a href="error.jsp">Dụng cụ làm vườn</a></li>
                        <li class="subitem3"><a href="error.jsp">Dụng cụ trang trí</a></li>
                    </ul>
                </li>
                <li class="item4"><a href="error.jsp">Dân dụng</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="error.jsp">Bàn ủi</a></li>
                        <li class="subitem2"><a href="error.jsp">Tủ lạnh</a></li>
                        <li class="subitem3"><a href="error.jsp">Máy giặt</a></li>
                        <li class="subitem1"><a href="error.jsp">Máy quạt</a></li>
                        <li class="subitem1"><a href="error.jsp">Máy lạnh</a></li>
                        <li class="subitem1"><a href="error.jsp">Máy nước nóng</a></li>
                    </ul>
                </li>
                <li class="item4"><a href="error.jsp">Nội thất</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="error.jsp">Phòng ngủ</a></li>
                        <li class="subitem2"><a href="error.jsp">Phòng khách</a></li>
                        <li class="subitem3"><a href="error.jsp">Phòng làm việc</a></li>
                        <li class="subitem1"><a href="error.jsp">Phòng ăn</a></li>
                        <li class="subitem1"><a href="error.jsp">Phòng tắm</a></li>
                        <li class="subitem1"><a href="error.jsp">Hành lang</a></li>
                    </ul>
                </li>
                <li class="item4"><a href="error.jsp">Sắc đẹp</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="error.jsp">Thực phẩm chức năng</a></li>
                        <li class="subitem2"><a href="error.jsp">Mỹ phẩm</a></li>
                        <li class="subitem3"><a href="error.jspl">Dụng cụ trang điểm</a></li>
                    </ul>
                </li>
                <li class="item4"><a href="error.jsp">Thực phẩm </a>
                    <ul class="cute">
                        <li class="subitem1"><a href="error.jsp">Thực phẩm tươi sống</a></li>
                        <li class="subitem2"><a href="error.jsp">Thực phẩm đóng hộp</a></li>
                    </ul>
                </li>
                <li class="item4"><a href="error.jsp">Du lịch</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="error.jsp">Vali</a></li>
                        <li class="subitem2"><a href="error.jsp">Ba lô</a></li>
                        <li class="subitem3"><a href="error.jsp">Lều, thãm trải</a></li>
                    </ul>
                </li>
                <li class="item4"><a href="error.jsp">Thể thao</a>
                    <ul class="cute">
                        <li class="subitem1"><a href="error.jsp">Bóng đá</a></li>
                        <li class="subitem2"><a href="error.jsp">Bóng bàn</a></li>
                        <li class="subitem3"><a href="error.jsp">Cầu lông</a></li>
                        <li class="subitem3"><a href="error.jsp">Quần vợt</a></li>
                        <li class="subitem3"><a href="error.jsp">Mạo hiểm</a></li>
                        <li class="subitem3"><a href="error.jsp">Bơi lội</a></li>
                    </ul>
                </li>
            </ul>
        </div>
                      
                      
                      <script type="text/javascript">
            $(function () {
                var menu_ul = $('.menu > li > ul'),
                        menu_a = $('.menu > li > a');
                menu_ul.hide();
                menu_a.click(function (e) {
                    e.preventDefault();
                    if (!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul.filter(':visible').slideUp('normal');
                        $(this).addClass('active').next().stop(true, true).slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this).next().stop(true, true).slideUp('normal');
                    }
                });

            });
        </script>
                            
                            
                            
                            
          </div>
                            
                            
                            <div class="row customforrow" >
                                <div class="col-md-12"></div>
                            </div>
                            <div class="row customforrow">
                                <div class="col-md-12"></div>
                            </div>
                            <div class="row customforrow">
                                <div class="col-md-12"></div>
                            </div>
                            <div class="row customforrow">
                                <div class="col-md-12"></div>
                            </div>
                            

                            <%------ 2 most special function for later
                            <div class="col-sm-9 padding-right" id="dynamicContent" style="height: 100%">
                      
                </div>
                <div class="col-sm-9 padding-right" style="
    margin-left: 259px;" id="recommendit"></div>
            </div>
                            
                            
                            ------%>
                </div>   <%--- End of menu ---%>
                
                
                
                
                <%------ Slider Bar ----%>
               
                <div class="col-sm-9">
                    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="wrap-in">
                        <div class="wmuSlider example1 slide-grid">		 
                            <div class="wmuSliderWrapper">		  
                                <article style="position: absolute; width: 100%; opacity: 0;">					
                                    <div class="banner-matter">
                                        <div class="col-md-5 banner-bag">
                                            <img class="img-responsive " src="images/P001.jpg" alt=" " />
                                        </div>
                                        <div class="col-md-7 banner-off">							
                                            <h2>GIẢM GIÁ 50%</h2>
                                            <label>CHO TẤT CẢ THANH TOÁN</label>
                                            <p>Giày cao got HQ phối màu quý phái CG1015</p>					
                                            <a href="view.jsp?productId">
                                                <span class="on-get">MUA NGAY</span>
                                            </a>
                                        </div>

                                        <div class="clearfix"> </div>
                                    </div>

                                </article>
                                <article style="position: absolute; width: 100%; opacity: 0;">					
                                    <div class="banner-matter">
                                        <div class="col-md-5 banner-bag">
                                            <img class="img-responsive " src="images/P002.jpg" alt=" " />
                                        </div>
                                        <div class="col-md-7 banner-off">							
                                            <h2>GIẢM GIÁ 50%</h2>
                                            <label>CHO TẤT CẢ THANH TOÁN</label>
                                            <p>Túi đeo chéo LATA 2016(Da bò nhạt)</p>					
                                            <a href="view.jsp?productId">
                                                <span class="on-get">MUA NGAY</span>
                                            </a>
                                        </div>

                                        <div class="clearfix"> </div>
                                    </div>

                                </article>
                                <article style="position: absolute; width: 100%; opacity: 0;">					
                                    <div class="banner-matter">
                                        <div class="col-md-5 banner-bag">
                                            <img class="img-responsive " src="images/P003.jpg" alt=" " />
                                        </div>
                                        <div class="col-md-7 banner-off">							
                                            <h2>GIẢM GIÁ 50%</h2>
                                            <label>CHO TẤT CẢ THANH TOÁN</label>
                                            <p>Balo du lịch Glado Classical 2016 mang phong cách trẻ trung, thời trang</p>					
                                            <a href="view.jsp?productId">
                                                <span class="on-get">MUA NGAY</span>
                                            </a>
                                        </div>

                                        <div class="clearfix"> </div>
                                    </div>

                                </article>

                            </div>
                            </a>
                            <ul class="wmuSliderPagination">
                                <li><a href="error.jsp" class="">0</a></li>
                                <li><a href="error.jsp" class="">1</a></li>
                                <li><a href="error.jsp" class="">2</a></li>
                            </ul>
                            <script src="js/jquery.wmuSlider.js"></script> 
                            <script>
            $('.example1').wmuSlider();
                            </script> 
                        </div>
                    </div>
                        </div>
                    </div>
                    
                    <%----- End of Slider -----%>
                    
                    
                    
                    
                    <%---- Div here for common item ----%>
                    <div class="row">
                        
                        
                    </div>
                    <%---- End Div for common items ----%>
                    
                    
                    
                    
                    
                    
                    <%---- Div here for recommend items -----%>
                    <div class="row">
                        
                        
                        
                    </div>
                    <%---- End Div for recommend items ----%>
                    
                </div>
                
                <%---- End for content ----%>
                
                
                
                
            </div>
        </div>
    </section>
    
     <div class="row customforrow" >
                                <div class="col-md-12"></div>
                            </div>
                            <div class="row customforrow">
                                <div class="col-md-12"></div>
                            </div>
                            <div class="row customforrow">
                                <div class="col-md-12"></div>
                            </div>
                            <div class="row customforrow">
                                <div class="col-md-12"></div>
                            </div>

    <!--FOOTER-->
    <jsp:include page="footer.jsp"></jsp:include>
    
    
   

</body>

</html>
