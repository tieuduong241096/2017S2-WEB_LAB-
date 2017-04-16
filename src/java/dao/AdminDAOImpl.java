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
import model.Admin;

/**
 *
 * @author tuan
 */
public class AdminDAOImpl implements AdminDAO {

    Connection cons = DBConnect.getConnection();

    @Override
    public boolean checkLogin(Admin admin) {

        String sql = "select name from admin where name='" + admin.getName() + "' AND password='" + admin.getPassword() + "'";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("ERROR CHECKING ADMIN Login");
        } finally {
            try {
                cons.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    @Override
    public void insertAdmin(Admin admin) {

        String sql = "INSERT into `admin` (`admin`.name, `admin`.password) values(?,?)";
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ps.setString(1, admin.getName());
            ps.setString(2, admin.getPassword());

            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                cons.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
