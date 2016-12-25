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

    @Override
    public int getUserIDFromEmail(String email) {
        int userid = 0;
        if(!email.equals("")){
        Connection cons = DBConnect.getConnection();
        String sql = "select userid from user where email='"+email+"'";
        
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                userid = rs.getInt("userid");
            }
            cons.close();
        } catch (Exception e) {
            System.err.println("ERROR GET USERID");
        }
        return userid;
        }
        
        return userid;
    }

    @Override
    public User getUserDetailByEmail(String email) {
        User user = new User();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM user WHERE email='" + email+"'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                user.setUserID(rs.getLong("userid"));
               user.setUserName(rs.getString("username"));
            user.setPassword(AES.decrypt(rs.getString("password"), "secretkeysecretkey"));
           user.setFullName(rs.getString("fullname"));
            user.setStatus(rs.getBoolean("status")); //status
           user.setAge(rs.getInt("age"));
            user.setGender(rs.getBoolean("gender"));
            user.setAddress(rs.getString("address"));
            user.setEmail(rs.getString("email"));
            user.setPhone(rs.getString("phone"));

            }

            connection.close();

        } catch (SQLException ex) {

            System.err.println("NO USER DETAIL FOUND");
        }
        return user;
    }

    @Override
    public void updateAccount(User user) {
        Connection cons = DBConnect.getConnection();
        String sql = "UPDATE `user` set `user`.username=?,`user`.`password`=?,`user`.fullname=?,`user`.`status`=?, `user`.age=?,`user`.gender=?,`user`.address=?,`user`.phone=? where `user`.email=?";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
            ps.setBoolean(4,user.isStatus()); //status
            ps.setInt(5,user.getAge());
            ps.setBoolean(6,user.isGender());
            ps.setString(7, user.getAddress());
           
            ps.setString(8, user.getPhone());
             ps.setString(9, user.getEmail());
            ps.executeUpdate();
            cons.close();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    @Override
    public String getUserEmailByUserID(String id) {
        Connection cons = DBConnect.getConnection();
        String sql = "select email from user where userid='"+id+"'";
        String email = "";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                email = rs.getString("email");
            }
            cons.close();
        } catch (Exception e) {
            System.err.println("ERROR GET EMAIL");
        }
        
        return email;
    }

   
    
    
}
