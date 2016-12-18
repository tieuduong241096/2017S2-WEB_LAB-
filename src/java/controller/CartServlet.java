/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Product;

/**
 *
 * @author tuan
 */
@WebServlet(name="CartServlet",urlPatterns={"/CartServlet"})
public class CartServlet extends HttpServlet {

    private ProductDAOImpl pd = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String proid = request.getParameter("productid");
        String command = request.getParameter("command");
        ArrayList<Long> listBuy = null;
        String url = "";
        try {
            listBuy = (ArrayList<Long>) session.getAttribute("cartID");
            long idBuy = 0;
            if (request.getParameter("cartID") != null) {
                idBuy = Long.parseLong(request.getParameter("cartID"));

            }

            Product p = pd.getProductDetailByProductID(proid);
            switch (command) {
                case "insert":
                    if (listBuy == null) {
                        listBuy = new ArrayList<>();
                        session.setAttribute("cartID", listBuy);
                    }
                    if (listBuy.indexOf(idBuy) == -1) {
                        cart.insertToCart(p, 1);
                        listBuy.add(idBuy);
                    }
                    url = "/index.jsp";
                    break;
                case "plus":
                    if (listBuy == null) {
                        listBuy = new ArrayList<>();
                        session.setAttribute("cart", listBuy);
                    }
                    if (listBuy.indexOf(idBuy) == -1) {
                        cart.insertToCart(p, 1);
                        listBuy.add(idBuy);
                    }
                    url = "/cart.jsp";
                    break;
                case "minus":
                    if (listBuy == null) {
                        listBuy = new ArrayList<>();
                        session.setAttribute("cart", listBuy);
                    }
                    if (listBuy.indexOf(idBuy) == -1) {
                        cart.removeFromCart(p, 1);
                        listBuy.add(idBuy);
                    }
                    url = "/cart.jsp";
                    break;
                case "deleteall":
                    cart.removeAll(p);
                    url = "/cart.jsp";
                    break;
                default:
                    break;
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
            System.err.println("Error shopping cart +"+e.getMessage());
        }
    }

}
