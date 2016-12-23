/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AES;
import dao.AdminDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Admin;

/**
 *
 * @author tuan
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String name = request.getParameter("name");
       String pass = request.getParameter("password");
       
       final String secretKey = "secretkeysecretkey";
       String encryptedPassword = AES.encrypt(pass, secretKey);
       Admin a = new Admin(name,encryptedPassword);
       String url="";
        if (new AdminDAOImpl().checkLogin(a)) {
            url = "admin/index.jsp";
            Cookie c = new Cookie(name, encryptedPassword);
            response.addCookie(c);
        }
        else{
           request.setAttribute("login_err", "login failed");
           url = "admin/login.jsp";
        }
        
       response.sendRedirect(url);

    }

    

}
