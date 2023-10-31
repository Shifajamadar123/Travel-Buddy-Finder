<%-- 
    Document   : Review
    Created on : 30 Oct, 2023, 8:03:36 PM
    Author     : HP
--%>

<%@page import="com.travel.buddy.entities.User"%>
<%
    User user5 = (User) session.getAttribute("current_user");

    if (user5 == null) {
        response.sendRedirect("login_page.jsp");
    } else {%>

<%@page import="com.travel.buddy.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--navbar-->
        <%@include file="profile_navbar.jsp" %>

        <%            Message rating_update = (Message) session.getAttribute("rating_update");
            if (rating_update != null) {%>
        <div class="alert <%= rating_update.getCssClass()%>" role="alert">
            <%= rating_update.getContent()%>
        </div>
        <%}
            session.removeAttribute("rating_update");
        %>

        <%            Message can_you_review = (Message) session.getAttribute("can_you_review");
            if (can_you_review != null) {%>
        <div class="alert <%= can_you_review.getCssClass()%>" role="alert">
            <%= can_you_review.getContent()%>
        </div>
        <%}
            session.removeAttribute("can_you_review");
        %>

        <main class="d-flex align-items-center primary-background banner-background" style="height: 90vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4  offset-md-4">

                        <div class="card">
                            <div class="card-header primary-background text-center" style="color: black">
                                <span class="fa fa-comment fa-3x"></span>
                                <br>
                                <p>Thank You For Your Time</p>
                            </div>


                            <div class="card-body">
                                <form action="ReviewServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Your Name</label>
                                        <input name="user_name" required type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter name">

                                    </div>
                                    <%
                                        String buddy_id = request.getParameter("buddy_id");
                                        int id;
                                        if (buddy_id == null) {
                                            id = (int) session.getAttribute("buddy_id");
                                            session.removeAttribute("buddy_id");
                                        } else {
                                             id = Integer.parseInt(buddy_id);
                                        }
                                    %>
                                    <input hidden name="buddy_id" value="<%= id%>">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Review</label>
                                        <textarea style="height: 150px" name="user_review" required type="text" class="form-control" id="exampleInputPassword1" placeholder="Review"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Rating(0-5)</label>
                                        <input  name="user_rating" required type="number" class="form-control" id="exampleInputPassword1" placeholder="Rating">
                                    </div>

                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>

                                    </div>

                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </main>



        <!-- Footer -->
        <div style="position: fixed;bottom: 0 ;height: 50px; width: 100%; background-color: #002D62; text-align: center">
            <a href="contact.jsp" style="color: white; font-size: 25px">Click Here For Contact Details</a>
        </div>

        <!--Javascript-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>

<% } %>