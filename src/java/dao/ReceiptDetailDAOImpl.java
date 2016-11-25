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
import model.Category;
import model.Product;
import model.Receipt;
import model.ReceiptDetail;

/**
 *
 * @author tuan
 */
public class ReceiptDetailDAOImpl implements ReceiptDetailDAO{

    @Override
    public ArrayList<ReceiptDetail> getReceiptDetailListByReceipt(Receipt receipt) {
        ArrayList<ReceiptDetail> list = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM receiptdetail WHERE receiptid='"+receipt.getReceiptID()+"'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                ReceiptDetail r = new ReceiptDetail(
                        rs.getInt("receiptdetailid"),
                        rs.getInt("quantity"), 
                        rs.getDouble("price"), 
                        receipt, 
                        new Product(rs.getInt("productid"),"",0,"",0,"",0,new Brand(),new Category()));
                
                
                
                list.add(r);
            }
            connection.close();
            
        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG RECEIPTDETAIL FROM RECEIPT");
        }
        return list;
    }

    @Override
    public ArrayList<ReceiptDetail> getReceiptDetailListByProduct(Product product) {
        ArrayList<ReceiptDetail> list = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM receiptdetail WHERE productid='"+product.getProductID()+"'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                ReceiptDetail r = new ReceiptDetail(
                        rs.getInt("receiptdetailid"),
                        rs.getInt("quantity"), 
                        rs.getDouble("price"), 
                        new Receipt(), 
                        new Product(rs.getInt("productid"),"",0,"",0,"",0,new Brand(),new Category()));
                
                
                
                list.add(r);
            }
            connection.close();
            
        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG RECEIPTDETAIL FROM PRODUCT");
        }
        return list;
    }
    }

    
    

