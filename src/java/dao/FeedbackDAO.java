/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Feedback;

/**
 *
 * @author tuan
 */
public interface FeedbackDAO {
    //get danh sach cac feedback
    public ArrayList<Feedback> getFeedBackList(String input);
    public boolean insertFeedback(Feedback feedback);
    public boolean updateFeedback(Feedback feedback);
}
