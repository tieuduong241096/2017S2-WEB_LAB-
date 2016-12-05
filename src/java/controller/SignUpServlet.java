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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author tuan
 */
public class SignUpServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        boolean status = true;
        String age = request.getParameter("age");
        boolean gender = request.getParameter("gender").equals("male");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        final String secretKey = "secretkeysecretkey";

        if (username.equals("")) {

            request.setAttribute("username_err", "Please input your user name");

        } else if (!username.matches("^[a-zA-Z0-9]+(([\\_\\-][a-zA-Z 0-9])?[a-zA-Z0-9]*)*$") || username.length() < 6 || username.length() > 20) {
            request.setAttribute("username_err", "the length is 6 to 20, no space, no special character");
        } else {
            request.setAttribute("username", username);
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

            }
        }

        if (email.equals("")) {

            request.setAttribute("email_err", "Please input your email!");

        } else if (new UserDAOImpl().checkAccountExist(email)) {
            request.setAttribute("email_err", "email exists");
        
        }
        else if (!email.matches("(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")){
        request.setAttribute("email_err","Wrong email format!");
		
        }
        else {
            request.setAttribute("email", email);
        }

        if (fullname.equals("")) {

            request.setAttribute("fullname_err", "Please input your fullname!");

        } else if (fullname.length() < 2 || fullname.length() > 50) {
            request.setAttribute("fullname_err", "the length is 2 to 50 character");

        } else if (!fullname.matches("\"\\s*\\[A-Za-z]+(\\s\\[A-Za-z]+)?\\s*\"")) {
            request.setAttribute("fullname_err", "no more than 2 spaces, no special characters, no number");

        }

        if (age.equals("")) {

            request.setAttribute("age_err", "Please input your age!");

        }
        else if (!age.matches("^\\d+$")|| age.length()!=2 ){
        request.setAttribute("age_err","Number only");
		
        }
        else {
            request.setAttribute("age", age);
        }

        if (address.equals("")) {

            request.setAttribute("address_err", "Please input your address!");

        }
        else if (address.length()<6 || address.length()>20){
            request.setAttribute("address_err","the length is 6 to 20");
		
    }
        else {
            request.setAttribute("address", address);
        }

        if (phone.equals("")) {

            request.setAttribute("phone_err", "Please input your phone number!");

        
        }
        else if (phone.length()<10 || phone.length()>15||!phone.matches("^\\d+$")){
            request.setAttribute("phone_err","Appropriate phone format is +84 968621423");
		
    }
        else {
            request.setAttribute("phone", phone);
        }

        String url = "";

        if (username.equals("") || password.equals("") || email.equals("") || fullname.equals("") || age.equals("") || address.equals("") || phone.equals("")) {
            url = "/login.jsp";

        } else {
            url = "/index.jsp";
            String encryptedPassword = AES.encrypt(password, secretKey);
            User u = new User(username, encryptedPassword, fullname, status, Integer.parseInt(age), gender, address, email, phone);
            new UserDAOImpl().insertAccount(u);
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
