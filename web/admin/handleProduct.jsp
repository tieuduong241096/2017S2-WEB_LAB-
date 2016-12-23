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
                   
                    <form action="../ProductServlet" method="POST">
                        ID:       <input type="text" name="id" style="margin-left: 68px;
                                         padding-right: 25px;"><br/>
                        Name:     <input type="text" name="name" style="margin-left: 46px;
                                         padding-right: 25px;"><br/>
                        Price:    <input type="text" name="price" style="margin-left: 52px;
                                         padding-right: 25px;"><br/>
                        Image: <br/>
                        Quantity: <input type="numeber" name="quantity" style="    margin-left: 29px;
                                         padding-right: 24px;"><br/>
                        Description: <input type="text" name="description" style="    padding-right: 25px;
                                            margin-left: 10px;"><br/>
                        Discount: <input type="text" name="discount" style="margin-left: 27px;
                                         padding-right: 25px;"><br/>
                        Brand: <input type="text" name="brand" style="margin-left: 45px;
                                      padding-right: 25px;"><br/>
                        Category: <input type="text" name="category" style="    padding-right: 25px;
                                         margin-left: 26px;"><br/>
                        Modify: <input type="text" name="modify" style="    margin-left: 37px;
                                       padding-right: 25px;"><br/>
                        <input type="submit" value="Submit" />
                    </form>
                    <div class="clear"></div>
                    
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
    </body>
</html>
