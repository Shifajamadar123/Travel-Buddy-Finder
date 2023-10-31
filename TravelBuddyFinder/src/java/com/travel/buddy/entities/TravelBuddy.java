/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travel.buddy.entities;

/**
 *
 * @author HP
 */
public class TravelBuddy {
    private int id;
    private String name;
    private String about;
    private String contact;
    private String city;
    private String country;
    private float rating;
    private String image_name;
    private String image_data;

    public TravelBuddy() {
    }
    

    public TravelBuddy(int id, String name, String about, String contact, String city, String country, float rating, String image_name, String image_data) {
        this.id = id;
        this.name = name;
        this.about = about;
        this.contact = contact;
        this.city = city;
        this.country = country;
        this.rating = rating;
        this.image_name = image_name;
        this.image_data = image_data;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
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

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
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
