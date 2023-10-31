<%-- 
    Document   : Upload_image
    Created on : 23 Oct, 2023, 2:27:49 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Page</title>
        
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
                            Welcome
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="UploadImageServlet" method="POST" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Profile image</label><br>
                                    <input required name="image" type="file" accept="image/png,image/jpg" onchange="handleImageUpload(event)" />
                                  
                                </div>

                                <button type="submit" class="btn btn-primary">Upload Image to Begin</button>
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

</body>
</html>
