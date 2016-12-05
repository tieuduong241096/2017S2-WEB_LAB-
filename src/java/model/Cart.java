/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.TreeMap;

/**
 *
 * @author tuan
 */
public class Cart {
    private TreeMap<Product,Integer> list;
    private long cartID;

    public Cart() {
        list = new TreeMap<>();
        cartID = System.currentTimeMillis();
    }

    

    public Cart(TreeMap<Product, Integer> list, long cartID) {
        this.list = list;
        this.cartID = cartID;
    }

    public TreeMap<Product, Integer> getList() {
        return list;
    }

    public void setList(TreeMap<Product, Integer> list) {
        this.list = list;
    }

    public long getCartID() {
        return cartID;
    }

    public void setCartID(long cartID) {
        this.cartID = cartID;
    }
    
    public void insertToCart(Product p, int quantity){
        boolean bln = list.containsKey(p);
        if(bln){
            int q = list.get(p);
            quantity += q;
            list.put(p, quantity);
        }
        else{
            list.put(p, quantity);
        }
    }
    
    public void removeFromCart(Product p, int quantity){
        boolean bln = list.containsKey(p);
        if(bln){
            int sl = list.get(p);
            quantity = sl - quantity;
            if(quantity <= 0){
                list.remove(p);
            }else{
                list.remove(p);
                list.put(p, quantity);
            }
        }
    }
    
    public void removeAll(Product p){
        boolean bln = list.containsKey(p);
        if(bln){
            list.remove(p);
        }
    }
    
    
    
    
    
    
}
