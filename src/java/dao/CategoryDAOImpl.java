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
import java.sql.Statement;
import java.util.ArrayList;
import model.Brand;
import model.Category;

/**
 *
 * @author tuan
 */
public class CategoryDAOImpl implements CategoryDAO{

    @Override
    public ArrayList<Category> getCategoryListByBrand(Brand brand) {
        ArrayList<Category> list = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM category WHERE brandid='"+brand.getBrandID()+"'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryid"));
                c.setCategoryName(rs.getString("categoryname"));
                c.setBrand(new Brand(rs.getInt("brandid"),""));
                
                list.add(c);
            }
            connection.close();
            
        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG CATEGORY FROM BRAND");
        }
        return list;
    }

    @Override
    public ArrayList<Category> getCategoryList(String input) {
        ArrayList<Category> list = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM category " + input;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryid"));
                c.setCategoryName(rs.getString("categoryname"));
                c.setBrand(new Brand(rs.getInt("brandid"),""));
                
                list.add(c);
            }
            connection.close();
            
        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG CATEGORY");
        }
        return list;
    }

    @Override
    public Boolean checkMin(Category category) {
        int min=0;
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT MIN(categoryid) as min FROM category";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                min = rs.getInt("min");
            }
        } catch (SQLException ex) {
            System.err.println("ERROR FINDING MIN FROM CATEGORY");
        }
        
        return (category.getCategoryID()==min);
    }

    @Override
    public String trimAllWhiteSpace(String string) {
        String temp = string.replaceAll("&","");
        
        return temp.replaceAll("\\s+","");
    }
    
}
