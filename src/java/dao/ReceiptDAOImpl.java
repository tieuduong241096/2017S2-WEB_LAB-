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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Receipt;
import model.ReceiptReceiptDetailProduct;
import model.User;

/**
 *
 * @author tuan
 */
public class ReceiptDAOImpl implements ReceiptDAO {

    Connection connection= DBConnect.getConnection();

    
    
    

    @Override
    public ArrayList<Receipt> getReceiptListByUser(User user) {
        ArrayList<Receipt> list = new ArrayList<>();
        PreparedStatement ps = null;
        try {

            String sql = "SELECT * FROM receipt WHERE userid='" + user.getUserID() + "'";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Receipt r = new Receipt(
                        rs.getInt("receiptid"),
                        rs.getTimestamp("bookdate"),
                        rs.getString("paymode"),
                        rs.getString("shipaddress"),
                        user,
                        rs.getInt("status"));

                list.add(r);
            }

        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG RECEIPT FROM USER");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    @Override
    public boolean insertReceipt(Receipt rc) {
        PreparedStatement ps = null;
        String sql = "INSERT INTO RECEIPT(receipt.bookdate,receipt.paymode,receipt.shipaddress,receipt.userid,receipt.status) values(?,?,?,?,?)";
        try {
            int userid = new UserDAOImpl().getUserIDFromEmail(rc.getUser().getEmail());
            ps = connection.prepareCall(sql);
            ps.setTimestamp(1, rc.getBookDate());
            ps.setString(2, rc.getPayMode());
            ps.setString(3, rc.getShipAddress());
            if (userid == 0) {
                ps.setNull(4, java.sql.Types.INTEGER);
            } else {
                ps.setInt(4, userid);
            }
            ps.setInt(5, rc.getStatus());

            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            System.err.println("CACACACACAC");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return false;
    }

    @Override
    public int getLatestReceiptID() {
        Statement stmt = null;
        int max = 0;
        try {

            String sql = "SELECT MAX(receiptid) as max FROM receipt";
             stmt= connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                max = rs.getInt("max");
            }
        } catch (SQLException ex) {
            System.err.println("ERROR FINDING MIN FROM CATEGORY");
        } finally {
            try {
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return max;
    }

    @Override
    public ArrayList<Receipt> getReceiptList(String input) {
        ArrayList<Receipt> list = new ArrayList<>();
        PreparedStatement ps = null;
        try {

            String sql = "SELECT * FROM receipt " + input;
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Receipt r = new Receipt(
                        rs.getInt("receiptid"),
                        rs.getTimestamp("bookdate"),
                        rs.getString("paymode"),
                        rs.getString("shipaddress"),
                        new User(rs.getInt("userid"), "", "", "", true, 0, true, "", "", ""),
                        rs.getInt("status"));

                list.add(r);
            }

        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG RECEIPT");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    @Override
    public void updateReceipt(String id) {
        PreparedStatement ps = null;
        String sql = "UPDATE receipt set status = 1 where receiptid=" + id;
        try {

            ps = connection.prepareCall(sql);

            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public ArrayList<ReceiptReceiptDetailProduct> getReceiptListByUserID(String id) {
        PreparedStatement ps = null;
        ArrayList<ReceiptReceiptDetailProduct> list = new ArrayList<>();
        try {

            String sql = "SELECT bookdate,paymode,shipaddress,quantity,price,size,productname FROM receipt r, receiptdetail rd, product p WHERE r.receiptid = rd.receiptid AND rd.productid = p.productid AND r.userid = " + id;
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ReceiptReceiptDetailProduct total = new ReceiptReceiptDetailProduct();
                total.setBookDate(rs.getTimestamp("bookdate"));
                total.setPayMode(rs.getString("paymode"));
                total.setShipAddress(rs.getString("shipaddress"));
                total.setQuantity(rs.getInt("quantity"));
                total.setPrice(rs.getDouble("price"));
                total.setSize(rs.getDouble("size"));
                total.setProductName(rs.getString("productname"));

                list.add(total);
            }
            System.err.println(list);

        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG RECEIPT FROM USERid");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public String getUserIDByReceiptID(String id) {
        PreparedStatement ps = null;
        String sql = "select userid from receipt where receiptid='" + id + "'";
        int ids = 0;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ids = rs.getInt("userid");
            }

        } catch (Exception e) {
            System.err.println("ERROR GET ID");
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return Integer.toString(ids);
    }

}
