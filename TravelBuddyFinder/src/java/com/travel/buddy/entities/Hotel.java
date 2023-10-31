/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travel.buddy.entities;

/**
 *
 * @author HP
 */
public class Hotel {
    private String name;
    private String city;
    private String country;
    private String maplink;
    private String contact;
    private String info;
    private String hotel_link;
    private String image_name;
    private String image_data;

    public Hotel(String name, String city, String country, String maplink, String contact, String info, String hotel_link, String image_name, String image_data) {
        this.name = name;
        this.city = city;
        this.country = country;
        this.maplink = maplink;
        this.contact = contact;
        this.info = info;
        this.hotel_link = hotel_link;
        this.image_name = image_name;
        this.image_data = image_data;
    }

    public Hotel() {
    }
    
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getMaplink() {
        return maplink;
    }

    public void setMaplink(String maplink) {
        this.maplink = maplink;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getHotel_link() {
        return hotel_link;
    }

    public void setHotel_link(String hotel_link) {
        this.hotel_link = hotel_link;
    }

    public String getImage_name() {
        return image_name;
    }

    public void setImage_name(String image_name) {
        this.image_name = image_name;
    }

    public String getImage_data() {
        return image_data;
    }

    public void setImage_data(String image_data) {
        this.image_data = image_data;
    }
    
    
    
}
