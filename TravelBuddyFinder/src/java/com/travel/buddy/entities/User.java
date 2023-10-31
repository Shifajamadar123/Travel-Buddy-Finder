/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travel.buddy.entities;

import java.awt.image.BufferedImage;
import java.sql.Timestamp;

/**
 *
 * @author HP
 */
public class User {
    private String name;
    private String email;
    private String password;
    private String gender;
    private String language1;
    private String language2;
    private String language3;
    private String interested_place;
    private BufferedImage image;
    private Timestamp dateTime;
    private int id;

    public User(String name, String email, String password, String gender, String language1, String language2, String language3, String interested_place, BufferedImage image, Timestamp dateTime) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.language1 = language1;
        this.language2 = language2;
        this.language3 = language3;
        this.interested_place = interested_place;
        this.image = image;
        this.dateTime = dateTime;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }
    
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getLanguage1() {
        return language1;
    }

    public void setLanguage1(String language1) {
        this.language1 = language1;
    }

    public String getLanguage2() {
        return language2;
    }

    public void setLanguage2(String language2) {
        this.language2 = language2;
    }

    public String getLanguage3() {
        return language3;
    }

    public void setLanguage3(String language3) {
        this.language3 = language3;
    }

    public String getInterested_place() {
        return interested_place;
    }

    public void setInterested_place(String interested_place) {
        this.interested_place = interested_place;
    }

    public BufferedImage getImage() {
        return image;
    }

    public void setImage(BufferedImage image) {
        this.image = image;
    }
    
    
}
