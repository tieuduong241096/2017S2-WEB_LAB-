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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;
import model.User;

/**
 *
 * @author tuan
 */
public class FeedbackDAOImpl implements FeedbackDAO {

    Connection connection= DBConnect.getConnection();;

    
    
    

    @Override
    public ArrayList<Feedback> getFeedBackList(String input) {
        ArrayList<Feedback> list = new ArrayList<>();
        PreparedStatement ps = null;
        try {

            String sql = "SELECT * FROM feedback " + input;
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Feedback f = new Feedback();
                f.setFeedbackID(rs.getInt("feedbackid"));
                f.setUser(new User(rs.getInt("userid"), "", "", "", true, 0, true, "", "", ""));
                f.setFeedbackDate(rs.getDate("feedbackdate"));
                f.setTitle(rs.getString("title"));
                f.setContent(rs.getString("content"));
                f.setReplyDate(rs.getDate("replydate"));
                f.setReplyContent(rs.getString("replycontent"));
                list.add(f);
            }

        } catch (SQLException ex) {
            System.err.println("ERROR LOADiNG FEEDBACK " + ex);

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
    public boolean insertFeedback(Feedback feedback) {
        PreparedStatement ps = null;
        try {
            String sql = "INSERT INTO FEEDBACK(feedback.userid,feedback.feedbackdate,feedback.title,feedback.content,feedback.replydate,feedback.replycontent) values(" + (int) feedback.getUser().getUserID() + ",NOW(),'" + feedback.getTitle() + "','" + feedback.getContent() + "',DEFAULT,DEFAULT)";

            ps = connection.prepareStatement(sql);

            ps.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return true;
    }

    @Override
    public boolean updateFeedback(Feedback feedback) {
        PreparedStatement ps = null;
        try {
            String sql = "UPDATE FEEDBACK set feedback.replydate=NOW(), replycontent = '" + feedback.getReplyContent() + "' where feedbackid =" + (int) feedback.getFeedbackID();

            ps = connection.prepareStatement(sql);

            ps.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return true;
    }

//    public static void main(String[] args) {
////        new FeedbackDAOImpl().insertFeedback(new Feedback(0, new Date(), "ahihi", "cacac", new Date(), "", new User(1,"","","",true,0,true,"","","")));
//        new FeedbackDAOImpl().updateFeedback(new Feedback(2, new Date(),"ahihi","cacac",new Date(),"ok lah",new User(1,"","","",true,0,true,"","","")));
//    }
}
