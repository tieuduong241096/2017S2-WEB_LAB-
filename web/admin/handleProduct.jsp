<%-- 
    Document   : handleProduct
    Created on : Dec 21, 2016, 8:39:40 PM
    Author     : LMD0207
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>CATEGORY MENU</title>        


        <link href="../resources/css/mos-style.css" rel='stylesheet' type='text/css' />


    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">

                    <form action="../ProductServlet" method="POST" enctype="multipart/form-data">
                        ID:       <input type="text" name="id" style="margin-left: 68px;
                                         padding-right: 69px;"><br/>
                        Name:     <input type="text" name="name" style="margin-left: 47px;
                                         padding-right: 69px;"><br/>
                        Price:    <input type="text" name="price" style="margin-left: 52px;
                                         padding-right: 69px;"><br/>
                        Image:  <input type="file" name="file" style="margin-left: 46px;
                                         padding-right: 0px; "/><br/>
                        Quantity: <input type="numeber" name="quantity" style="    margin-left: 35px;
                                         padding-right: 69px;"><br/>
                        Description: <input type="text" name="description" style="    padding-right: 69px;
                                            margin-left: 18px;"><br/>
                        Discount: <input type="text" name="discount" style="margin-left: 32px;
                                         padding-right: 69px;"><br/>
                        Brand: <input type="text" name="brand" style="margin-left: 47px;
                                      padding-right: 69px;"><br/>
                        Category: <input type="text" name="category" style="    padding-right: 69px;
                                         margin-left: 30px;"><br/>
                        Modify: <input type="text" name="modify" style="    margin-left: 44px;
                                       padding-right: 69px;"><br/>
                        <input type="submit" value="Submit" style="margin-left: 86px"/>
                    </form>
                    <div class="clear"></div>

                <jsp:include page="footer.jsp"></jsp:include>
            </div>
    </body>
</html>
