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
import model.User;

/**
 *
 * @author tuan
 */
public class UserDAOImpl implements UserDAO{

    @Override
    public boolean checkAccountExist(String email) {
        Connection cons = DBConnect.getConnection();
        String sql = "select username from user where email='"+email+"'";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return true;
            }
            cons.close();
        } catch (Exception e) {
            System.err.println("ERROR CHECKING EMAIL");
        }
        return false;
    }

    @Override
    public void insertAccount(User user) {
        Connection cons = DBConnect.getConnection();
        String sql = "INSERT into `user`(`user`.username,`user`.`password`,`user`.fullname,`user`.`status`, `user`.age,`user`.gender,`user`.address,`user`.email,`user`.phone) values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
            ps.setBoolean(4,user.isStatus()); //status
            ps.setInt(5,user.getAge());
            ps.setBoolean(6,user.isGender());
            ps.setString(7, user.getAddress());
            ps.setString(8, user.getEmail());
            ps.setString(9, user.getPhone());
            ps.executeUpdate();
            cons.close();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    @Override
    public boolean checkLogin(String email, String password) {
        Connection cons = DBConnect.getConnection();
        String sql = "select username from user where email='"+email+"' AND password='"+password+"'";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return true;
            }
            cons.close();
        } catch (Exception e) {
            System.err.println("ERROR CHECKING LOGIN");
        }
        return false;
    }

    @Override
    public String getUserNameFromEmail(String email) {
        Connection cons = DBConnect.getConnection();
        String sql = "select username from user where email='"+email+"'";
        String username = "";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                username = rs.getString("username");
            }
            cons.close();
        } catch (Exception e) {
            System.err.println("ERROR CHECKING LOGIN");
        }
        
        return username;
    }

    @Override
    public boolean checkAccountExistBaseOnEmailAndPassword(String email, String password) {
        Connection cons = DBConnect.getConnection();
        String sql = "select username from user where email='"+email+"' and password='"+password+"'";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return true;
            }
            cons.close();
        } catch (Exception e) {
            System.err.println("ERROR CHECKING EXIST");
        }
        return false;
    }

    @Override
    public String getUserNameFromUserID(String id) {
        Connection cons = DBConnect.getConnection();
        String sql = "select username from user where userid='"+id+"'";
        String username = "";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                username = rs.getString("username");
            }
            cons.close();
        } catch (Exception e) {
            System.err.println("ERROR GET USERNAME");
        }
        
        return username;
    }

   
    
    
}
