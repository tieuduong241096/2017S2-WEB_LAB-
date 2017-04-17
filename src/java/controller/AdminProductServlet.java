/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BrandDAOImpl;
import dao.CategoryDAOImpl;
import dao.ProductDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author LMD0207
 */
@WebServlet(name = "/AdminProductServlet", urlPatterns = "/AdminProductServlet")
public class AdminProductServlet extends HttpServlet {
   

   
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
       String price = request.getParameter("price");
       String image = request.getParameter("image");
       String quantity = request.getParameter("quantity");
       String description = request.getParameter("description");
       String discount = request.getParameter("discount");
       String brand = request.getParameter("brand");
       String category = request.getParameter("category");
       
       Product p = new Product(Integer.parseInt(id), name, Double.parseDouble(price), image, Integer.parseInt(quantity), description, Double.parseDouble(discount), new Brand(new BrandDAOImpl().getBrandIDByBrandName(brand), ""), new Category(new CategoryDAOImpl().getCategoryIDByCategoryName(category), "", new Brand()));
       ProductDAOImpl pd = new ProductDAOImpl();
       
       if (action.equals("edit")) {
           pd.updateProduct(p);
            
        }
        else if(action.equals("delete")){
            pd.deleteroduct(p);
        }
        else{//add new
            pd.insertProduct(p);
        }
        response.sendRedirect("admin/indexProduct.jsp");
    }
    
    
}
