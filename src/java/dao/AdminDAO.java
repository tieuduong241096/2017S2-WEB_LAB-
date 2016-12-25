/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Admin;

/**
 *
 * @author tuan
 */
public interface AdminDAO {
    public boolean checkLogin(Admin admin);
    public void insertAdmin(Admin admin);
}
