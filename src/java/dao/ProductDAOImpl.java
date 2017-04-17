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

    private Connection connection = DBConnect.getConnection();

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    @Override
    public ArrayList<Product> getProductList(String input) {
        ArrayList<Product> list = new ArrayList<>();
        PreparedStatement ps = null;
        try {

            String sql = "SELECT * FROM product " + input;
            ps = connection.prepareStatement(sql);
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

        } catch (SQLException ex) {

            System.err.println("ERROR LOADING PRODUCT");
        } finally {

            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return list;
    }

    @Override
    public ArrayList<Product> getPageList(int maxResults, int firstResult, String option, ArrayList<Product> arr) {

        
        ArrayList<Product> pList = pList = new ArrayList<>();
        switch (option) {
            case "cat":

                if (arr.size() >= maxResults) {
                    for (int i = firstResult; i < maxResults; i++) {
                        pList.add(arr.get(i));
                    }
                    
                }
                break;
            case "bra":

                if (arr.size() >= maxResults) {
                    for (int i = firstResult; i < maxResults; i++) {
                        pList.add(arr.get(i));
                    }
                    
                }

                break;
            default:

                if (arr.size() >= maxResults) {
                    for (int i = firstResult; i < maxResults; i++) {
                        pList.add(arr.get(i));
                    }
                    
                }
                break;
        }

        return pList;
    }

    @Override
    public ArrayList<Product> getProductListByBrand(String brand, String input) {
        ArrayList<Product> list = new ArrayList<>();
        PreparedStatement ps = null;
        try {

            String sql = "SELECT * FROM product WHERE brandid='" + brand + "' " + input;
            ps = connection.prepareStatement(sql);
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

        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG PRODUCT FROM BRAND");
        } finally {

            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return list;
    }

    @Override
    public ArrayList<Product> getProductListByCategory(String category, String input) {
        ArrayList<Product> list = new ArrayList<>();
        PreparedStatement ps = null;
        try {

            String sql = "SELECT * FROM product WHERE categoryid= " + category + " " + input;
            ps = connection.prepareStatement(sql);
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

        } catch (SQLException ex) {
            System.err.println("ERROR LOADING PRODUCT FROM CATEGORY");
        } finally {

            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return list;
    }

    @Override
    public int countNumberOfProduct() {
        int count = 0;
        Statement stmt = null;
        try {

            String sql = "SELECT COUNT(*) AS total FROM product";
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("total");
            }

        } catch (SQLException ex) {
            System.err.println("ERROR COUNTING PRODUCT");
        } finally {

            try {
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return count;
    }

    @Override
    public String countNumberOfProductByCategory(Category category) {
        int count = 0;
        Statement stmt = null;
        try {

            String sql = "SELECT COUNT(*) AS total FROM product WHERE product.categoryid =" + category.getCategoryID();
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("total");
            }

        } catch (SQLException ex) {
            System.err.println("ERROR COUNTING PRODUCT FROM CATEGORY");
        } finally {

            try {
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return Integer.toString(count);
    }

    @Override
    public String countNumberOfProductByBrand(Brand brand) {
        int count = 0;
        Statement stmt = null;
        try {

            String sql = "SELECT COUNT(*) AS total FROM product WHERE product.brandid =" + brand.getBrandID();
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("total");
            }

        } catch (SQLException ex) {
            System.err.println("ERROR COUNTING PRODUCT FROM BRAND");
        } finally {

            try {
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return Integer.toString(count);
    }

    @Override
    public Product getProductDetailByProductID(String product) {
        Product p = new Product();
        PreparedStatement ps = null;
        try {

            String sql = "SELECT * FROM product WHERE productid = '" + product + "'";

            ps = connection.prepareStatement(sql);
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
        } catch (SQLException ex) {

            System.err.println("NO PRODUCT DETAIL FOUND");
        }
        return p;
    }

    @Override
    public Product getProductDetailByProductName(String product) {
        Product p = new Product();
        PreparedStatement ps = null;
        try {

            String sql = "SELECT * FROM product WHERE productname like '%" + product + "%'";
            ps = connection.prepareStatement(sql);
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
                return p;
            }

        } catch (SQLException ex) {

            System.err.println("NO PRODUCT DETAIL FOUND");
        } finally {

            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return null;
    }

    @Override
    public String getMin() {
        Statement stmt = null;
        int min = 0;
        try {

            String sql = "SELECT MIN(productid) as min FROM product";
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                min = rs.getInt("min");
            }

        } catch (SQLException ex) {
            System.err.println("ERROR FINDING MIN FROM CATEGORY");
        } finally {

            try {
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return Integer.toString(min);
    }

    @Override
    public String getProductNameByProductID(String id) {
        String result = "";
        PreparedStatement ps = null;
        try {

            String sql = "SELECT productname FROM product WHERE productid= " + id;
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                result = rs.getString("productname");

            }

        } catch (SQLException ex) {

            System.err.println("NO PRODUCT DETAIL FOUND");
        } finally {

            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return result;
    }

    public void updateProduct(Product p) {
        PreparedStatement ps = null;
        try {
            String sql = "UPDATE product set productname=?, productprice=?,productimage=?,productquantity=?,description=?,discount=?,brandid=?,categoryid=? where productid=?";

            ps = connection.prepareStatement(sql);
            ps.setString(1, p.getProductName());
            ps.setDouble(2, p.getProductPrice());
            ps.setString(3, p.getProductImage());
            ps.setDouble(4, p.getProductQuantity());
            ps.setString(5, p.getDescription());
            ps.setDouble(6, p.getDiscount());
            ps.setLong(7, p.getBrand().getBrandID());
            ps.setLong(8, p.getCategory().getCategoryID());
            ps.setLong(9, p.getProductID());

            ps.executeUpdate(sql);
        } catch (SQLException ex) {

            System.err.println("updateP roduct loi");

        } finally {

            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    public void deleteroduct(Product p) {
        PreparedStatement ps = null;
        try {
            String sql = "DELETE FROM product where productid='" + p.getProductID() + "'";

            ps = connection.prepareStatement(sql);
            ps.executeUpdate(sql);

        } catch (SQLException ex) {

            System.err.println("delete product loi" + ex.getLocalizedMessage());

        } finally {

            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    public void insertProduct(Product p) {
        PreparedStatement ps = null;
        try {
            String sql = "INSERT into product(product.productname,product.productprice,product.productimage,product.productquantity,product.description,product.discount,product.brandid,product.categoryid) values( productname=?, productprice=?,productimage=?,productquantity=?,description=?,discount=?,brandid=?,categoryid=?)";

            ps = connection.prepareStatement(sql);
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

        } finally {

            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    @Override
    public ArrayList<Product> search(String product) {
        ArrayList<Product> arr = new ArrayList<>();
        PreparedStatement ps = null;
        try {

            String sql = "SELECT * FROM product WHERE productname like '%" + product + "%'";
            ps = connection.prepareStatement(sql);
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
                arr.add(p);
            }

        } catch (SQLException ex) {

            System.err.println("NO PRODUCT DETAIL FOUND");
        } finally {

            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return arr;
    }

}
