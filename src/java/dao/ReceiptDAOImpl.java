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
import model.Receipt;
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
                        rs.getTimestamp("shipdate"), 
                        rs.getString("shipaddress"), 
                        user, 
                        rs.getString("status"));
                
                
                list.add(r);
            }
            connection.close();
            
        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG RECEIPT FROM USER");
        }
        return list;
    }
    
}
