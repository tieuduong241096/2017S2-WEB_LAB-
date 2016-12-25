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
<html id="wholeBody">
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
                    //time
                    //setup before functions
                    var typingTimer;                //timer identifier
                    var doneTypingInterval = 2000;  //time in ms, 5 second for example
                    var input;
                    var id;
                $('#feedback').on('keyup', '#rep', function () {
                    
                    clearTimeout(typingTimer);
                    typingTimer = setTimeout(doneTyping, doneTypingInterval);
                    
                    input = $(this).val();
                    
                    
                     if (!/^[a-zA-Z\s]+$/.test(input)) {
                        $("#inputerr").text("*Input your reply(letters only)*");
                    }else { 
                    //reply
                    $(this).closest('tr').find("#repcontent").text(input);
                    }
                    
                    //id
                    var $row = $(this).parents('tr');
                    id = $row.find('#fid').html();

                    

                    

                });
                
                //on keydown, clear the countdown 
                $('#feedback').on('keydown', function () {
                    clearTimeout(typingTimer);
                });
//                
                function doneTyping () {
                    if (!/^[a-zA-Z\s]+$/.test(input)) {
                        $("#inputerr").text("*Input your reply(letters only)*");
                    } else {
                        $.ajax({
                            
                            type: "POST",
                            url: "../AdminFeedbackServlet",
                            data: {dataString: input,id:id},
                            cache: false,
                            success: function (html) {
                               location.reload();

                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                if (xhr.status == 404) {
                                    alert(thrownError);
                                }
                            }
                        });

                        
                    }
                   input = "";
                   id="";
                }
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">



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

            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
