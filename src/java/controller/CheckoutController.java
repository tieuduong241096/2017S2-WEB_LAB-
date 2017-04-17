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
import java.net.CookieStore;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
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
        String email = request.getParameter("user").equals("guest") || request.getParameter("user") == null ? "" : request.getParameter("user");
        String address = request.getParameter("address");
        String paymode = request.getParameter("paymode");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Cookie[] sizes = request.getCookies();
        HashMap<Product, Integer> list = cart.getList();

        String address_err = "err";
        if (address.equals("")) {

            request.setAttribute("address_err", "Please input your address!");

        } else if (!address.matches("^([a-zA-Z0-9]+\\s)*[a-zA-Z0-9]+$") || address.length() < 6 || address.length() > 300) {
            request.setAttribute("address_err", "10 to 300 characters required, no more than 1 space, no special characters");

        } else {
            request.setAttribute("address", address);
            address_err = "";
        }

        if (!address_err.equals("")) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkout.jsp");
            rd.forward(request, response);
        } else {
            try {
                if (!email.equals("")) {//user
                    if (rc.insertReceipt(new Receipt(0, new Timestamp(new Date().getTime()), paymode, address, new User("", "", "", true, 0, true, "", email, ""), 0))) {
                        list.entrySet().forEach((ds) -> {
                            Product p = new Product();
                            p.setProductID(ds.getKey().getProductID());
                            Double size = 0.0;
                            Cookie deleteCookie = null;
                            for (Cookie size1 : sizes) {
                                if (size1.getName().equals(Long.toString(p.getProductID()))) {
                                    size = new Double(size1.getValue());
                                    deleteCookie = size1;
                                }
                            }
                            System.out.println("Aaaaaaaaaaaaaaaaaaa");
                            if (rcd.insertReceiptDetail(new ReceiptDetail(0, ds.getValue(), (ds.getKey().getProductPrice() * ds.getValue()) - (ds.getKey().getProductPrice() * ds.getValue() * ds.getKey().getDiscount()), new Receipt(new ReceiptDAOImpl().getLatestReceiptID(), new Timestamp(new Date().getTime()), "", "", new User("", "", "", true, 0, true, "", "", ""), 0), p, size))) {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('User or password incorrect');");
                                out.println("location='index.jsp';");
                                out.println("</script>");
                                deleteCookie.setValue(null);
                                deleteCookie.setMaxAge(0);

                                response.addCookie(deleteCookie);
                            }
                        });
                    }

                } else {
                    if (rc.insertReceipt(new Receipt(0, new Timestamp(new Date().getTime()), paymode, address, new User("", "", "", true, 0, true, "", "", ""), 0))) {
                        list.entrySet().forEach((ds) -> {
                            Product p = new Product();
                            p.setProductID(ds.getKey().getProductID());
                            Double size = 0.0;
                            Cookie deleteCookie = null;
                            for (Cookie size1 : sizes) {
                                if (size1.getName().equals(Long.toString(p.getProductID()))) {
                                    size = new Double(size1.getValue());
                                    deleteCookie = size1;
                                }
                            }
                            if (rcd.insertReceiptDetail(new ReceiptDetail(0, ds.getValue(), (ds.getKey().getProductPrice() * ds.getValue()) - (ds.getKey().getProductPrice() * ds.getValue() * ds.getKey().getDiscount()), new Receipt(new ReceiptDAOImpl().getLatestReceiptID(), new Timestamp(new Date().getTime()), "", "", new User("", "", "", true, 0, true, "", "", ""), 0), p, size))) {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('User or password incorrect');");
                                out.println("location='index.jsp';");
                                out.println("</script>");

                                deleteCookie.setValue(null);
                                deleteCookie.setMaxAge(0);

                                response.addCookie(deleteCookie);
                            }
                        });

                    }

                }
                session.removeAttribute("cart");
                session.removeAttribute("cartID");
                HttpSession s = request.getSession();
                s.setAttribute("success", "checkout successfully");
                response.sendRedirect("redirect.jsp");

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
