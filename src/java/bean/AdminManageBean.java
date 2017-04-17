/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import dao.BrandDAOImpl;
import dao.CategoryDAOImpl;
import dao.ProductDAOImpl;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import model.Product;

/**
 *
 * @author Sean
 */
@ManagedBean(name = "adminMB")
@SessionScoped
public class AdminManageBean {

    private ProductDAOImpl pd;
    private Product product;
    public String msg;
    public String searchString;
    private List<Product> products;

    /**
     * Creates a new instance of AdminManageBean
     */
    public AdminManageBean() {
        pd = new ProductDAOImpl();
        product = new Product();
        
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    //display records
    public List<Product> getAll() {
        return pd.getProductList("");
    }

    //link to insert page
    public String insert() {
        return "insert";
    }

    //link to update page
    public String update(Product product) {
        this.product = product;
        return "update";
    }

    //insert to db
    public String insertdb() {

        pd.insertProduct(product);
        product = new Product();

        msg = "Insert Successfully!";
        return "index";
    }

    //update to db
    public String updatedb() {

        pd.updateProduct(product);
        product = new Product();

        msg = "Update Successfully!";
        return "index";
    }

    //delete from db
    public String deletedb(Product product) {

        pd.deleteroduct(product);

        msg = "Delete Successfully!";
        return "index";
    }
    
    public String getBrandName(String id){
        return new BrandDAOImpl().getBrandNameByBrandID(id);
    }
    
    public String getCategoryName(String id){
        return new CategoryDAOImpl().getCategoryNameByCategoryID(id);
    }

}
