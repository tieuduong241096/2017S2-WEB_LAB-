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
import model.Receipt;
import model.ReceiptReceiptDetailProduct;
import model.User;

/**
 *
 * @author tuan
 */
public class ReceiptDAOImpl implements ReceiptDAO{

    @Override
    public ArrayList<Receipt> getReceiptListByUser(User user) {
        ArrayList<Receipt> list = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM receipt WHERE userid='"+user.getUserID()+"'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Receipt r = new Receipt(
                        rs.getInt("receiptid"), 
                        rs.getTimestamp("bookdate"), 
                        rs.getString("paymode"), 
                        
                        rs.getString("shipaddress"), 
                        user, 
                        rs.getInt("status"));
                
                
                list.add(r);
            }
            connection.close();
            
        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG RECEIPT FROM USER");
        }
        return list;
    }

    @Override
    public boolean insertReceipt(Receipt rc) {
        Connection cons = DBConnect.getConnection();
        String sql = "INSERT INTO RECEIPT(receipt.bookdate,receipt.paymode,receipt.shipaddress,receipt.userid,receipt.status) values(?,?,?,?,?)";
        try {
            int userid = new UserDAOImpl().getUserIDFromEmail(rc.getUser().getEmail());
            PreparedStatement ps = cons.prepareCall(sql);
            ps.setTimestamp(1, rc.getBookDate());
            ps.setString(2, rc.getPayMode());
            ps.setString(3, rc.getShipAddress());
            if(userid==0)
                ps.setNull(4, java.sql.Types.INTEGER);
            else
                ps.setInt(4, userid);
            ps.setInt(5,rc.getStatus());
            
            ps.executeUpdate();
            cons.close();
            return true;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        
        return false;
    }

    @Override
    public int getLatestReceiptID() {
        int max=0;
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT MAX(receiptid) as max FROM receipt";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                max = rs.getInt("max");
            }
        } catch (SQLException ex) {
            System.err.println("ERROR FINDING MIN FROM CATEGORY");
        }
        
        return max;
    }

    @Override
    public ArrayList<Receipt> getReceiptList(String input) {
        ArrayList<Receipt> list = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM receipt "+input;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Receipt r = new Receipt(
                        rs.getInt("receiptid"), 
                        rs.getTimestamp("bookdate"), 
                        rs.getString("paymode"), 
                        
                        rs.getString("shipaddress"),
                        
                        new User(rs.getInt("userid"),"","","",true,0,true,"","",""), 
                        rs.getInt("status"));
                
                
                list.add(r);
            }
            connection.close();
            
        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG RECEIPT");
        }
        return list;
    }

    @Override
    public void updateReceipt(String id) {
        Connection cons = DBConnect.getConnection();
        String sql = "UPDATE receipt set status = 1 where receiptid="+id;
        try {
            
            PreparedStatement ps = cons.prepareCall(sql);
           
            
            ps.executeUpdate();
            cons.close();
            
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        
        
    }

    @Override
    public ArrayList<ReceiptReceiptDetailProduct> getReceiptListByUserID(String id) {
        ArrayList<ReceiptReceiptDetailProduct> list = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT bookdate,paymode,shipaddress,quantity,price,size,productname FROM receipt r, receiptdetail rd, product p WHERE r.receiptid = rd.receiptid AND rd.productid = p.productid AND r.userid = "+id;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
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
            connection.close();
            
        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG RECEIPT FROM USERid");
        }
        return list;
    }
    
    public String getUserIDByReceiptID(String id) {
        Connection cons = DBConnect.getConnection();
        String sql = "select userid from receipt where receiptid='"+id+"'";
        int ids = 0;
        try {
            PreparedStatement ps = cons.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ids = rs.getInt("userid");
            }
            cons.close();
        } catch (Exception e) {
            System.err.println("ERROR GET ID");
        }
        
        return new Integer(ids).toString();
    }
    
}
