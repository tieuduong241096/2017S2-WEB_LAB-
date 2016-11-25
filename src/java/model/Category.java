/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author tuan
 */
public class Category {
    private long categoryID;
    private String categoryName;
    private Brand brand;

    public Category() {
    }

    public Category(long categoryID, String categoryName, Brand brand) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.brand = brand;
    }

    public long getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(long categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    
    
    
    
    
    
    
}
