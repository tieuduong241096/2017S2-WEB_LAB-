/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connect.DBConnect;
import dao.BrandDAOImpl;
import dao.ProductDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBException;
import model.Brand;
import model.Category;
import model.Product;


/**
 *
 * @author tuan
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        String myData = request.getParameter("dataString");
        Product p = new Product();

        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM product WHERE productname like '%" + myData+"%' order by productname";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            String string = "";
            while (rs.next()) {

                p.setProductID(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setProductPrice(rs.getDouble("productprice"));
                p.setProductImage(rs.getString("productimage"));
                p.setProductQuantity(rs.getInt("productquantity"));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getDouble("discount"));
                p.setBrand(new Brand(rs.getInt("brandid"), ""));
                p.setCategory(new Category(rs.getInt("categoryid"), "", new Brand()));
                
                string += "<div id='display_box' align='left'><img src='resources/images/user/" + p.getProductImage() + "' style='width:50px; height:50px; float:left; margin-right:6px;margin-bottom:5px;' /><span class='name'>" + p.getProductName().toUpperCase() + "</span>&nbsp;<br/>$" + p.getProductPrice() + "<br/><span style='font-size:9px; color:#999999'>" + new BrandDAOImpl().getBrandNameByBrandID(Long.toString(p.getBrand().getBrandID()))+ "</span><span style='visibility:hidden' class='proid'>"+p.getProductID()+"</span></div>";
                
                        

            }
            
            
            String updateString = string.replace(myData.toUpperCase(), "<b style='color:red'>"+myData.toUpperCase()+"</b>");
                response.getWriter().write(updateString);
            connection.close();

        } catch (SQLException ex) {

            System.err.println("NO PRODUCT DETAIL FOUND");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
