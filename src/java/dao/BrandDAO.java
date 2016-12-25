/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Brand;

/**
 *
 * @author tuan
 */
public interface BrandDAO {
    //get danh sach cac brand
    public ArrayList<Brand> getBrandList(String input);
    
    public String getBrandNameByBrandID(String brand);
    
    public void insertBrand(Brand brand);
    
    public void updateBrand(Brand brand);
    
    public void deleteBrand(Brand brand);
    
}
