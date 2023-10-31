<%-- 
    Document   : navbar
    Created on : 21 Oct, 2023, 7:51:47 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark"style="background-color: #002D62">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-taxi"></span> TravelWithYourBuddy</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="login_page.jsp"><span class="fa fa-plane" aria-hidden="true"></span> Destination</a>
                            <a class="dropdown-item" href="login_page.jsp"><span class="fa fa-bed" aria-hidden="true"></span> Hotels</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="login_page.jsp"><span class="fa fa-users" aria-hidden="true"></span> Travel Buddy</a>
                        </div>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="contact.jsp"><span class="fa fa-address-book"></span> Contact</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Upload_image.jsp"><span class="fa fa-user-plus"></span> Sign-up</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0" action="login_page.jsp">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </body>
</html>
