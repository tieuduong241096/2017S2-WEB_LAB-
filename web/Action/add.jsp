<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.Controller"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function checkcID() {
                var cid = document.getElementById("cid").value;
                if (cid.match(/^\s*$/)) {
                    document.getElementById("err1").innerHTML = "     *It must not be empty";
                    return false;
                } 
                else if(cid == 'asd' && isNaN(value) == true){span.innerHTML ='It must be a number';}
                else {
                    document.getElementById("err1").innerHTML = "";
                    return true;
                }                
            }
            function checkcname() {
                var cname = document.getElementById("cname").value;
                var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                if (email.match(/^\s*$/)) {
                    document.getElementById("err2").innerHTML = "     *Category name must not be empty";

                } else if (!cname.match(re)) {
                    document.getElementById("err2").innerHTML = "     *invalid name format";
                    return false;
                } else {
                    document.getElementById("err2").innerHTML = "";
                    return true;
                }
            }
            function check() {
                if (checkcID() && checkcname()) {
                   setCookie("cid",document.getElementById("cid").value,365);
                   setCookie("cname",document.getElementById("cname").value,365);
                   window.location.reload();
                   return true;
                }
                return false;
            }
        </script>

<link href="../resources/css/mos-style.css" rel='stylesheet' type='text/css' />

        
    </head>
    <body onload="focuscID()">
        <jsp:include page="../admin/header.jsp"></jsp:include>
        
        <div id="wrapper">
        <jsp:include page="../admin/menu.jsp"></jsp:include>
       <div id="rightContent">
	        
        <h1>Add new Category into system!</h1>
       
        <form method="post" action="../Action/addtoSQL.jsp" id="form">
          <table>
                <tr>
                    <td>Category ID</td>
                    <td><input type="text" name="cid" value="" id="cid" oninput="checkcID()" /><span id="err1" style="color: red"></span></td>
                </tr>
                <tr>
                    <td>Category name</td>
                    <td><input type="text" name="cname" value="" id="cname" oninput="checkcname()" /><span id="err1" style="color: red"></span></td>
                </tr>
                <tr>
                    <td>Brand ID</td>
                    <td>
                        <select name="bid">
                            <%
            String query = "select brandid from brand";

            ResultSet rs = Controller.queryExecute(query);

            String bid ="";
            while(rs.next()) {
                
                bid = rs.getString("brandid");
                %><option><%=bid%>
            </option><%              
            }           
            rs.close();%>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="s3" value="Add"></td>
                    <td>
                        <input type="button" onclick="location.href='../admin/manageCategory.jsp';" value="Cancel" />
                    </td>
                </tr>
            </table>
            </form>        
        <br>
        <hr>
	</div>
        <div class="clear"></div>
        <jsp:include page="../admin/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
