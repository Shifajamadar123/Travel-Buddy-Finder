/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travel.buddy.dao;

import com.travel.buddy.entities.Review;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class ReviewDao {

    Connection con = null;

    public ReviewDao(Connection con) {
        this.con = con;
    }

    public boolean saveReview(Review r) {
        PreparedStatement ps = null;
        boolean flag = false;

        try {
            String s = "Insert into review(buddy_id,user_id,review,rating,name) values(?,?,?,?,?)";
            ps = this.con.prepareStatement(s);
            
            ps.setInt(1, r.getId_buddy());
            ps.setInt(2, r.getId_user());
            ps.setString(3, r.getReview());
            ps.setInt(4, r.getRating());
            ps.setString(5, r.getName());
            ps.executeUpdate();
            ps = null;
            s = "select rating from travelbuddy where id=?";
            ps = con.prepareStatement(s);
            ps.setInt(1, r.getId_buddy());
            ResultSet set = ps.executeQuery();
            int prev=0;
            while(set.next())
            {
                prev = set.getInt("rating");
            }
            float cur=0;
            if(prev==0)
            {
                cur = r.getRating();
            }
            else
            {
                cur = (float)((float)r.getRating() + prev) /2;
            }
            ps = null;
            s = "update travelbuddy set rating = ? where id=?";
            ps = con.prepareStatement(s);
            ps.setFloat(1, cur);
            ps.setInt(2, r.getId_buddy());
            
            ps.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (this.con != null) {
                    this.con.close();
                }
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return flag;
    }
    
    
    public ArrayList<Review> getRecentReviews()
    {
        PreparedStatement ps = null;
        ArrayList<Review> p =new ArrayList<Review>();
        
        try
        {
            String s = "SELECT * FROM review ORDER BY id DESC LIMIT 6";
            ps = con.prepareStatement(s);
            ResultSet set = ps.executeQuery();
            
            while(set.next())
            {
                Review r = new Review();
                r.setName(set.getString("name"));
                r.setRating(set.getInt("rating"));
                r.setReview(set.getString("review"));
                r.setTime(set.getTimestamp("time"));
                
                p.add(r);
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (this.con != null) {
                    this.con.close();
                }
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return p;
    }
}
