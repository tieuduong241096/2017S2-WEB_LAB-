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
import model.Admin;

/**
 *
 * @author tuan
 */
public class AdminDAOImpl implements AdminDAO{

    @Override
    public boolean checkLogin(Admin admin) {
        Connection cons = DBConnect.getConnection();
        String sql = "select name from admin where name='"+admin.getName()+"' AND password='"+admin.getPassword()+"'";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return true;
            }
            cons.close();
        } catch (Exception e) {
            System.err.println("ERROR CHECKING ADMIN Login");
        }
        return false;
    }

    @Override
    public void insertAdmin(Admin admin) {
        Connection cons = DBConnect.getConnection();
        String sql = "INSERT into `admin` (`admin`.name, `admin`.password) values(?,?)";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ps.setString(1, admin.getName());
            ps.setString(2, admin.getPassword());
           
            ps.executeUpdate();
            cons.close();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    
}
