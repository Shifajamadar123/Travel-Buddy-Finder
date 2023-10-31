<%-- 
    Document   : profile
    Created on : 24 Oct, 2023, 12:36:00 PM
    Author     : HP
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.buddy.helper.ConnectionProvider"%>
<%@page import="com.travel.buddy.dao.PlaceDao"%>
<%@page import="com.travel.buddy.entities.Message"%>
<%@page import="com.travel.buddy.entities.*"%>
<%
    User user = (User) session.getAttribute("current_user");

    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }else { %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            .fixed-card {
                height: 600px; /* Set the fixed height for the card */
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

        <!--main body-->
        <br>
        <h4 class="text-center" style="color: #002D62">Places That Attract You</h4>
        <br>
        <%
            ConnectionProvider con = new ConnectionProvider();
            PlaceDao pdao = new PlaceDao(con.getConnection());
            ArrayList<Place> list = pdao.getInterestedPlaces(user.getInterested_place().toLowerCase());%>
        <div class="container">
            <div class="row">
                <%for (Place p : list) {%>
                <div class="col-md-6">
                    <div class="card fixed-card">
                        <img src="data:image/jpeg;base64, <%= p.getImage_data()%>" height="300px"class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getName()%>, <%= p.getCountry()%></h5>
                            <p class="card-text"><%= p.getInfo()%></p>
                            <p style="color: grey"><%= p.getTag().toUpperCase() %></p>
                            <a target="_blank" href="<%= p.getLink()%>" class="btn primary-background text-white" style="background-color: #002D62">Click Here For More Info</a>
                        </div>
                    </div>
                </div>


                <%}%>
            </div>
        </div>


        <br>
        <h4 class="text-center" style="color:#002D62">Explore Other Places</h4>
        <br>
        <%
            ArrayList<Place> list1 = pdao.getOtherPlaces(user.getInterested_place().toLowerCase());%>
        <div class="container">
            <div class="row">
                <%for (Place p1 : list1) {%>
                <div class="col-md-6">
                    <div class="card fixed-card">
                        <img src="data:image/jpeg;base64, <%= p1.getImage_data()%>" height="300px"class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= p1.getName()%>, <%= p1.getCountry()%></h5>
                            <p class="card-text"><%= p1.getInfo()%></p>
                            <p style="color: grey"><%= p1.getTag().toUpperCase() %></p>
                            <a target="_blank" href="<%= p1.getLink()%>" class="btn primary-background text-white" style="background-color: #002D62">Click Here For More Info</a>
                        </div>
                    </div>
                </div>


                <%}%>
            </div>
        </div>


        <br>
        <br>
        <br>
        <!--modal-->
        <!-- For profile -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-white text-center" style="background-color: #002D62">
                        <h5 class="modal-title" id="exampleModalLabel">TravelBuddyFinder</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" >
                        <div class="container text-center">
                            <img src="user_pics/image<%=user.getId() - 1%>.png" style="height: 100px; width: 100px;  border-radius: 50%; "/>
                            <br>
                            <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--Profile details-->
                            <div id="profile_details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="col">Email</th>
                                            <td><h5 class="modal-title" id="exampleModalLabel"><%= user.getEmail()%></h5></td>
                                        </tr>

                                        <tr>
                                            <th scope="col">Gender</th>
                                            <td><h5 class="modal-title" id="exampleModalLabel"><%= user.getGender()%></h5></td>
                                        </tr>

                                        <tr>
                                            <th scope="col">Language 1</th>
                                            <td><h5 class="modal-title" id="exampleModalLabel"><%= user.getLanguage1()%></h5></td>
                                        </tr>

                                        <tr>
                                            <th scope="col">Language 2</th>
                                            <td><h5 class="modal-title" id="exampleModalLabel"><%= user.getLanguage2()%></h5></td>
                                        </tr>

                                        <tr>
                                            <th scope="col">Language 3</th>
                                            <td><h5 class="modal-title" id="exampleModalLabel"><%= user.getLanguage3()%></h5></td>
                                        </tr>

                                        <tr>
                                            <th scope="col">Interested place</th>
                                            <td><h5 class="modal-title" id="exampleModalLabel"><%= user.getInterested_place()%></h5></td>
                                        </tr>

                                        <tr>
                                            <th scope="col">Registered On</th>
                                            <td><h5 class="modal-title" id="exampleModalLabel"><%= user.getDateTime().toString()%></h5></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--Profile editing-->
                            <div id="profile_edit" style="display: none;">
                                <h3 class="mt-2">Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>Name: </td>
                                                <td><input type="text" class="form-control" name="user_name" value=<%= user.getName()%>></td>
                                            </tr>

                                            <tr>
                                                <td>Email: </td>
                                                <td><input type="email" class="form-control" name="user_email" value=<%= user.getEmail()%>></td>
                                            </tr>

                                            <tr>
                                                <td>Password: </td>
                                                <td><input type="password" class="form-control" name="user_password" value=<%= user.getPassword()%>></td>
                                            </tr>

                                            <tr>
                                                <td>Gender </td>
                                                <td><%= user.getGender().toUpperCase()%></td>
                                            </tr>

                                            <tr>
                                                <td>Language1: </td>
                                                <td><input type="text" class="form-control" name="user_language1" value=<%= user.getLanguage1()%>></td>
                                            </tr>

                                            <tr>
                                                <td>Language2: </td>
                                                <td><input type="text" class="form-control" name="user_language2" value=<%= user.getLanguage2()%>></td>
                                            </tr>

                                            <tr>
                                                <td>Language3: </td>
                                                <td><input type="text" class="form-control" name="user_language3" value=<%= user.getLanguage3()%>></td>
                                            </tr>

                                            <tr>
                                                <td>Interested Place: </td>
                                                <td>
                                                    <select name="user_interested_place" style="width: 200px" value="<%= user.getInterested_place()%>">
                                                        <option value="beaches">Beaches</option>
                                                        <option  value="mountains">Mountains</option>
                                                        <option  value="religious">Religious</option>
                                                        <option  value="hiking">Hiking</option>
                                                        <option value="heritage">Heritage</option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Change Image</td>
                                                <td><input name="image" type="file" accept="image/png,image/jpg" onchange="handleImageUpload(event)" />
                                                </td>
                                            </tr>
                                        <input type="hidden" name="user_id" value="<%= user.getId()%>">
                                        </tbody>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit Profile</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of modal-->



        <!-- Footer -->
        <div style="position: fixed;bottom: 0 ;height: 50px; width: 100%; background-color: #002D62; text-align: center">
            <a href="contact.jsp" style="color: white; font-size: 25px">Click Here For Contact Details</a>
        </div>


        <!--Javascript-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


        <script>
                                                    $(document).ready(function () {
                                                        let editStatus = false;


                                                        $('#edit-profile-button').click(function () {
                                                            //alert("Button clicked");
                                                            if (editStatus === false)
                                                            {
                                                                $('#profile_edit').css("display", "");
                                                                $('#profile_details').hide();
                                                                $('#profile_edit').show();
                                                                editStatus = true;
                                                                $(this).text("Back");
                                                            } else
                                                            {
                                                                $('#profile_details').show();
                                                                $('#profile_edit').hide();
                                                                editStatus = false;
                                                                $(this).text("Edit Profile");
                                                            }

                                                        });
                                                    });

        </script>

    </body>
</html>
 <% } %>