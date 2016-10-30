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
public class BrandDAO {
    //get danh sach cac brand
    public ArrayList<Brand> getBrandList() throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM brand";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Brand> list = new ArrayList<>();
        while(rs.next()){
            Brand brand = new Brand();
            brand.setBrandID(rs.getInt("brand_id"));
            brand.setBrandName(rs.getString("brand_name"));
            list.add(brand);
        }
        return list;
        
    }
    
//    public static void main(String[] args) throws SQLException {
//        BrandDAO dao = new BrandDAO();
//        for (Brand brand : dao.getBrandList()) {
//            System.out.println(brand.getBrandID()+"-"+brand.getBrandName());
//        }
//    }
}
