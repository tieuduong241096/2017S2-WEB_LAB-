<%-- 
    Document   : index
    Created on : Nov 18, 2016, 10:06:11 PM
    Author     : tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*"%>
<%@page import="connect.Controller"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        </head>
    <body>
        <%
            Integer id = Integer.parseInt(request.getParameter("cid"));

            if (id != null) {

                Vector<Integer> cid = new Vector<Integer>();

                String query = "select * from category where categoryid = " + id;

                ResultSet rs = Controller.queryExecute(query);

                while (rs.next()) {
                    cid.add(Integer.parseInt(rs.getString("categoryid")));
                }

                rs.close();

                query = "delete from category where categoryid = " + id;

                try{
                Controller.updateExecute(query);

             

                String cname = request.getParameter("cname");
                String bid = request.getParameter("bid");

                if (cname != null) {
                    query = "insert into category(categoryid,categoryname,brandid) values('"
                            + id + "','" + cname + "','" + bid + "')";
                    Controller.updateExecute(query);

                    /*for (int i = 0; i < cid.size(); i++) {
                        query = "insert into studentcourse(StudentID,CourseID) values('"
                                + cid.get(i) + "','" + id + "')";

                        Controller.updateExecute(query);
                    }*/

                    response.sendRedirect("../admin/manageCategory.jsp");
                    return;
                }
                 }
            catch(Exception e){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Cannot edit this category!');");
                out.println("location='../admin/manageCategory.jsp';");
                out.println("</script>");
} 
                
            }

        %>      
        </body>
</html>
