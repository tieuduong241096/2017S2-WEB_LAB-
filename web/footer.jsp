<%-- 
    Document   : footer
    Created on : Oct 12, 2016, 4:09:43 PM
    Author     : tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>footer</title>
        <script type="text/javascript" accesskey=""src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHRkfLjF_CsM7b__Wb0FjOrFnT4_8-2VU&callback=initMap"></script>
        <script type="text/javascript">
            function initMap() {
                var latlng = {lat: 10.877693, lng: 106.801602};
                var myOptions = {
                    zoom: 15,
                    center: latlng,
                    styles: [
            {elementType: 'geometry', stylers: [{color: '#242f3e'}]},
            {elementType: 'labels.text.stroke', stylers: [{color: '#242f3e'}]},
            {elementType: 'labels.text.fill', stylers: [{color: '#746855'}]},
            {
              featureType: 'administrative.locality',
              elementType: 'labels.text.fill',
              stylers: [{color: '#d59563'}]
            },
            {
              featureType: 'poi',
              elementType: 'labels.text.fill',
              stylers: [{color: '#d59563'}]
            },
            {
              featureType: 'poi.park',
              elementType: 'geometry',
              stylers: [{color: '#263c3f'}]
            },
            {
              featureType: 'poi.park',
              elementType: 'labels.text.fill',
              stylers: [{color: '#6b9a76'}]
            },
            {
              featureType: 'road',
              elementType: 'geometry',
              stylers: [{color: '#38414e'}]
            },
            {
              featureType: 'road',
              elementType: 'geometry.stroke',
              stylers: [{color: '#212a37'}]
            },
            {
              featureType: 'road',
              elementType: 'labels.text.fill',
              stylers: [{color: '#9ca5b3'}]
            },
            {
              featureType: 'road.highway',
              elementType: 'geometry',
              stylers: [{color: '#746855'}]
            },
            {
              featureType: 'road.highway',
              elementType: 'geometry.stroke',
              stylers: [{color: '#1f2835'}]
            },
            {
              featureType: 'road.highway',
              elementType: 'labels.text.fill',
              stylers: [{color: '#f3d19c'}]
            },
            {
              featureType: 'transit',
              elementType: 'geometry',
              stylers: [{color: '#2f3948'}]
            },
            {
              featureType: 'transit.station',
              elementType: 'labels.text.fill',
              stylers: [{color: '#d59563'}]
            },
            {
              featureType: 'water',
              elementType: 'geometry',
              stylers: [{color: '#17263c'}]
            },
            {
              featureType: 'water',
              elementType: 'labels.text.fill',
              stylers: [{color: '#515c6d'}]
            },
            {
              featureType: 'water',
              elementType: 'labels.text.stroke',
              stylers: [{color: '#17263c'}]
            }
          ]
                    
                };
                var map = new google.maps.Map(document.getElementById("map_container"), myOptions);

                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map,
                    title: "S-LAB!"
                });

            }
        </script>
        <style type="text/css">
            #map_container{
                width:900px;
                height:200px;
            }
        </style>
    </head>
    <body onload="initMap()">
        
        
        <%----- Old ---->
        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="companyinfo">
                                <h2 style="color: white"><span>S</span>-LAB</h2>
                                <p style="color: white">Linh Trung, Thủ Đức, Hồ Chí Minh city</p>
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="col-sm-3">

                            </div>

                            <div class="col-sm-3">

                            </div>

                            <div class="col-sm-3">

                            </div>

                            <div class="col-sm-3">

                            </div>
                            <div class="col-sm-3">

                            </div>
                        </div>
                        
                            <div id="map_container"></div>
                        
                    </div>
                </div>
            </div>



            <div class="footer-bottom">
                <div class="container">
                    <div class="row">


                    </div>
                </div>
            </div>

        </footer><!--/Footer-->
        
        
        ------%>
        
        
        
        
        <div class="footer-top">
    <div class="container">
        <div class="foo-grids">
            <div class="col-md-3 footer-grid">
                <h4 class="footer-head">GIỚI THIỆU</h4>
                <p style="color: #ffffff">Chúng tô là tập đoàn mua bán trực tuyến qua mạng internet với quy mô toàn cầu. Chất lượng va niềm tien của khách hàng là điều thiết yếu. Mục đích của tập đoàn cung cấp dịch vụ mua sắm trực tiếp một cách nhanh chóng và tiện lợi cho khách hàng.
            </div>
            <div class="col-md-3 footer-grid">
                <h4 class="footer-head">TRỢ GIÚP</h4>
                <ul>
                    <li><a href="error.jsp">Cách sử dụng</a></li>						
                    <li><a href="error.jsp">Điều khiển</a></li>
                    <li><a href="error.jspl">FAQ</a></li>
                    <li><a href="error.jsp">Phản hồi</a></li>
                    <li><a href="error.jsp">Liên lạc</a></li>
                    <li><a href="error.jsp">Code</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-grid">
                <h4 class="footer-head">THÔNG TIN</h4>
                <ul>
                    <li><a href="error.jsp">Vị trí</a></li>	
                    <li><a href="error.jsp">Điều khoản sử dụng</a></li>
                    <li><a href="error.jsp">Tìm kiếm phổ biến</a></li>	
                    <li><a href="error.jsp">Chính sách bảo mật</a></li>	
                </ul>
            </div>
            <div class="col-md-3 footer-grid">
                <h4 class="footer-head">LIÊN HỆ</h4>
                <span class="hq">Trụ sở chính</span>

                <ul class="location">
                    <li><span class="glyphicon glyphicon-map-marker"></span></li>
                    <li><a href="error.jsp">Trung tâm nhân sự</a></li>
                    <div class="clearfix"></div>
                </ul>	
                <ul class="location">
                    <li><span class="glyphicon glyphicon-earphone"></span></li>
                    <li><a href="error.jsp">+0 561 111 235</a></li>
                    <div class="clearfix"></div>
                </ul>	
                <ul class="location">
                    <li><span class="glyphicon glyphicon-envelope"></span></li>
                    <li><a href="error.jsp">ecommerce@hcmiu.edu.vn.com</a></li>
                    <div class="clearfix"></div>
                </ul>						
            </div>
            <div class="clearfix"></div>
        </div>					
    </body>
</html>
