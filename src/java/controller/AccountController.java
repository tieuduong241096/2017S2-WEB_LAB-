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
public class AccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action == null) {
            User user = checkCookie(request);
            if (user == null) {

                //khong check remember me, nghia la khong luu cookie trong browser
                session.removeAttribute("username");
                session.removeAttribute("email");
                session.removeAttribute("cart");
                session.removeAttribute("cartID");

                request.getRequestDispatcher("index.jsp").forward(request, response);

            } else {//check remeber me, nghia la co luu cookie trong browser
                if (new UserDAOImpl().checkLogin(user.getEmail(), user.getPassword())) {
                    session.setAttribute("username", new UserDAOImpl().getUserNameFromEmail(user.getEmail()));
                    session.setAttribute("email", user.getEmail());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }
        } else if (action.equals("signout")) {
            // <editor-fold defaultstate="collapsed" desc="Log Out Action">
            //remove session
            session.removeAttribute("username");
            session.removeAttribute("email");
            //remove cookie
            Cookie[] cookies = request.getCookies();
            for (Cookie c : cookies) {
                if (c.getName().equalsIgnoreCase("email")) {
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
                if (c.getName().equalsIgnoreCase("password")) {
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
            request.getRequestDispatcher("index.jsp").forward(request, response);
            //</editor-fold>
        } else if (action.equals("feedback")) {
            // <editor-fold defaultstate="collapsed" desc="Feedback Action">
            if (session.getAttribute("username") != null && session.getAttribute("email") != null) {
                request.getRequestDispatcher("feedback.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            //</editor-fold>
        } else if (action.equals("checkout")) {
            // <editor-fold defaultstate="collapsed" desc="Checkout Action">
            if (session.getAttribute("cart") == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
            //</editor-fold>
        }
    }

    private User checkCookie(HttpServletRequest request) {
        // <editor-fold defaultstate="collapsed" desc="check cookie">
        Cookie[] cookies = request.getCookies();
        User user = null;
        String email = "", password = "";

        if (cookies != null) {

            for (Cookie c : cookies) {
                if (c.getName().equalsIgnoreCase("email")) {
                    email = c.getValue();
                }
                if (c.getName().equalsIgnoreCase("password")) {
                    password = c.getValue();
                }

            }
            if (!email.isEmpty() && !password.isEmpty()) {
                user = new User("", password, "", true, 0, true, "", email, "");
            }

        }
        return user;
        // </editor-fold>
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("login")) {
            // <editor-fold defaultstate="collapsed" desc="Login Action">
            final String secretKey = "secretkeysecretkey";
            String email = request.getParameter("email1");
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
                url = request.getParameter("checkout")!=null?"/checkout.jsp":"/index.jsp";
                HttpSession s = request.getSession();
                s.setAttribute("username", username);
                s.setAttribute("email", email);

                if (rememberMe) {
                    Cookie c = new Cookie("email", email);
                    c.setMaxAge(3600);
                    response.addCookie(c);

                    Cookie c1 = new Cookie("password", encryptedPassword);
                    c.setMaxAge(3600);
                    response.addCookie(c1);
                }
            }
            
            if(url.equals("/checkout.jsp")){
                response.sendRedirect("AccountController?action=checkout");
            }
            else{
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
            }
            // </editor-fold>
        } else if (action.equals("signup")) {
            // <editor-fold defaultstate="collapsed" desc="Sign Up Action">
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();
            String email = request.getParameter("email").trim();
            String fullname = request.getParameter("fullname").trim();
            boolean status = true;
            String age = request.getParameter("age").trim();
            boolean gender = request.getParameter("gender").equals("male");
            String address = request.getParameter("address").trim();
            String phone = request.getParameter("phone").trim();

            String username_err = "err", password_err = "err", email_err = "err", fullname_err = "err", age_err = "err", address_err = "err", phone_err = "err";

            final String secretKey = "secretkeysecretkey";

            if (username.equals("")) {

                request.setAttribute("username_err", "Please input your user name");

            } else if (!username.matches("^[a-zA-Z0-9]+(([\\_\\-][a-zA-Z 0-9])?[a-zA-Z0-9]*)*$") || username.length() < 6 || username.length() > 20) {
                request.setAttribute("username_err", "the length is 6 to 20, no space, no special character");
            } else {
                request.setAttribute("username", username);
                username_err = "";
            }

            if (password.equals("")) {

                request.setAttribute("password_err", "Please input your password!");

            }
            String[] checkpass = new String[5];
            checkpass[0] = "^\\S{6,30}$";
            checkpass[1] = ".*[a-z].*";
            checkpass[2] = ".*[A-Z].*";
            checkpass[3] = ".*\\d.*";
            checkpass[4] = ".*[^A-Za-z0-9\\s].*";
            for (int i = 0; i < checkpass.length; i++) {
                if (!password.matches(checkpass[i]) || password.length() < 6 || password.length() > 30) {
                    request.setAttribute("password_err", "the length is 6 to 30, at least 1 lowercase letter, 1 uppercase letter, 1 special character, 1 number!");

                } else {
                    password_err = "";
                }
            }

            if (email.equals("")) {

                request.setAttribute("email_err", "Please input your email!");

            } else if (new UserDAOImpl().checkAccountExist(email)) {
                request.setAttribute("email_err", "email exists");

            } else if (!email.matches("(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")) {
                request.setAttribute("email_err", "Invalid email format!");

            } else {
                request.setAttribute("email", email);
                email_err = "";
            }

            if (fullname.equals("")) {

                request.setAttribute("fullname_err", "Please input your fullname!");

            } else if (fullname.length() < 2 || fullname.length() > 50) {
                request.setAttribute("fullname_err", "the length is 2 to 50 character");

            } else if (!fullname.matches("^[a-zA-Z_]+( [a-zA-Z_]+)*$")) {
                request.setAttribute("fullname_err", "no more than 1 spaces, no special characters, no number");

            } else {
                request.setAttribute("fullname", fullname);
                fullname_err = "";
            }

            if (age.equals("")) {

                request.setAttribute("age_err", "Please input your age!");

            } else if (!age.matches("^\\d+$") || age.length() != 2 || Integer.parseInt(age) < 18 || Integer.parseInt(age) > 30) {
                request.setAttribute("age_err", "age from 18 to 30 only");

            } else {
                request.setAttribute("age", age);
                age_err = "";
            }

            if (address.equals("")) {

                request.setAttribute("address_err", "Please input your address!");

            } 
            

            
            else if (!address.matches("^([a-zA-Z0-9]+\\s)*[a-zA-Z0-9]+$") || address.length() < 6 || address.length() > 300) {
                    request.setAttribute("address_err", "10 to 300 characters required, no more than 1 space, no special characters");
                    
                }
                else {
                request.setAttribute("address", address);
                address_err = "";
                }
            
            

            if (phone.equals("")) {

                request.setAttribute("phone_err", "Please input your phone number!");

            } else if (phone.length() < 10 || phone.length() > 15) {
                request.setAttribute("phone_err", "10 to 15 numbers required");

            } else if (!phone.matches("^(?=\\d{10,11}$)(098|097|096|0169|0168|0167|0166|0165|0164|0163|0162|091|094|0123|0124|0125|0127|0129|090|093|0120|0121|0122|0126|0128|092|0188|0993|0994|0995|0996|099|095)\\d+")) {
                request.setAttribute("phone_err", "Appropriate phone carriers are Viettel, Vinaphone, Mobifone, Vietnamobile, Beeline,S fone");

            } else {
                request.setAttribute("phone", phone);
                phone_err = "";
            }

            String url = "";

            if (!username_err.equals("") || !password_err.equals("") || !email_err.equals("") || !fullname_err.equals("") || !age_err.equals("") || !address_err.equals("") || !phone_err.equals("")) {
                url = "/login.jsp";
                RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                url = "/index.jsp";
                String encryptedPassword = AES.encrypt(password, secretKey);
                User u = new User(username, encryptedPassword, fullname, status, Integer.parseInt(age), gender, address, email, phone);
                new UserDAOImpl().insertAccount(u);

                HttpSession s = request.getSession();
                s.setAttribute("username", username);
                s.setAttribute("email", email);
                response.sendRedirect("/AccountController.java");
            }

            
            // </editor-fold>
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
