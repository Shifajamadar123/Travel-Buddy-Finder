<%-- 
    Document   : contact
    Created on : 22 Oct, 2023, 10:30:07 AM
    Author     : HP
--%>

<%@page import="com.travel.buddy.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            .contact{
                color:white;
                background-color:  #002D62;
                text-align: center;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 10px;
                width: 700px;
                height: 320px;
            }
        </style>

    </head>
    <body>
        <!-- Navbar -->
        <%
            User user3 = (User) session.getAttribute("current_user");
            if (user3 == null) {%> 
        <%@include file="navbar.jsp" %>
        <%} else {%> <%@include file="profile_navbar.jsp" %><%}
        %>
        <div class="contact">
            <p style="font-size: 20px">Thank you for your interest. We are here to help you.</p>
            <hr>
            <p><span class="fa fa-envelope"></span> Email: shifajamadar14@gmail.com <hr><span class="fa fa-phone"></span> Mobile: 9972079155 <hr><span class="fa fa-linkedin-square"></span> LinkedIn: <a href="https://www.linkedin.com/in/shifa-jamadar-787900210">Click Here</a></p>
    </div>

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
