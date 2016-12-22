/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ReceiptDAOImpl;
import dao.ReceiptDetailDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Product;
import model.Receipt;
import model.ReceiptDetail;
import model.User;

/**
 *
 * @author tuan
 */
@WebServlet(name="CheckoutController",urlPatterns={"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    
    private ReceiptDAOImpl rc = new ReceiptDAOImpl();
    private ReceiptDetailDAOImpl rcd = new ReceiptDetailDAOImpl();

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String email = request.getParameter("user").equals("guest")||request.getParameter("user") == null?"":request.getParameter("user");
        String address = request.getParameter("address");
        String paymode = request.getParameter("paymode");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        
        try {
            if(!email.equals("")){//user
                if(rc.insertReceipt(new Receipt(0, new Timestamp(new Date().getTime()), paymode, address, new User("", "", "", true, 0, true, "", email, ""), 0))){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('check out successfully');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                }
                TreeMap<Product, Integer> list = cart.getList();
                for(Map.Entry<Product,Integer> ds : list.entrySet()){
                    Product p = new Product();
                    p.setProductID(ds.getKey().getProductID());
                    if(rcd.insertReceiptDetail(new ReceiptDetail(0, ds.getKey().getProductQuantity(), ds.getKey().getProductPrice(), new Receipt(new ReceiptDAOImpl().getLatestReceiptID(), new Timestamp(new Date().getTime()), "", "", new User("", "", "", true, 0, true, "", "", ""), 0), p)))
                            System.err.println("insert receipt detail thanh cong");
                   }
                
            }
            else{
                if(rc.insertReceipt(new Receipt(0, new Timestamp(new Date().getTime()), paymode, address, new User("", "", "", true, 0, true, "", "", ""), 0))){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('check out successfully');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                }
                TreeMap<Product, Integer> list = cart.getList();
                for(Map.Entry<Product,Integer> ds : list.entrySet()){
                    Product p = new Product();
                    p.setProductID(ds.getKey().getProductID());
                    if(rcd.insertReceiptDetail(new ReceiptDetail(0, ds.getKey().getProductQuantity(), ds.getKey().getProductPrice(), new Receipt(new ReceiptDAOImpl().getLatestReceiptID(), new Timestamp(new Date().getTime()), "", "", new User("", "", "", true, 0, true, "", "", ""), 0), p)))
                            System.err.println("insert receipt detail thanh cong");
                   }
            }
            response.sendRedirect("index.jsp");
            
        } catch (Exception e) {
        }
    }

   
   

}
