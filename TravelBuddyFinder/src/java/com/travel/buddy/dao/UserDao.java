/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travel.buddy.dao;

import com.travel.buddy.entities.User;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.imageio.ImageIO;

/**
 *
 * @author HP
 */
public class UserDao {

    private Connection con = null;

    public UserDao(Connection con) {
        this.con = con;
    }

    public int getImageNumber() {
        int i = 0;
        PreparedStatement ps = null;
        try {
            String s = "SELECT id from user ORDER BY id DESC LIMIT 1";

            ps = con.prepareStatement(s);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                i = rs.getInt("id");
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

        return i;
    }

    public boolean saveUser(User u) {
        PreparedStatement ps = null;
        boolean flag = false;

        try {
            String s = "Insert into user(name,email,password,gender,language1,language2,language3,interested_place,image) values(?,?,?,?,?,?,?,?,?)";
            ps = this.con.prepareStatement(s);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getGender());
            ps.setString(5, u.getLanguage1());
            ps.setString(6, u.getLanguage2());
            ps.setString(7, u.getLanguage3());
            ps.setString(8, u.getInterested_place());
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(u.getImage(), "png", baos); // You can change "jpg" to the image format you're using
            byte[] imageBytes = baos.toByteArray();
            ps.setBytes(9, imageBytes);

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

    public User checkLogin(String email, String password) {
        User u = null;
        PreparedStatement ps = null;
        try {
            String s = "Select * from user where email=? and password=? ";
            ps = this.con.prepareStatement(s);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new User();
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setGender(rs.getString("gender"));
                u.setPassword(rs.getString("password"));
                u.setInterested_place(rs.getString("interested_place"));
                u.setLanguage1(rs.getString("language1"));
                u.setLanguage2(rs.getString("language2"));
                u.setLanguage3(rs.getString("language3"));
                u.setId(rs.getInt("id"));
                u.setDateTime(rs.getTimestamp("time"));
                byte[] b = rs.getBytes("image");
                ByteArrayInputStream inputStream = new ByteArrayInputStream(b);

                BufferedImage image = ImageIO.read(inputStream);
                u.setImage(image);
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
        return u;
    }

    public boolean updateUser(User u) {
        boolean flag = false;

        PreparedStatement ps = null;

        try {
            String s = "";
            if (u.getImage() != null) {
                s = "update user set name=? , email=? , password=? , language1=? , language2=?, language3=?, interested_place=?, image=? where id=?";
                int i = u.getId() - 1;
                String fileName = "image" + i + ".png";
                File imageFile = new File("C:/Users/HP/Documents/Netbeans/TravelBuddyFinder/web/user_pics/" + fileName);

                if (imageFile.exists()) {
                    // Check if the file exists before attempting to delete it
                    boolean deleted = imageFile.delete(); // Attempt to delete the file

                    if (deleted) {
                        System.out.println("Image file deleted successfully.");
                    } else {
                        System.out.println("Failed to delete the image file.");
                    }
                }
                BufferedImage image = u.getImage();
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                try {
                    File outputImageFile = new File("C:/Users/HP/Documents/Netbeans/TravelBuddyFinder/web/user_pics/" + fileName);
                    ImageIO.write(image, "png", outputImageFile);
                    ImageIO.write(u.getImage(), "png", baos); // You can change "jpg" to the image format you're using
                    byte[] imageBytes = baos.toByteArray();
                    ps = con.prepareStatement(s);
                    ps.setBytes(8, imageBytes);
                    ps.setInt(9, u.getId());
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else {
                s = "update user set name=? , email=? , password=? , language1=? , language2=?, language3=?, interested_place=? where id=?";
                ps = con.prepareStatement(s);
                ps.setInt(8, u.getId());
            }
            
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getLanguage1());
            ps.setString(5, u.getLanguage2());
            ps.setString(6, u.getLanguage3());
            ps.setString(7, u.getInterested_place());
            int n  = ps.executeUpdate();
            if(n>0)
            {
                flag=true;
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

        return flag;
    }
}
