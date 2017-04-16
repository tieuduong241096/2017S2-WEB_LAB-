/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.User;

/**
 *
 * @author tuan
 */
public class Main {
    public static void main(String[] args) {
        new UserDAOImpl().insertAccount(new User("ti","123","Truong Tuan Son",true,18,true,"hihihi","tuansont96@gmail.com","0123456"));
    }
    
}
