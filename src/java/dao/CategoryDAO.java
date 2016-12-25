/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Brand;
import model.Category;

/**
 *
 * @author tuan
 */
public interface CategoryDAO {
    public ArrayList<Category> getCategoryList(String input);
    public ArrayList<Category> getCategoryListByBrand(String brand, String input);
    public String getBrandIDByCategoryID(String input);
    public Boolean checkMin(Category category);
    public String trimAllWhiteSpace(String string);
    public String getCategoryNameByCategoryID(String category);
    public int getCategoryIDByCategoryName(String brand);
}
