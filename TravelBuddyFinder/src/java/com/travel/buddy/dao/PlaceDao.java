/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travel.buddy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import com.travel.buddy.entities.Place;
import java.sql.ResultSet;
import java.util.Base64;

/**
 *
 * @author HP
 */
public class PlaceDao {

    Connection con = null;

    public PlaceDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Place> getInterestedPlaces(String interested_place) {
        ArrayList<Place> p = new ArrayList<Place>();

        PreparedStatement ps = null;

        try {
            String s = "select * from places where tag = ?";
            ps = con.prepareStatement(s);
            ps.setString(1, interested_place);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                Place place = new Place();
                place.setName(set.getString("name"));
                place.setTag(set.getString("tag"));
                place.setCountry(set.getString("country"));
                place.setImage_name(set.getString("image_name"));
                byte[] b = set.getBytes("image_data");
                place.setImage_data(new String(Base64.getEncoder().encode(b)));
                place.setInfo(set.getString("info"));
                place.setLink(set.getString("link"));
                p.add(place);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

    public ArrayList<Place> getOtherPlaces(String interested_place) {
        ArrayList<Place> p = new ArrayList<Place>();

        PreparedStatement ps = null;

        try {
            String s = "select * from places where tag != ?";
            ps = con.prepareStatement(s);
            ps.setString(1, interested_place);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                Place place = new Place();
                place.setName(set.getString("name"));
                place.setTag(set.getString("tag"));
                place.setCountry(set.getString("country"));
                place.setImage_name(set.getString("image_name"));
                byte[] b = set.getBytes("image_data");
                place.setImage_data(new String(Base64.getEncoder().encode(b)));
                place.setInfo(set.getString("info"));
                place.setLink(set.getString("link"));
                p.add(place);
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

    public ArrayList<Place> getAllPlaces() {
        ArrayList<Place> p = new ArrayList<Place>();

        PreparedStatement ps = null;

        try {
            String s = "select * from places";
            ps = con.prepareStatement(s);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                Place place = new Place();
                place.setName(set.getString("name"));
                place.setTag(set.getString("tag"));
                place.setCountry(set.getString("country"));
                place.setImage_name(set.getString("image_name"));
                byte[] b = set.getBytes("image_data");
                place.setImage_data(new String(Base64.getEncoder().encode(b)));
                place.setInfo(set.getString("info"));
                place.setLink(set.getString("link"));
                p.add(place);
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

    public ArrayList<Place> getSpecificPlaces(String search_place) {
        ArrayList<Place> p = new ArrayList<Place>();

        PreparedStatement ps = null;

        try {
            String s = "select * from places where country =? or tag =? ";
            ps = con.prepareStatement(s);
            ps.setString(1, search_place);
            ps.setString(2, search_place);
            
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                Place place = new Place();
                place.setName(set.getString("name"));
                place.setTag(set.getString("tag"));
                place.setCountry(set.getString("country"));
                place.setImage_name(set.getString("image_name"));
                byte[] b = set.getBytes("image_data");
                place.setImage_data(new String(Base64.getEncoder().encode(b)));
                place.setInfo(set.getString("info"));
                place.setLink(set.getString("link"));
                p.add(place);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }
}
