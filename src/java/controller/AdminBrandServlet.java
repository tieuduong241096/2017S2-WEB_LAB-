/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BrandDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;

/**
 *
 * @author LMD0207
 */
@WebServlet("/AdminBrandServlet")
public class AdminBrandServlet extends HttpServlet {

    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id")==null?"0":request.getParameter("id");
        String name = request.getParameter("name");
        Brand b = new Brand(Integer.parseInt(id),name); 
        BrandDAOImpl bd = new BrandDAOImpl();
        
        
        if (action.equals("edit")) {
            
           
           
           bd.updateBrand(b);
            
        }
        else if(action.equals("delete")){
            bd.deleteBrand(b);
        }
        else{//add new
            bd.insertBrand(b);
        }
        response.sendRedirect("admin/manageBrand.jsp");
    }
}
