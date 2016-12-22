<%-- 
    Document   : checkout
    Created on : Dec 16, 2016, 10:12:42 PM
    Author     : tuan
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page import="java.util.TreeMap"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

        <script>
            function setValueForHiddenField() {
                document.getElementById("hid").value = arguments[0];
            }

        </script>
    </head>
    <body onload="alertSuccess()">
        <%
            //session
            HttpSession s = request.getSession();

        %>
        <jsp:include page="header.jsp"></jsp:include>

            <section id="cart_items">
                <div class="container">
                    <div class="breadcrumbs">
                        <ol class="breadcrumb">
                            <li><a href="#">Home</a></li>
                            <li class="active">Check out</li>
                        </ol>
                    </div><!--/breadcrums-->

                    <div class="step-one">
                        <h2 class="heading" style="color: red;">Step1 - Checkout options</h2>
                    </div>
                    <div class="checkout-options">

                    <%if (s.getAttribute("username") == null) {%>
                    <ul class="nav">
                        <li>
                            <a href="login.jsp">Login and Checkout as Registered Account</a>
                        </li>
                        <li>
                            <label><input type="checkbox" onclick="setValueForHiddenField('guest')"> Checkout as Guest </label>
                        </li>

                    </ul>
                    <%}%>

                    <%if (s.getAttribute("username") != null) {%>
                    <ul class="nav">
                        <li>
                            <label>Hello, <%=s.getAttribute("username")%></label>
                        </li>
                    </ul>
                    <%}%>
                </div><!--/checkout-options-->

                <div class="register-req">
                    <p>*Please use Register And Checkout to easily get access to your order history, or use Checkout as Guest*</p>
                </div><!--/register-req-->

                <div class="step-one">
                    <h2 class="heading" style="color: red;">Step 2 - Checkout Information</h2>
                </div>
                <div class="shopper-informations">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="shopper-info">

                                <form action="CheckoutController" method="post">
                                    <p>Shipping Address</p>
                                    <textarea name="address"  placeholder="" rows="5"></textarea>
                                    <p>Pay Mode:</p>
                                    <select name="paymode">
                                        <option value="Pay after Shipping">Pay after Shipping</option>
                                        <option value="Credit Card">Credit Card</option>

                                    </select>
                                    <input type="hidden" id="hid" name="user" value="<%=s.getAttribute("email")%>"></input>

                                    <input type="submit" class="btn btn-primary" value="Confirm" />
                                </form>


                            </div>
                        </div>



                    </div>
                </div>

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

                %>
                <div class="review-payment">
                    <h2>Review & Payment</h2>
                </div>

                <div class="table-responsive cart_info">
                        <table class="table table-condensed">
                            <thead>
                                <tr class="cart_menu">
                                    <td class="image">Item</td>
                                    <td class="description"></td>
                                    <td class="price">Price</td>
                                    <td class="quantity">Quantity</td>
                                    <td class="size">Size</td>
                                    <td class="total">Total</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                            <% for (Map.Entry<Product, Integer> ds : list.entrySet()) {
                            %>
                            <tr>
                                <td class="cart_product">
                                    <a href=""><img src="resources/images/user/<%= ds.getKey().getProductImage()%>" alt=""></a>
                                </td>
                                <td class="cart_description">
                                    <h4><a href=""><%= ds.getKey().getProductName()%></a></h4>

                                </td>
                                <td class="cart_price">
                                    <p>$<%= new Double(ds.getKey().getProductPrice()).intValue()%></p>
                                </td>
                                <td class="cart_quantity">
                                    <div class="cart_quantity_button">
                                        <a class="cart_quantity_up" href="CartServlet?command=plus&productid=<%=ds.getKey().getProductID()%>&cartID=<%=System.currentTimeMillis()%>"> + </a>
                                        <input class="cart_quantity_input" type="text" value="<%=ds.getValue()%> " autocomplete="off" size="2" disabled="">
                                        <a class="cart_quantity_down" href="CartServlet?command=minus&productid=<%=ds.getKey().getProductID()%>&cartID=<%=System.currentTimeMillis()%>"> - </a>
                                    </div>
                                </td>
                                <td>
                                    <select>
                                        <option>7</option>
                                        <option>7.5</option>
                                        <option>8</option>
                                        <option>8.5</option>
                                        <option>9</option>
                                        <option>9.5</option>
                                        <option>10</option>
                                        <option>10.5</option>
                                        <option>11</option>
                                        <option>11.5</option>
                                        <option>12</option>
                                        <option>12.5</option>
                                        <option>13</option>
                                        <option>13.5</option>
                                        <option>14</option>
                                        <option>14.5</option>
                                    </select>
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


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
