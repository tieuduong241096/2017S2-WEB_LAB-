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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <link href="../resources/css/mos-style.css" rel='stylesheet' type='text/css' />
        <script src="../resources/js/jquery.js"></script>
        <script src="../resources/js/jquery-1.9.0.min.js"></script>
        <script src="../resources/js/jquery-1.7.1.min.js"></script>
        <script src="../resources/ajax/adminNavigate.js"></script>
        

    </head>
    <body>


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


    </body>
</html>
