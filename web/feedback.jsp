<%-- 
    Document   : test
    Created on : Dec 13, 2016, 9:15:17 PM
    Author     : tuan
--%>

<%@page import="dao.UserDAOImpl"%>
<%@page import="model.Feedback"%>
<%@page import="dao.FeedbackDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hỏi đáp | FSShop</title>

        <link rel="stylesheet" href="css/main_user.css"/>
        <script language="javascript" src="javascript/form.js"></script>
        <script type="text/javascript" src="javascript/jquery-1.9.0.min.js"></script>
        <script type="text/javascript" src="javascript/checkTK.js"></script>
        <link href="favicon.ico" rel="shortcut icon" />

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

        <script src="javascript/validateFeedback.js"></script>

    </head>
    <body>
        <!--HEADER-->
        <jsp:include page="header.jsp"></jsp:include>
            <section id="form">
            <%
                FeedbackDAOImpl fb = new FeedbackDAOImpl();
                UserDAOImpl udi = new UserDAOImpl();

                String content_err = "", title_err = "";

                if (request.getAttribute("content_err") != null) {
                    content_err = (String) request.getAttribute("content_err");
                }
                if (request.getAttribute("title_err") != null) {
                    title_err = (String) request.getAttribute("title_err");
                }
            %>

            <div class="clr"></div>
            <a id='noop-top' style='display: none; position: fixed; 
               bottom: 1px; right:1%; cursor:pointer;font:12px arial;'>
                <img src="img/top-button.png"/></a>
            <div class="colcenterask">
                <div class="filview">
                    <a id="tagNoAnswer" >Newest</a>
                    <span style="font-size:24px;padding-top:3%">|</span>
                </div>

                <%for (Feedback f : fb.getFeedBackList("order by feedbackid desc")) {%>
                <ul class="listask">

                    <li class="item">
                        
                        <div><%=f.getContent()%></div>

                        <div class="info">
                            <i><%= udi.getUserNameFromUserID(Long.toString(f.getUser().getUserID()))%> sent</i>
                            <span><%=f.getFeedbackDate()%></span>       
                        </div>
                        <div class="traloi" style="background-color: rgba(40, 138, 214, 0.18);margin-left:9%;margin-top:3%; border-radius:10px; padding:10px;padding-bottom: 15px;">
                            <p><b>Admin:</b><%=f.getReplyContent() == null ? "Typically reply within an hour" : f.getReplyContent()%>
                                <span class="info" style="float:right;margin-top:2%;">  <%=f.getReplyDate() == null ? "" : "rep " + f.getReplyDate()%></span>
                            </p>

                        </div>       
                    </li>

                </ul>
                <%}%>
            </div>


            <div class="postask">
                <div class="titlepostask"><strong>Feedback</strong></div>

                <form action="FeedbackController" METHOD="POST" class="hoidap" name="hoidap">
                    <p style="color: red"><%= title_err%></p>
                    <p id="err4" style="color: red"></p>
                    <input style="width:386px;padding:10px" class="tieude" name="title" id="title" type="text" placeholder="Title" oninput="checkTitle()"/>
                    <textarea cols="5" rows="8" id="content" name="content" type="text" placeholder="Content" style="resize:none" oninput="checkContent()"></textarea>
                    <div id="lberror" style="padding:5px; color: #FF0000"><p style="color: red"><%= content_err%></p><p id="err5" style="color: red"></p></div>
                    <div class="addandsend">


                        <input style="text-align:center" type="submit" class="buttonhoidap" id="buttonhoidap" value="Submit" />
                    </div>
                    <input type="hidden" name="action" value="add">

                </form>

            </div>
            <div class="clr"></div>
            <div class="clr"></div>
        </section>
        <!--FOOTER-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
