<%-- 
    Document   : register_page
    Created on : 23 Oct, 2023, 11:46:17 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>


        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <main style="padding-bottom: 200px">
            <div class="container">
                <div class="col-md-6 offset-md-3">

                    <div  class="card">
                        <div class="card-header text-center primary-background" style="color: black">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register here
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input  required name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">

                                </div>


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input required name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input required name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Select gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="gender" value="male">Male
                                    <input type="radio" id="gender" name="gender" value="female">Female
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Preferred languages</label>
                                    <input required name="language1" class="form-control" id="language1" placeholder="Language 1">
                                    <br>
                                    <input required name="language2" class="form-control" id="language2" placeholder="Language 2">
                                    <br>
                                    <input required name="language3" class="form-control" id="language3" placeholder="Language 3">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Interested place</label>
                                    <br>
                                    <select name="interested_place" style="width: 200px">
                                        <option value="beaches">Beaches</option>
                                        <option  value="mountains">Mountains</option>
                                        <option  value="religious">Religious</option>
                                        <option  value="hiking">Hiking</option>
                                        <option value="heritage">Heritage</option>
                                    </select>
                                </div>



                                <div class="form-check">
                                    <input required  name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                </div>


                                <button type="submit" class="btn btn-primary">Sign up</button>
                            </form>

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

    </body>
</html>
