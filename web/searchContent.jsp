<%-- 
    Document   : searchContent
    Created on : Mar 25, 2017, 8:44:48 AM
    Author     : Sean
--%>

<%@page import="dao.BrandDAOImpl"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%
    String name = request.getParameter("dataString");
    ArrayList<Product> arr = new ProductDAOImpl().search(name);
%>
<%if(arr!=null){%>
<%for(Product p : arr){%>
<div id='display_box' align='left'><img src='resources/images/user/<%=p.getProductImage()%>' style='width:50px; height:50px; float:left; margin-right:6px;margin-bottom:5px; position: relative;' /><span class='name'><%=p.getProductName().toUpperCase()%></span>&nbsp;<br/>$<%=p.getProductPrice()%><br/><span style='font-size:9px; color:#999999'><%=new BrandDAOImpl().getBrandNameByBrandID(Long.toString(p.getBrand().getBrandID()))%></span><span style='visibility: hidden;' id="proid"><%=p.getProductID()%></span></div>
<%}%>
<%}%>
