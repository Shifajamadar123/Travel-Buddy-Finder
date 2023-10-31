/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travel.buddy.entities;

import java.sql.Timestamp;

/**
 *
 * @author HP
 */
public class Review {
    private int id_buddy;
    private int id_user;
    private String review;
    private String name;
    private int rating;
    private Timestamp time;
    private int id_review;
    
    
    public Review() {
    }

    public Review(int id_buddy, int id_user, String review, int rating, Timestamp time, int id_review) {
        this.id_buddy = id_buddy;
        this.id_user = id_user;
        this.review = review;
        this.rating = rating;
        this.time = time;
        this.id_review = id_review;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
    public int getId_buddy() {
        return id_buddy;
    }

    public void setId_buddy(int id_buddy) {
        this.id_buddy = id_buddy;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getId_review() {
        return id_review;
    }

    public void setId_review(int id_review) {
        this.id_review = id_review;
    }
    
    
}
