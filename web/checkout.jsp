<%-- 
    Document   : checkout
    Created on : Dec 16, 2016, 10:12:42 PM
    Author     : tuan
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page import="java.util.TreeMap"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            //session
            HttpSession s = request.getSession();
            double total = 0.0;
            String address_err = "";
            if (request.getAttribute("address_err") != null) {
                address_err = (String) request.getAttribute("address_err");
            }
            
            if (s.getAttribute("cart")==null) {
                    response.sendRedirect("index.jsp");
                }
        %>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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

        <script src="resources/js/validateCheckout.js"></script>


        <!--Use Jquery to save cookie-->
        <script src="resources/js/js.cookie.js"></script>

        <script>
            function setValueForHiddenField() {
                document.getElementById("hid").value = arguments[0];
            }


        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#checkout").click(function () {
                    $('.table-condensed tr').each(function () {
                        var productid = $(this).find(".productid").html();
                        var productsize = $(this).find(".productsizeitem option:selected").html();

                        if (typeof productid !== 'undefined' || productid || typeof productsize !== 'undefined' || productsize) {
                            Cookies.set(productid.trim(), productsize);
                        }

                    });

                });

            });
        </script>
    </head>
    <jsp:useBean id="size" scope="session" class="model.SizeBean" />
    <body>
        

        <jsp:include page="header.jsp"></jsp:include>

            <section id="cart_items">
                <div class="container">
                    
                <%if (s.getAttribute("username") == null) {%>
                <div class="step-one">
                    <h2 class="heading" style="color: red;">Step1 - Checkout options</h2>
                </div>
                <div class="checkout-options">


                    <ul class="nav">
                        <li>
                            <a href="login.jsp?checkout=true">Checkout as Registered Account</a>
                        </li>
                        <li>
                            <label><input type="checkbox" onclick="setValueForHiddenField('guest')"> Checkout as Guest </label>
                        </li>

                    </ul>
                    <div class="register-req">
                        <p>*Please use Register And Checkout to easily get access to your order history, or use Checkout as Guest*</p>
                    </div><!--/register-req-->


                    </div><!--/checkout-options-->
                    <%}%>
                    
                
                <div class="step-one">
                    <h2 class="heading" style="color: red;">Checkout Information</h2>
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
                        <%
                            HashMap<Product, Integer> list = null;
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

                        %>

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
                                        <a class="cart_quantity_up" href="CartServlet?action=checkout&command=plus&productid=<%=ds.getKey().getProductID()%>&cartID=<%=System.currentTimeMillis()%>"> + </a>
                                        <input class="cart_quantity_input" type="text" value="<%=ds.getValue()%> " autocomplete="off" size="2" disabled="">
                                        <a class="cart_quantity_down" href="CartServlet?action=checkout&command=minus&productid=<%=ds.getKey().getProductID()%>&cartID=<%=System.currentTimeMillis()%>"> - </a>
                                    </div>
                                </td>
                                <!--lay cookie cho size theo product id-->
                                <%
                                    Cookie[] sizes = request.getCookies();
                                    String sizeItem = "";
                                    for (Cookie size1 : sizes) {
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
                            <%
                                total += new Double(ds.getValue() * ds.getKey().getProductPrice()).intValue();
                            %>
                        </td>
                        <td class="cart_delete">
                            <a class="cart_quantity_delete" href="CartServlet?command=deleteall&productid=<%=ds.getKey().getProductID()%>&cartID=<%=System.currentTimeMillis()%>"><i class="fa fa-times"></i></a>
                        </td>
                        </tr>

                        <%}%>

                        <tr>
                            <td colspan="4">&nbsp;</td>
                            <td colspan="2">
                                <table class="table table-condensed total-result">
                                    <tr>
                                        <td>Cart Sub Total</td>
                                        <td>$<%=total%></td>
                                    </tr>
                                    <tr>
                                        <td>Exo Tax</td>
                                        <td>$0</td>
                                    </tr>
                                    <tr class="shipping-cost">
                                        <td>Shipping Cost</td>
                                        <td>Free</td>										
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                        <td><span>$<%=total%></span></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <div class="shopper-informations">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="shopper-info">

                                <form action="CheckoutController" method="post">
                                    <p>Shipping Address</p>
                                    <p style="color: red"><%= address_err%></p>
                                    <p id="err6" style="color: red;font-size: small"></p>
                                    <textarea name="address" id="address"  placeholder="" rows="5" oninput="checkAddress()"></textarea>
                                    <p>Pay Mode:</p>
                                    <select name="paymode">
                                        <option value="Pay after Shipping">Pay after Shipping</option>
                                        <option value="Credit Card">Credit Card</option>

                                    </select>
                                    <input type="hidden" id="hid" name="user" value="<%=s.getAttribute("email")%>"></input>

                                    <input type="submit" class="btn btn-primary" value="Confirm" id="checkout"/>
                                </form>


                            </div>
                        </div>



                    </div>
                </div>





            </div>
        </section> <!--/#cart_items-->


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
