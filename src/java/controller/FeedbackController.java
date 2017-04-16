/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.FeedbackDAOImpl;
import dao.UserDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Feedback;
import model.User;

/**
 *
 * @author tuan
 */
@WebServlet(name = "FeedbackController", urlPatterns = {"/FeedbackController"})
public class FeedbackController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String title = request.getParameter("title").trim();
        String content = request.getParameter("content").trim();
        String content_err = "err", title_err = "err";

        if (title.equals("")) {

            request.setAttribute("title_err", "Please input title!");

        } else if (!title.matches("^([a-zA-Z0-9]+\\s)*[a-zA-Z0-9]+$") || title.length() < 6 || title.length() > 50) {
            request.setAttribute("title_err", "6 to 50 characters required, no more than 1 space, no special characters");

        } else {
            request.setAttribute("title", title);
            title_err = "";

        }

        if (content.equals("")) {

            request.setAttribute("content_err", "Please input content!");

        } else if (!content.matches("^([a-zA-Z0-9]+\\s)*[a-zA-Z0-9]+$") || content.length() < 6 || content.length() > 255) {
            request.setAttribute("content_err", "6 to 255 characters required, no more than 1 space, no special characters");

        } else {
            request.setAttribute("content", content);
            content_err = "";

        }

        if (!content_err.equals("") || !title_err.equals("")) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/feedback.jsp");
            rd.forward(request, response);

        } else {
            int id = new UserDAOImpl().getUserIDFromEmail(email);

            User user = new User(id, "", "", "", true, 0, true, "", "", "");
            //insert feedback
            new FeedbackDAOImpl().insertFeedback(new Feedback(0, new Date(), title, content, new Date(), "", user));
            response.sendRedirect("feedback.jsp");
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
