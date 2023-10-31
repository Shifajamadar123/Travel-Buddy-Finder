/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travel.buddy.servlets;

import com.travel.buddy.dao.ReviewDao;
import com.travel.buddy.entities.Message;
import com.travel.buddy.entities.Review;
import com.travel.buddy.entities.User;
import com.travel.buddy.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class ReviewServlet extends HttpServlet {

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
            out.println("<title>Servlet ReviewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            int rating = Integer.parseInt(request.getParameter("user_rating"));
            int buddy_id = Integer.parseInt(request.getParameter("buddy_id"));

            HttpSession session = request.getSession();
            if (rating > 5 || rating < 0) {
                session.setAttribute("rating_update", new Message("Rating should be a number between 0-5", "error", "alert alert-danger"));
                session.setAttribute("buddy_id", buddy_id);
                response.sendRedirect("Review.jsp");
            } else {
                ConnectionProvider provider = new ConnectionProvider();
                Connection con = provider.getConnection();
                User user = (User) session.getAttribute("current_user");
                int user_id = user.getId();
                PreparedStatement ps = null;

                try {
                    String s = "select b_id from hire where u_id = ? ";
                    ps = con.prepareStatement(s);
                    ps.setInt(1, user_id);

                    ResultSet set = ps.executeQuery();
                    boolean flag = false;
                    while (set.next()) {
                        if (set.getInt("b_id") == buddy_id) {
                            flag = true;
                            break;
                        }
                    }

                    if (flag == false) {
                        session.setAttribute("can_you_review", new Message("Sorry you have not hired the buddy to review", "error", "alert alert-danger"));
                        session.setAttribute("buddy_id", buddy_id);
                        response.sendRedirect("Review.jsp");
                    } else {
                        String review = request.getParameter("user_review");
                        Review r = new Review();
                        r.setId_buddy(buddy_id);
                        r.setId_user(user_id);
                        r.setReview(review);
                        r.setRating(rating);
                        r.setName(request.getParameter("user_name"));
                        ReviewDao rdao = new ReviewDao(con);
                        boolean ans = rdao.saveReview(r);

                        if (ans == true) {
                            session.setAttribute("review_update", new Message("Thankyou For Your Review", "success", "alert alert-success"));

                        } else {
                            session.setAttribute("review_update", new Message("Review Not Updated", "error", "alert alert-danger"));

                        }
                        response.sendRedirect("TravelBuddy.jsp");

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

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
