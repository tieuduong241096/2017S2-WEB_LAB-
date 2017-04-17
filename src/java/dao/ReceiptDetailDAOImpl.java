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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;
import model.Category;
import model.Product;
import model.Receipt;
import model.ReceiptDetail;

/**
 *
 * @author tuan
 */
public class ReceiptDetailDAOImpl implements ReceiptDetailDAO {

    Connection connection= DBConnect.getConnection();

    
    
    

    @Override
    public ArrayList<ReceiptDetail> getReceiptDetailListByReceipt(Receipt receipt) {
        ArrayList<ReceiptDetail> list = new ArrayList<>();
        PreparedStatement ps = null;
        try {

            String sql = "SELECT * FROM receiptdetail WHERE receiptid='" + receipt.getReceiptID() + "'";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ReceiptDetail r = new ReceiptDetail(
                        rs.getInt("receiptdetailid"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        receipt,
                        new Product(rs.getInt("productid"), "", new Double(0), "", 0, "", new Double(0), new Brand(), new Category()),
                        rs.getInt("size"));

                list.add(r);
            }

        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG RECEIPTDETAIL FROM RECEIPT");
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
    public ArrayList<ReceiptDetail> getReceiptDetailListByProduct(Product product) {
        ArrayList<ReceiptDetail> list = new ArrayList<>();
        PreparedStatement ps = null;
        try {

            String sql = "SELECT * FROM receiptdetail WHERE productid='" + product.getProductID() + "'";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ReceiptDetail r = new ReceiptDetail(
                        rs.getInt("receiptdetailid"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        new Receipt(),
                        new Product(rs.getInt("productid"), "", new Double(0), "", 0, "", new Double(0), new Brand(), new Category()),
                        rs.getInt("size"));

                list.add(r);
            }

        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG RECEIPTDETAIL FROM PRODUCT");
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
    public boolean insertReceiptDetail(ReceiptDetail rcdt) {
        PreparedStatement ps = null;
        String sql = "INSERT INTO receiptdetail(receiptdetail.quantity,receiptdetail.price,receiptdetail.receiptid,receiptdetail.productid,receiptdetail.size) values(?,?,?,?,?)";
        try {
            ps = connection.prepareCall(sql);
            ps.setInt(1, rcdt.getQuantity());
            ps.setDouble(2, rcdt.getPrice());
            ps.setInt(3, (int) rcdt.getReceipt().getReceiptID());
            ps.setInt(4, (int) rcdt.getProduct().getProductID()); //status
            ps.setDouble(5, rcdt.getSize());

            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            System.err.println(e.getLocalizedMessage());
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return false;
    }
}
