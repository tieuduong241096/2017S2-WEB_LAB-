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
public interface UserDAO {
    public boolean checkAccountExist(String username);
    public void insertAccount(User user);
    public boolean checkLogin(String email, String password);
    public String getUserNameFromEmail(String email);
    public boolean checkAccountExistBaseOnEmailAndPassword(String email,String password);
    public String getUserNameFromUserID(String id);
    public int getUserIDFromEmail(String email);
}
