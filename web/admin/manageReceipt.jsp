<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page import="dao.AdminDAOImpl"%>
<%@page import="model.Admin"%>
<%@page import="dao.UserDAOImpl"%>
<%@page import="dao.ReceiptDAOImpl"%>
<%@page import="model.Receipt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%Cookie[] cookies = request.getCookies();
    Cookie c = null;
    boolean isLogin = false;
    for (int i = 0; i < cookies.length; i++) {
            c = cookies[i];
            if (new AdminDAOImpl().checkLogin(new Admin(c.getName(),c.getValue()))) {
                    isLogin = true;
                }
            
        }
    if (!isLogin) {
            response.sendRedirect("login.jsp");
        }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="../resources/css/font-awesome.min.css" rel="stylesheet">
        <link href="../resources/css/prettyPhoto.css" rel="stylesheet">
        <link href="../resources/css/price-range.css" rel="stylesheet">
        <link href="../resources/css/animate.css" rel="stylesheet">
        <link href="../resources/css/main.css" rel="stylesheet">
        <link href="../resources/css/responsive.css" rel="stylesheet">


        <script src="../resources/js/html5shiv.js"></script>


        <script src="../resources/js/jquery.js"></script>
        <script src="../javascript/jquery.session.js"></script>
        <script src="../resources/js/bootstrap.min.js"></script>
        <script src="../resources/js/jquery.scrollUp.min.js"></script>
        <script src="../resources/js/price-range.js"></script>
        <script src="../resources/js/jquery.prettyPhoto.js"></script>
        <script src="../resources/js/main.js"></script>
        <script src="../javascript/js.cookie.js"></script>
        <link href="../resources/css/mos-style.css" rel='stylesheet' type='text/css' />
        <script type="text/javascript">
            $(document).ready(function () {
                $("#receipt tr:not(:first-child)").click(function (e) {
                    var id = $(this).find("#rid").html();
                    if (e.target.type == "checkbox") {


                        $.ajax({
                            type: "POST",
                            url: "../AdminReceiptServlet",
                            data: {dataString: id, action: "update"},
                            cache: false,
                            success: function (html) {
                                alert(html);
                                location.reload();

                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                if (xhr.status == 404) {
                                    alert(thrownError);
                                }
                            }
                        });
                        // stop the bubbling to prevent firing the row's click event
                        e.stopPropagation();
                    } else {
                        

                        $.ajax({
                            type: "POST",
                            url: "../AdminReceiptServlet",
                            data: {dataString: id, action: "display"},
                            cache: false,
                            success: function (html) {
                                $("#receiptdetail").html(html).fadeIn();

                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                if (xhr.status == 404) {
                                    alert(thrownError);
                                }
                            }
                        });
                    }
                });


            });
        </script>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    
                    <h3>Receipt Detail</h3>
                    <table id="receiptdetail" class="data"></table>
                    <h3>Receipt</h3>
                    <table id="receipt" class="data">
                        <tr class="data">
                            <th class="data">ID</th>
                            <th class="data">Book Date</th>
                            <th class="data">Pay Method</th>
                            <th class="data">Ship Address</th>
                            <th class="data">User</th>
                            <th class="data">Status</th>
                            <th class="data">Modify</th>
                        </tr>
                    <%for (Receipt receipt : new ReceiptDAOImpl().getReceiptList("order by receiptid desc")) {%>
                    <tr>
                        <td class="data" id="rid"><%=receipt.getReceiptID()%></td>
                        <td class="data"><%=receipt.getBookDate()%></td>
                        <td class="data"><%=receipt.getPayMode()%></td>
                        <td class="data"><%=receipt.getShipAddress()%></td>
                        <td class="data"><%=receipt.getUser().getUserID() == 0 ? "Guest" : new UserDAOImpl().getUserNameFromUserID(new Long(receipt.getUser().getUserID()).toString())%></td>
                        <td class="data"><%=receipt.getStatus() == 0 ? "not shipped" : "shipped"%></td>
                        <%if (receipt.getStatus() != 0) {%>
                        <td class="data"></td>
                        <%}%>
                        <%if (receipt.getStatus() == 0) {%>
                        <td class="data"><input type="checkbox" class="cb">Confirm</input></td>
                            <%}%>
                    </tr>
                    <%}%>
                </table>

            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
