/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AES;
import dao.UserDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author tuan
 */
public class LogInServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final String secretKey = "secretkeysecretkey";
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean rememberMe = request.getParameter("remember") != null;
        String encryptedPassword = AES.encrypt(password, secretKey);
        String username = new UserDAOImpl().getUserNameFromEmail(email);

        String password_err = "err", email_err = "err";

        if (email.equals("") || password.equals("")) {

            request.setAttribute("login_err", "Please input email and password to login!");

        } else if (!email.matches("(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")) {
            request.setAttribute("email_login_err", "Invalid email format!");

        } else {
            if (!new UserDAOImpl().checkLogin(email, encryptedPassword)) {
                request.setAttribute("login_err", "Login failed!");
            } else {

                email_err = "";
                password_err = "";
            }
        }

        String url = "";

        if (!password_err.equals("") || !email_err.equals("")) {
            url = "/login.jsp";

        } else {
            url = "/index.jsp";
            HttpSession s = request.getSession();
            s.setAttribute("username", username);
            s.setAttribute("email", email);
            if (rememberMe) {
                Cookie c = new Cookie("username", username);

                response.addCookie(c);
            }
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
