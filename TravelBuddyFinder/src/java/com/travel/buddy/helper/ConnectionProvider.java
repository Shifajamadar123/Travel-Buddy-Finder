/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travel.buddy.helper;

import java.sql.*;

/**
 *
 * @author HP
 */
public class ConnectionProvider {

    Connection con = null;

    public Connection getConnection() {
        try {
            if(con==null)
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelbuddyfinder","root","shifa@MYSQL11");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return con;
    }
}
