<%-- 
    Document   : TravelBuddy
    Created on : 30 Oct, 2023, 7:26:23 PM
    Author     : HP
--%>


<%@page import="com.travel.buddy.entities.User"%>
<%
    User user4 = (User) session.getAttribute("current_user");

    if (user4 == null) {
        response.sendRedirect("login_page.jsp");
    } else {%>

<%@page import="com.travel.buddy.entities.Message"%>
<%@page import="com.travel.buddy.entities.TravelBuddy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.buddy.dao.TravelBuddyDao"%>
<%@page import="com.travel.buddy.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travell Buddies Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

        <style>
            .fixed-card {
                height: 720px; /* Set the fixed height for the card */
                overflow: hidden; /* Hide content that overflows the fixed height */
            }
            .fixed-card .card-body {
                overflow: hidden; /* Hide overflowing content in the card body */
            }
            .fixed-card .card-text{
                height: 100px;
                display: -webkit-box;
                -webkit-line-clamp: 4; /* Limit the number of lines to 4 */
                -webkit-box-orient: vertical;

                overflow: hidden;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="profile_navbar.jsp" %>

        <br>

        <%            Message review_update = (Message) session.getAttribute("review_update");
            if (review_update != null) {%>
        <div class="alert <%= review_update.getCssClass()%>" role="alert">
            <%= review_update.getContent()%>
        </div>
        <%}
            session.removeAttribute("review_update");
        %>

        <%            Message hire_update = (Message) session.getAttribute("hire_update");
            if (hire_update != null) {%>
        <div class="alert <%= hire_update.getCssClass()%>" role="alert">
            <%= hire_update.getContent()%>
        </div>
        <%}
            session.removeAttribute("hire_update");
        %>

        <br>
        <h4 class="text-center" style="color: #002D62">All Buddies For You</h4>
        <br>
        <%            ConnectionProvider con = new ConnectionProvider();
            TravelBuddyDao bdao = new TravelBuddyDao(con.getConnection());
            ArrayList<TravelBuddy> list = bdao.getAllBuddies();%>
        <div class="container">
            <div class="row">
                <%for (TravelBuddy p : list) {%>
                <div class="col-md-6">
                    <div class="card fixed-card">
                        <img src="data:image/jpeg;base64, <%= p.getImage_data()%>" height="350px"class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getName()%><br><%= p.getCity()%>,<%= p.getCountry()%></h5>
                            <p class="card-text"><%= p.getAbout()%></p>
                            <p><span class="fa fa-star" aria-hidden="true"></span> Ratings: <%= p.getRating() %></p>
                            <p><span class="fa fa-phone" aria-hidden="true"></span> Contact No: <%= p.getContact()%></p>
                            <form class="form-inline my-2 my-lg-0" action="HireServlet">
                                <input hidden  name="buddy_id" value="<%= p.getId()%>">
                                <button style="background-color: #002D62" class="btn btn-outline-light text-white" type="submit">Hire</button>
                            </form>

                            <form class="form-inline my-2 my-lg-0" action="Review.jsp">
                                <input hidden  name="buddy_id" value="<%= p.getId()%>">
                                <button id="review-button" style="background-color: #002D62" class="btn btn-outline-light text-white" type="submit">Review</button>
                            </form>

                        </div>
                    </div>
                </div>


                <%}%>
            </div>
        </div>

        <!--Javascript-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    </body>
</html>

<% } %>