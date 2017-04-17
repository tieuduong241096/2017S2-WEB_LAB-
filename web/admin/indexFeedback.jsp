<%-- 
    Document   : manageFeedback
    Created on : Dec 22, 2016, 8:45:40 AM
    Author     : tuan
--%>

<%@page import="dao.UserDAOImpl"%>
<%@page import="model.Feedback"%>
<%@page import="dao.FeedbackDAOImpl"%>
<%@page import="dao.AdminDAOImpl"%>
<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<head>
    <link href="../resources/css/mos-style.css" rel='stylesheet' type='text/css' />
    <script src="../resources/js/jquery.js"></script>
    <script src="../resources/js/jquery-1.9.0.min.js"></script>
    <script src="../resources/js/jquery-1.7.1.min.js"></script>
    <script src="../resources/ajax/adminNavigate.js"></script>
</head>



<table id="feedback" class="data">
    <h3>Feedback</h3>
    <p style="color: red" id="inputerr"></p>
    <tr class="data">
        <th class="data">ID</th>
        <th class="data">User Name</th>
        <th class="data">Feedback Date</th>
        <th class="data">Title</th>
        <th class="data">Content</th>
        <th class="data">Reply Date</th>
        <th class="data">Reply Content</th>
        <th class="data">Modify</th>
    </tr>
    <%for (Feedback feedback : new FeedbackDAOImpl().getFeedBackList("order by feedbackid desc")) {%>
    <tr>
        <td class="data" id="fid"><%=feedback.getFeedbackID()%></td>
        <td class="data"><%=new UserDAOImpl().getUserNameFromUserID(Long.toString(feedback.getUser().getUserID()))%></td>
        <td class="data"><%=feedback.getFeedbackDate()%></td>
        <td class="data"><%=feedback.getTitle()%></td>
        <td class="data"><%=feedback.getContent()%></td>
        <td class="data"><%=feedback.getReplyDate() == null ? "" : feedback.getReplyDate()%></td>
        <td class="data" id="repcontent"><%=feedback.getReplyContent() == null ? "" : feedback.getReplyContent()%></td>
        <td class="fa fa-pencil-square-o"><input type="text" placeholder="Reply..." id="rep"></input></td>
    </tr>
    <%}%>
</table>