/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travel.buddy.servlets;

import com.travel.buddy.dao.UserDao;
import com.travel.buddy.entities.User;
import com.travel.buddy.helper.ConnectionProvider;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.imageio.ImageIO;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.tomcat.jni.SSLContext;

/**
 *
 * @author HP
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ConnectionProvider p = new ConnectionProvider();

            Connection con = p.getConnection();
            Part filePart = request.getPart("image"); // "image" is the name attribute of the input field
           
            HttpSession session = request.getSession();
            String fileName =(String) session.getAttribute("filename");
            BufferedImage image = ImageIO.read(new File("C:/Users/HP/Documents/Netbeans/TravelBuddyFinder/web/user_pics/"+fileName));
            session.removeAttribute("filename");
            User u = new User();
            u.setName(request.getParameter("user_name"));
            u.setEmail(request.getParameter("user_email"));
            u.setPassword(request.getParameter("user_password"));
            u.setGender(request.getParameter("gender"));
            u.setLanguage1(request.getParameter("language1"));
            u.setLanguage2(request.getParameter("language2"));
            u.setLanguage3(request.getParameter("language3"));
            u.setInterested_place(request.getParameter("interested_place"));
            u.setImage(image);
            
            UserDao dao=new UserDao(con);
            boolean ans = dao.saveUser(u);
            
            if(ans==true)
            {
                response.sendRedirect("login_page.jsp");
            }
            else
            {
                response.sendRedirect("Upload_image.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
