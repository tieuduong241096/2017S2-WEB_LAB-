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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author tuan
 */
public class UserDAOImpl implements UserDAO {

    Connection cons= DBConnect.getConnection();

    
    
    

    @Override
    public boolean checkAccountExist(String email) {
        PreparedStatement ps = null;
        String sql = "select username from user where email='" + email + "'";
        try {
            ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("ERROR CHECKING EMAIL");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    @Override
    public void insertAccount(User user) {
        PreparedStatement ps = null;
        String sql = "INSERT into `user`(`user`.username,`user`.`password`,`user`.fullname,`user`.`status`, `user`.age,`user`.gender,`user`.address,`user`.email,`user`.phone) values(?,?,?,?,?,?,?,?,?)";
        try {
            ps = cons.prepareCall(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
            ps.setBoolean(4, user.isStatus()); //status
            ps.setInt(5, user.getAge());
            ps.setBoolean(6, user.isGender());
            ps.setString(7, user.getAddress());
            ps.setString(8, user.getEmail());
            ps.setString(9, user.getPhone());
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public boolean checkLogin(String email, String password) {
        PreparedStatement ps = null;
        String sql = "select username from user where email='" + email + "' AND password='" + password + "'";
        try {
            ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("ERROR CHECKING LOGIN");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    @Override
    public String getUserNameFromEmail(String email) {
        PreparedStatement ps = null;
        String sql = "select username from user where email='" + email + "'";
        String username = "";
        try {
            ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                username = rs.getString("username");
            }

        } catch (Exception e) {
            System.err.println("ERROR CHECKING LOGIN");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return username;
    }

    @Override
    public boolean checkAccountExistBaseOnEmailAndPassword(String email, String password) {
        PreparedStatement ps = null;
        String sql = "select username from user where email='" + email + "' and password='" + password + "'";
        try {
            ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("ERROR CHECKING EXIST");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    @Override
    public String getUserNameFromUserID(String id) {
        PreparedStatement ps = null;
        String sql = "select username from user where userid='" + id + "'";
        String username = "";
        try {
            ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                username = rs.getString("username");
            }

        } catch (Exception e) {
            System.err.println("ERROR GET USERNAME");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return username;
    }

    @Override
    public int getUserIDFromEmail(String email) {
        PreparedStatement ps = null;
        int userid = 0;
        if (!email.equals("")) {

            String sql = "select userid from user where email='" + email + "'";

            try {
                ps = cons.prepareCall(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    userid = rs.getInt("userid");
                }

            } catch (Exception e) {
                System.err.println("ERROR GET USERID");
            } finally {
                try {
                    cons.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return userid;
    }

    @Override
    public User getUserDetailByEmail(String email) {
        PreparedStatement ps = null;
        User user = new User();
        try {

            String sql = "SELECT * FROM user WHERE email='" + email + "'";
            ps = cons.prepareStatement(sql);
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

        } catch (SQLException ex) {

            System.err.println("NO USER DETAIL FOUND");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }

    @Override
    public void updateAccount(User user) {
        PreparedStatement ps = null;
        String sql = "UPDATE `user` set `user`.username=?,`user`.`password`=?,`user`.fullname=?,`user`.`status`=?, `user`.age=?,`user`.gender=?,`user`.address=?,`user`.phone=? where `user`.email=?";
        try {
            ps = cons.prepareCall(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
            ps.setBoolean(4, user.isStatus()); //status
            ps.setInt(5, user.getAge());
            ps.setBoolean(6, user.isGender());
            ps.setString(7, user.getAddress());

            ps.setString(8, user.getPhone());
            ps.setString(9, user.getEmail());
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public String getUserEmailByUserID(String id) {
        PreparedStatement ps = null;
        String sql = "select email from user where userid='" + id + "'";
        String email = "";
        try {
            ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                email = rs.getString("email");
            }

        } catch (Exception e) {
            System.err.println("ERROR GET EMAIL");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return email;
    }

}
