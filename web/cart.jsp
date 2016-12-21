<%-- 
    Document   : cart
    Created on : Oct 12, 2016, 5:14:21 PM
    Author     : tuan
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="model.Product"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CART</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/css/font-awesome.min.css" rel="stylesheet">
        <link href="resources/css/prettyPhoto.css" rel="stylesheet">
        <link href="resources/css/price-range.css" rel="stylesheet">
        <link href="resources/css/animate.css" rel="stylesheet">
        <link href="resources/css/main.css" rel="stylesheet">
        <link href="resources/css/responsive.css" rel="stylesheet">


        <script src="resources/js/html5shiv.js"></script>


        <script src="resources/js/jquery.js"></script>
        <script src="javascript/jquery.session.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery.scrollUp.min.js"></script>
        <script src="resources/js/price-range.js"></script>
        <script src="resources/js/jquery.prettyPhoto.js"></script>
        <script src="resources/js/main.js"></script>
        <script src="javascript/js.cookie.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function () {
                 $("#checkout").click(function () {
                $('.table-condensed tr').each(function () {
                    var productid = $(this).find(".productid").html();
                    var productsize = $(this).find(".productsizeitem option:selected").html();
                    
                    if(typeof productid !== 'undefined' || productid){
                       Cookies.set(productid.trim(),productsize);
                    } 
                    
                });
                
                });
            });
        </script>
       
    </head>
    <body>
        <%
            
            TreeMap<Product, Integer> list = null;
            if (session.getAttribute("cart") != null) {
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = new Cart();
                    session.setAttribute("cart", cart);
                }

                list = cart.getList();
            }

            if (session.getAttribute("cart") == null) {
                Cart cart = new Cart();

                list = null;
            }

            ArrayList<Double> sizes = new ArrayList<>();

            sizes.add(7.0);
            sizes.add(7.5);
            sizes.add(8.0);
            sizes.add(8.5);
            sizes.add(9.0);
            sizes.add(9.5);
            sizes.add(10.0);
            sizes.add(10.5);
            sizes.add(11.0);
            sizes.add(11.5);
            sizes.add(12.0);
            sizes.add(12.5);
            sizes.add(13.0);
            sizes.add(13.5);
            sizes.add(14.0);
            sizes.add(14.5);
        %>

        <jsp:useBean id="size" scope="session" class="model.SizeBean" />
        <jsp:setProperty name="size" property="sizes" value="<%=sizes%>" />


        <!--HEADER-->
        <jsp:include page="header.jsp"></jsp:include>

            <section id="cart_items">
                <div class="container">
                    <div class="breadcrumbs">
                        <ol class="breadcrumb">
                            <li><a href="#">Home</a></li>
                            <li class="active">Shopping Cart</li>
                        </ol>
                    </div>
                    <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image"></td>


                                <td class="description">Name</td>
                                <td class="price">Price</td>
                                <td class="quantity">Quantity</td>

                                <td class="size">Size</td>
                                <td></td>
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        
                
                        <tbody>
                            <% for (Map.Entry<Product, Integer> ds : list.entrySet()) {
                            %>
                            <tr>
                                <td class="cart_product">
                                    <a href=""><img src="resources/images/user/<%= ds.getKey().getProductImage()%>" alt="" style="width: 225px;height: 225px;"></a>
                                </td>
                                <td class="cart_description">
                                    <h4><a href=""><%= ds.getKey().getProductName()%></a></h4>

                                </td>
                                <td class="cart_price">
                                    <p>$<%= new Double(ds.getKey().getProductPrice()).intValue()%></p>
                                </td>
                                <td class="cart_quantity">
                                    <div class="cart_quantity_button">
                                        <a class="cart_quantity_up" href="CartServlet?action=cart&command=plus&productid=<%=ds.getKey().getProductID()%>&cartID=<%=System.currentTimeMillis()%>"> + </a>
                                        <input class="cart_quantity_input" type="text" value="<%=ds.getValue()%> " autocomplete="off" size="2" disabled="">
                                        <a class="cart_quantity_down" href="CartServlet?action=cart&command=minus&productid=<%=ds.getKey().getProductID()%>&cartID=<%=System.currentTimeMillis()%>"> - </a>
                                    </div>
                                </td>
                                <!--lay cookie cho size theo product id-->
                                <%
                                    Cookie[] sizess = request.getCookies();
                                    String sizeItem = "";
                                    for (Cookie size1 : sizess) {
                                        if (size1.getName().equals(Long.toString(ds.getKey().getProductID()))) {
                                            sizeItem = size1.getValue();
                                        }
                                    }

                                %>


                                <td>
                                    <select id="<%=ds.getKey().getProductID()%>" name="productsizeitem" class="productsizeitem">

                                        <%for (Double size1 : size.getSizes()) {%>
                                        <option><%=size1%></option>
                                        <%}%>

                                    </select>
                                </td>

                        <script>

                            function setSelectedIndex(s, v) {

                                for (var i = 0; i < s.options.length; i++) {

                                    if (s.options[i].text == v) {

                                        s.options[i].selected = true;

                                        return;

                                    }

                                }

                            }

                            setSelectedIndex(document.getElementById('<%=ds.getKey().getProductID()%>'), <%=sizeItem%>);

                        </script>

                        <td style="visibility: hidden;" class="productid">
                            <%= ds.getKey().getProductID()%>
                        </td>
                        <td class="cart_total">
                            <p class="cart_total_price">$<%= new Double(ds.getValue() * ds.getKey().getProductPrice()).intValue()%></p>
                        </td>
                        <td class="cart_delete">
                            <a class="cart_quantity_delete" href="CartServlet?command=deleteall&productid=<%=ds.getKey().getProductID()%>&cartID=<%=System.currentTimeMillis()%>"><i class="fa fa-times"></i></a>
                        </td>
                        </tr>

                        <%}%>

                        

                        </tbody>
                    </table>
                </div>
            </div>
        </section> <!--/#cart_items-->

        <section id="do_action" style="border: none">
            <div class="container">
                
                <div class="row">
                    
                    <div class="col-sm-6">
                        <div class="total_area">
                            
                           
                            <a class="btn btn-default check_out" id="checkout" href="AccountController?action=checkout">Check Out</a>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--/#do_action-->



        <!--FOOTER-->
        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
