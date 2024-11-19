<%-- 
    Document   : nav
    Created on : Nov 14, 2024, 1:02:37 PM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Navigation Bar</title>
        <link rel="stylesheet" href="resources/CSS/nav.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    </head>  

    <body>
        <div class="container">
            <button onclick="ham()" class="nav-btn"><i class="fa-solid fa-bars"></i></button>
            <div class="items">
                <ul class="nav-links" id="nav-link">
                    <li class="navlinks"><a href="">HOME</a></li>
                    <li class="navlinks"><a href="">MOVIES</a></li>
                    <li class="navlinks"><a href="">EXCLUSIVE DEALS</a></li>
                    <li class="navlinks"><a href="">CONTACT US</a></li>
                    <div class="search-container" style="margin-right: 100px;">
                        <input type="text" id="search-input2" placeholder="Search..." onkeyup="searchResults()">
                        <div id="dropdown2" class="dropdown-content2"></div>
                    </div>
                    <button class="buy"><a href="">BUY TICKETS</a></button>
                    <li class="navlinks"><a href="">LOGIN</a></li>
                </ul>
            </div>
            <div class="items" id="items2">
                <ul class="nav-links" id="nav-link2">
                    <li class="navlinks"><a href="">HOME</a></li>
                    <li class="navlinks"><a href="">MOVIES</a></li>
                    <li class="navlinks"><a href="">EXCLUSIVE DEALS</a></li>
                    <li class="navlinks"><a href="">CONTACT US</a></li>
                    <div class="search-container" style="margin-right: 100px;">
                        <input type="text" id="search-input" placeholder="Search..." onkeyup="searchResults()">
                        <div id="dropdown" class="dropdown-content">
                            <div class="dropdown-item" id="dropdown-item">
                                <a href="url" id="anchor">
                                    <img src="" alt="alt" id="resultImg" class="resultImg" style="width: 50px; height: 70px"/>
                                    <span id="resultName" class="resultName"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <button class="buy"><a href="">BUY TICKETS</a></button>
                    <li class="navlinks"><a href="">LOGIN</a></li>
                </ul>
            </div>
            <br>
            <hr>
        </div>
        <script src="resources/JS/search.js"></script>
        <script src="resources/JS/nav.js"></script>
    </body>
</html>

