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
import javax.xml.bind.JAXBException;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author tuan
 */
public class ProductDAOImpl implements ProductDAO {

    @Override
    public ArrayList<Product> getProductList(String input) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM product " + input;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setProductPrice(rs.getDouble("productprice"));
                p.setProductImage(rs.getString("productimage"));
                p.setProductQuantity(rs.getInt("productquantity"));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getDouble("discount"));
                p.setBrand(new Brand(rs.getInt("brandid"), ""));
                p.setCategory(new Category(rs.getInt("categoryid"), "", new Brand()));

                list.add(p);
            }
            connection.close();

        } catch (SQLException ex) {

            System.err.println("NO PRODUCT FOUND");
        }
        return list;
    }

    @Override
    public ArrayList<Product> getProductListByBrand(String brand, String input) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM product WHERE brandid='" + brand + "' " + input;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setProductPrice(rs.getDouble("productprice"));
                p.setProductImage(rs.getString("productimage"));
                p.setProductQuantity(rs.getInt("productquantity"));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getDouble("discount"));
                p.setBrand(new Brand());
                p.setCategory(new Category(rs.getInt("categoryid"), "", new Brand()));

                list.add(p);
            }
            connection.close();

        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG PRODUCT FROM BRAND");
        }
        return list;
    }

    @Override
    public ArrayList<Product> getProductListByCategory(String category, String input) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM product WHERE categoryid= " + category + " " + input;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setProductPrice(rs.getDouble("productprice"));
                p.setProductImage(rs.getString("productimage"));
                p.setProductQuantity(rs.getInt("productquantity"));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getDouble("discount"));
                p.setBrand(new Brand(rs.getInt("brandid"), ""));
                p.setCategory(new Category(rs.getInt("categoryid"), "", new Brand()));

                list.add(p);
            }
            connection.close();
        } catch (SQLException ex) {
            System.err.println("ERROR LOADING PRODUCT FROM CATEGORY");
        }
        return list;
    }

    @Override
    public String countNumberOfProductByCategory(Category category) {
        int count = 0;
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT COUNT(*) AS total FROM product WHERE product.categoryid =" + category.getCategoryID();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException ex) {
            System.err.println("ERROR COUNTING PRODUCT FROM CATEGORY");
        }
        return Integer.toString(count);
    }

    @Override
    public String countNumberOfProductByBrand(Brand brand) {
        int count = 0;
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT COUNT(*) AS total FROM product WHERE product.brandid =" + brand.getBrandID();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException ex) {
            System.err.println("ERROR COUNTING PRODUCT FROM BRAND");
        }
        return Integer.toString(count);
    }

    @Override
    public Product getProductDetailByProductID(String product) {
        Product p = new Product();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM product WHERE productid= " + product;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                p.setProductID(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setProductPrice(rs.getDouble("productprice"));
                p.setProductImage(rs.getString("productimage"));
                p.setProductQuantity(rs.getInt("productquantity"));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getDouble("discount"));
                p.setBrand(new Brand(rs.getInt("brandid"), ""));
                p.setCategory(new Category(rs.getInt("categoryid"), "", new Brand()));

            }

            connection.close();

        } catch (SQLException ex) {

            System.err.println("NO PRODUCT DETAIL FOUND");
        }
        return p;
    }

    @Override
    public Product getProductDetailByProductName(String product) {
        Product p = new Product();
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM product WHERE productname like '%" + product + "%'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                p.setProductID(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setProductPrice(rs.getDouble("productprice"));
                p.setProductImage(rs.getString("productimage"));
                p.setProductQuantity(rs.getInt("productquantity"));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getDouble("discount"));
                p.setBrand(new Brand(rs.getInt("brandid"), ""));
                p.setCategory(new Category(rs.getInt("categoryid"), "", new Brand()));

            }

            connection.close();

        } catch (SQLException ex) {

            System.err.println("NO PRODUCT DETAIL FOUND");
        }
        return p;
    }

    @Override
    public String getMin() {
        int min = 0;
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT MIN(productid) as min FROM product";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                min = rs.getInt("min");
            }
        } catch (SQLException ex) {
            System.err.println("ERROR FINDING MIN FROM CATEGORY");
        }

        return Integer.toString(min);
    }

    @Override
    public String getProductNameByProductID(String id) {
        String result = "";
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT productname FROM product WHERE productid= " + id;
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                result = rs.getString("productname");

            }

            connection.close();

        } catch (SQLException ex) {

            System.err.println("NO PRODUCT DETAIL FOUND");
        }
        return result;
    }

    public void updateProduct(Product p) {
        try {
            String sql = "UPDATE product set productname=?, productprice=?,productimage=?,productquantity=?,description=?,discount=?,brandid=?,categoryid=? where productid=?";
            Connection connection = DBConnect.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getProductName());
            ps.setDouble(2, p.getProductPrice());
            ps.setString(3, p.getProductImage());
            ps.setDouble(4, p.getProductQuantity());
            ps.setString(5, p.getDescription());
            ps.setDouble(6, p.getDiscount());
            ps.setLong(7, p.getBrand().getBrandID());
            ps.setLong(8, p.getCategory().getCategoryID());
            ps.setLong(9, p.getProductID());
            //lam tiep
            ps.executeUpdate(sql);
        } catch (SQLException ex) {

            System.err.println("updateP roduct loi");

        }
    }

    public void deleteroduct(Product p) {
        try {
            String sql = "DELETE FROM product where productid='" + p.getProductID() + "'";
            Connection connection = DBConnect.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate(sql);

        } catch (SQLException ex) {

            System.err.println("delete product loi" + ex.getLocalizedMessage());

        }
    }

    public void insertProduct(Product p) {
        try {
            String sql = "INSERT into product(product.productname,product.productprice,product.productimage,product.productquantity,product.description,product.discount,product.brandid,product.categoryid) values( productname=?, productprice=?,productimage=?,productquantity=?,description=?,discount=?,brandid=?,categoryid=?)";
            Connection connection = DBConnect.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getProductName());
            ps.setDouble(2, p.getProductPrice());
            ps.setString(3, p.getProductImage());
            ps.setDouble(4, p.getProductQuantity());
            ps.setString(5, p.getDescription());
            ps.setDouble(6, p.getDiscount());
            ps.setLong(7, p.getBrand().getBrandID());
            ps.setLong(8, p.getCategory().getCategoryID());
            ps.executeUpdate(sql);
        } catch (SQLException ex) {

            System.err.println("insert product loi" + ex.getLocalizedMessage());

        }
    }

}
