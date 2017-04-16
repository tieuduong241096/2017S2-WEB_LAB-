/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.FeedbackDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Feedback;
import model.User;

/**
 *
 * @author tuan
 */
@WebServlet("/AdminFeedbackServlet")
public class AdminFeedbackServlet extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rep = request.getParameter("dataString");
        String fid = request.getParameter("id");
        new FeedbackDAOImpl().updateFeedback(new Feedback(Integer.parseInt(fid), new Date(), "", "", new Date(), rep, new User()));
    }

    

}
