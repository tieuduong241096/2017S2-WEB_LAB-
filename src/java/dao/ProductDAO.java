/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author tuan
 */
public interface ProductDAO {
    public ArrayList<Product> getProductList(String input);
    
    public ArrayList<Product> getProductListByBrand(String brand, String input);
    
    public ArrayList<Product> getProductListByCategory(String category, String input);
    
    public String countNumberOfProductByCategory(Category category);
    
    public String countNumberOfProductByBrand(Brand brand);
}
