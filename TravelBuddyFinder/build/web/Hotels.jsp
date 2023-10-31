<%-- 
    Document   : Hotels
    Created on : 30 Oct, 2023, 6:07:40 PM
    Author     : HP
--%>

<%@page import="com.travel.buddy.entities.Hotel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.buddy.dao.HotelDao"%>
<%@page import="com.travel.buddy.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotels Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

        <style>
            .fixed-card {
                height: 650px; /* Set the fixed height for the card */
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
        <h4 class="text-center" style="color: #002D62">All Hotels</h4>
        <br>
        <%  
            ConnectionProvider con = new ConnectionProvider();
            HotelDao hdao = new HotelDao(con.getConnection());
            ArrayList<Hotel> list = hdao.getAllHotels();%>
        <div class="container">
            <div class="row">
                <%for (Hotel p : list) {%>
                <div class="col-md-6">
                    <div class="card fixed-card">
                        <img src="data:image/jpeg;base64, <%= p.getImage_data()%>" height="300px"class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getName()%><br><%= p.getCity() %>, <%= p.getCountry()%></h5>
                            <p class="card-text"><%= p.getInfo()%></p>
                            <p><span class="fa fa-phone" aria-hidden="true"></span> Contact No: <%= p.getContact() %></p>
                            <a href="<%= p.getMaplink() %>" target="_blank" style="color: grey"><span class="fa fa-map-marker" aria-hidden="true"></span> Click Here For Location</a><br>
                            <br><a target="_blank" href="<%= p.getHotel_link()%>" class="btn primary-background text-white" style="background-color: #002D62">Click Here For Official Website</a>
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
