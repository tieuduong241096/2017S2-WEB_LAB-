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
    </head>

    <body>
        <!--HEADER-->
        <jsp:include page="header.jsp"></jsp:include>

            <!--SLIDER-->
        <jsp:include page="slider.jsp"></jsp:include>

            <!--MAIN CONTENT + CATEGORY MENU-->
        <section>
            <div class="container">
                <div class="row">
                <jsp:include page="menu.jsp"></jsp:include>
                <jsp:include page="content.jsp"></jsp:include>
                </div>
            </div>
        </section>

        <!--FOOTER-->
    <jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>
