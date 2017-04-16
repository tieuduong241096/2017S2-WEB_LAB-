/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAOImpl;
import dao.ReceiptDAOImpl;
import dao.ReceiptDetailDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Receipt;
import model.ReceiptDetail;
import model.User;

/**
 *
 * @author tuan
 */
@WebServlet("/AdminReceiptServlet")
public class AdminReceiptServlet extends HttpServlet {

    
    

    
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
         PrintWriter out = response.getWriter();
        String myData = request.getParameter("dataString");
        String result = "";
        if(request.getParameter("action").equals("display")){
        ArrayList<ReceiptDetail> list = new ArrayList<ReceiptDetail>();
        list = new ReceiptDetailDAOImpl().getReceiptDetailListByReceipt(new Receipt(Integer.parseInt(myData), new Timestamp(new Date().getTime()), "", "", new User(), 0));
        
        result = "<tr class=\"data\">\n"
                + "<th class=\"data\">ID</th>\n" 
                + "<th class=\"data\">Quantity</th>\n" 
                + "<th class=\"data\">Price</th>\n" 
                + "<th class=\"data\">Product Name</th>\n" 
                + "<th class=\"data\">Size</th>\n"
                
                + "</tr>\n";
        
        for (ReceiptDetail receiptDetail : list) {
            result+="\n<tr class=\"data\">\n"
                    + "<td class=\"data\">"+receiptDetail.getReceiptDetailID()+"</td>\n" 
                    + "<td class=\"data\">"+receiptDetail.getQuantity()+"</td>\n" 
                    + "<td class=\"data\">$"+receiptDetail.getPrice()+"</td>\n" 
                    + "<td class=\"data\">"+new ProductDAOImpl().getProductNameByProductID(Long.toString(receiptDetail.getProduct().getProductID()))+"</td>\n" 
                    + "<td class=\"data\">"+receiptDetail.getSize()+"</td>\n" 
                    + "</tr>";
        }
        
        }
        else if(request.getParameter("action").equals("update")){
            new ReceiptDAOImpl().updateReceipt(myData);
            result = "";
        }
        response.getWriter().write(result);
    }

   

}
