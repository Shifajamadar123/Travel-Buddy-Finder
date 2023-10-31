/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travel.buddy.dao;

import com.travel.buddy.entities.Hotel;
import com.travel.buddy.entities.TravelBuddy;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;

/**
 *
 * @author HP
 */
public class TravelBuddyDao {

    Connection con = null;

    public TravelBuddyDao(Connection con) {
        this.con = con;
    }

    public ArrayList<TravelBuddy> getAllBuddies() {
        ArrayList<TravelBuddy> p = new ArrayList<TravelBuddy>();

        PreparedStatement ps = null;

        try {
            String s = "select * from travelbuddy";
            ps = con.prepareStatement(s);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                TravelBuddy buddy = new TravelBuddy();
                buddy.setName(set.getString("name"));
                buddy.setCity(set.getString("city"));
                buddy.setCountry(set.getString("country"));
                buddy.setImage_name(set.getString("image_name"));
                byte[] b = set.getBytes("image_data");
                buddy.setImage_data(new String(Base64.getEncoder().encode(b)));
                buddy.setAbout(set.getString("about"));
                buddy.setContact(set.getString("contact"));
                buddy.setId(set.getInt("id"));
                buddy.setRating(set.getFloat("rating"));
                p.add(buddy);
            }
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

        return p;
    }

    public ArrayList<TravelBuddy> getSpecificBuddies(String place) {
        ArrayList<TravelBuddy> p = new ArrayList<TravelBuddy>();

        PreparedStatement ps = null;

        try {
            String s = "select * from travelbuddy where city=? or country=?";
            ps = con.prepareStatement(s);
            ps.setString(1, place);
            ps.setString(2, place);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                TravelBuddy buddy = new TravelBuddy();
                buddy.setName(set.getString("name"));
                buddy.setCity(set.getString("city"));
                buddy.setCountry(set.getString("country"));
                buddy.setImage_name(set.getString("image_name"));
                byte[] b = set.getBytes("image_data");
                buddy.setImage_data(new String(Base64.getEncoder().encode(b)));
                buddy.setAbout(set.getString("about"));
                buddy.setContact(set.getString("contact"));
                buddy.setId(set.getInt("id"));
                buddy.setRating(set.getFloat("rating"));
                p.add(buddy);
            }
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

        return p;
    }

}
