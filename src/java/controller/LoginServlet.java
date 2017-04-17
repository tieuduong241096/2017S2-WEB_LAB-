

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
import javax.servlet.http.HttpSession;
import model.Admin;

/**
 *
 * @author Sean
 */
@WebServlet(name="LoginServlet", urlPatterns={"/LoginServlet"})
public class LoginServlet extends HttpServlet {
   
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String user = request.getParameter("name");
        String pwd = request.getParameter("password");
        
        String pw = AES.encrypt(pwd, "secretkeysecretkey");
        
        AdminDAOImpl ad = new AdminDAOImpl();
        if (ad.checkLogin(new Admin(user, pw))) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            response.sendRedirect("admin/index.jsp");
        }
        else{
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/adminLogin.jsp");
            
            
            PrintWriter out = response.getWriter();
            out.println("<font color='red'>User name/Password is invalid!</font>");
            rd.include(request, response);
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    

}
