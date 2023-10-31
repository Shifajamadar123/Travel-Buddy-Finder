<%-- 
    Document   : index
    Created on : 21 Oct, 2023, 7:35:11 PM
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.buddy.entities.Review"%>
<%@page import="com.travel.buddy.dao.ReviewDao"%>
<%@page import="com.travel.buddy.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>


        <style>
            .col{
                color:black;
                text-align: center;
                margin: auto;
                padding: 10px;
                font-style: normal;
                font-size: 50px;
                height: 250px;
            }

            .fixed-card {
                height: 300px; /* Set the fixed height for the card */
                overflow: hidden; /* Hide content that overflows the fixed height */
                background-color: #002D62;
                color: white;
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
        <%@include file="navbar.jsp" %>
        <br>

        <div style="height: 600px; width: 100%; background-image: url(project_pics/background.jpg); background-repeat: no-repeat; background-size:100% 700px">
            <div class="col"><b style="color: #002D62">Find a Buddy You Never Know You Needed.</b></div>
        </div>

        <hr>

        <!--//cards-->
        <h4 class="text-center" style="color: #002D62">Recent Reviews</h4>
        <br>
        <%
            ConnectionProvider con = new ConnectionProvider();
            ReviewDao rdao = new ReviewDao(con.getConnection());
            ArrayList<Review> list = rdao.getRecentReviews();%>
        <div class="container">
            <div class="row">
                <%for (Review p : list) {%>
                <div class="col-md-6">
                    <div class="card fixed-card">
                        <div class="card-body">
                            <h5 class="card-title"><span class="fa fa-user" aria-hidden="true"></span> <%= p.getName()%></h5>
                            <p class="card-text"><span class="fa fa-comment" aria-hidden="true"></span> <%= p.getReview()%></p>
                            <p><span class="fa fa-star" aria-hidden="true"></span> Rating: <%= p.getRating()%></p>
                            <p><span class="fa fa-calendar" aria-hidden="true"></span> <%= p.getTime()%></p>
                        </div>
                    </div>
                        <br>
                </div>
                           
                <%}%>
            </div>
        </div>



        <br>
        <br>
        <br>


        <!-- Footer -->
        <div style="position: fixed;bottom: 0 ;height: 50px; width: 100%; background-color: #002D62; text-align: center">
            <a href="contact.jsp" style="color: white; font-size: 25px">Click Here For Contact Details</a>
        </div>


        <!--Javascript-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
