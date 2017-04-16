/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author tuan
 */
public class Feedback {
    long feedbackID;
    Date feedbackDate;
    String title;
    String content;
    Date replyDate;
    String replyContent;
    User user;

    public Feedback() {
    }

    public Feedback(long feedbackID, Date feedbackDate, String title, String content, Date replyDate, String replyContent, User user) {
        this.feedbackID = feedbackID;
        this.feedbackDate = feedbackDate;
        this.title = title;
        this.content = content;
        this.replyDate = replyDate;
        this.replyContent = replyContent;
        this.user = user;
    }

    public long getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(long feedbackID) {
        this.feedbackID = feedbackID;
    }

    public Date getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(Date feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(Date replyDate) {
        this.replyDate = replyDate;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    
    
    
}
