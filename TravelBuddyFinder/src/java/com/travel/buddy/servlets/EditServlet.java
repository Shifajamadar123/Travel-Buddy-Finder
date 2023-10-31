/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travel.buddy.servlets;

import com.travel.buddy.dao.UserDao;
import com.travel.buddy.entities.Message;
import com.travel.buddy.entities.User;
import com.travel.buddy.helper.ConnectionProvider;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author HP
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            User u = new User();
            u.setName(request.getParameter("user_name"));
            u.setEmail(request.getParameter("user_email"));
            u.setPassword(request.getParameter("user_password"));
            u.setInterested_place(request.getParameter("user_interested_place"));
            u.setLanguage1(request.getParameter("user_language1"));
            u.setLanguage2(request.getParameter("user_language2"));
            u.setLanguage3(request.getParameter("user_language3"));
            u.setId(Integer.parseInt(request.getParameter("user_id")));
            Part filePart = request.getPart("image");
            if (filePart != null) {
                try ( InputStream input = filePart.getInputStream()) {
                    BufferedImage image = ImageIO.read(input);
                    // Now, 'image' contains the uploaded image as a BufferedImage.
                    // You can manipulate or save it as needed.
                    u.setImage(image);
                }
            }

            ConnectionProvider c = new ConnectionProvider();
            UserDao dao = new UserDao(c.getConnection());
            boolean ans = dao.updateUser(u);
            HttpSession session = request.getSession();
            if (ans == true) {
                session.setAttribute("update_message", new Message("Probile Updated. Login And View Updated Profile.", "success", "alert alert-success"));
            } else {
                session.setAttribute("update_message", new Message("Probile Not Updated!", "success", "alert alert-danger"));
                
            }
            
            response.sendRedirect("login_page.jsp");
            out.println("</body>");
            out.println("</html>");
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
