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
    
}
