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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;

/**
 *
 * @author tuan
 */
public class BrandDAOImpl implements BrandDAO{

    @Override
    public ArrayList<Brand> getBrandList(String input){
        ArrayList<Brand> list = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM brand " + input;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Brand brand = new Brand();
                brand.setBrandID(rs.getInt("brandid"));
                brand.setBrandName(rs.getString("brandname"));
                list.add(brand);
            }
            connection.close();
        } catch (SQLException ex) {
            System.err.println("ERROR LOADING BRAND");
        }
        return list;
    }

    @Override
    public String getBrandNameByBrandID(String brand) {
        Brand brand1 = new Brand();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT brandname FROM brand where brandid = " + brand;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                brand1.setBrandName(rs.getString("brandname"));
                
                
            }
            connection.close();
        } catch (SQLException ex) {
            System.err.println("ERROR LOADING BRANDID BY CATEGORYID");
        }
        return brand1.getBrandName();
    }

    @Override
    public void insertBrand(Brand brand) {
        try {
            String sql = "INSERT INTO `brand`(`brand`.brandname) values('"+brand.getBrandName()+"')";
            Connection connection = DBConnect.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            
            
            
            ps.executeUpdate(sql);
        } catch (SQLException ex) {
            
            System.err.println("insert brand loi" + ex.getLocalizedMessage());
            
        }
      
    }

    @Override
    public void updateBrand(Brand brand) {
        try {
            String sql = "UPDATE brand set brandname='"+brand.getBrandName()+"' where brandid="+brand.getBrandID();
            Connection connection = DBConnect.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            
           
            ps.executeUpdate(sql);
        } catch (SQLException ex) {
            
            System.err.println("update brand loi");
            
        }
    }

    @Override
    public void deleteBrand(Brand brand) {
        try {
            String sql = "DELETE FROM brand where brandid='"+brand.getBrandID()+"'";
            Connection connection = DBConnect.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate(sql);
            
            
        } catch (SQLException ex) {
            
            System.err.println("delete brand loi" + ex.getLocalizedMessage());
            
        }
    }
    
    public int getBrandIDByBrandName(String brand) {
        int id=0;
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT brandid FROM brand where brandname = " + brand;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                id = rs.getInt("brandname");
                
                
            }
            connection.close();
        } catch (SQLException ex) {
            System.err.println("ERROR LOADING BRANDID BY CATEGORYID");
        }
        return id;
    }

    
    
}
