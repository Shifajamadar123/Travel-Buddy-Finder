/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travel.buddy.dao;

import com.travel.buddy.entities.Hotel;
import com.travel.buddy.entities.Place;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;

/**
 *
 * @author HP
 */
public class HotelDao {

    Connection con = null;

    public HotelDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Hotel> getAllHotels() {
        ArrayList<Hotel> p = new ArrayList<Hotel>();

        PreparedStatement ps = null;

        try {
            String s = "select * from hotels";
            ps = con.prepareStatement(s);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                Hotel hotel = new Hotel();
                hotel.setName(set.getString("name"));
                hotel.setCity(set.getString("city"));
                hotel.setCountry(set.getString("country"));
                hotel.setImage_name(set.getString("image_name"));
                byte[] b = set.getBytes("image");
                hotel.setImage_data(new String(Base64.getEncoder().encode(b)));
                hotel.setInfo(set.getString("info"));
                hotel.setMaplink(set.getString("map_link"));
                hotel.setHotel_link(set.getString("hotel_link"));
                hotel.setContact(set.getString("contact"));

                p.add(hotel);
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

    public ArrayList<Hotel> getSpecificHotels(String place) {
        ArrayList<Hotel> p = new ArrayList<Hotel>();

        PreparedStatement ps = null;

        try {
            String s = "select * from hotels where city=? or country =?";
            ps = con.prepareStatement(s);
            ps.setString(1, place);
            ps.setString(2, place);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                Hotel hotel = new Hotel();
                hotel.setName(set.getString("name"));
                hotel.setCity(set.getString("city"));
                hotel.setCountry(set.getString("country"));
                hotel.setImage_name(set.getString("image_name"));
                byte[] b = set.getBytes("image");
                hotel.setImage_data(new String(Base64.getEncoder().encode(b)));
                hotel.setInfo(set.getString("info"));
                hotel.setMaplink(set.getString("map_link"));
                hotel.setHotel_link(set.getString("hotel_link"));
                hotel.setContact(set.getString("contact"));

                p.add(hotel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 

        return p;
    }
}
