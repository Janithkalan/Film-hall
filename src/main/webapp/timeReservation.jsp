<%-- 
    Document   : timeReservation
    Created on : Nov 19, 2024, 4:42:42 PM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    User_DTO normal_user1 = (User_DTO) request.getSession().getAttribute("user");
    GoogleUser_DTO google_user1 = (GoogleUser_DTO) request.getSession().getAttribute("google_user");
    //user session validation
    if (normal_user1 == null && google_user1 == null) {
    //redirect to login message
%> 
<html>
    <head>
        <title>Error</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <style>
            body {
                background-color: black !important;
                font-family: 'Poppins', sans-serif;
            }
        </style>
    </head>
    <body>
        <script>

            swal("", "You need to login first", "error").then(() => {
                window.location = "index.jsp";
            });

        </script>

    </body>
</html>


<%} else {

%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Venom: The Last Dance</title>
        <link rel="stylesheet" type="text/css" href="resources/CSS/timeReservation.css">
        <style>
             body {
                font-family: 'Poppins', sans-serif !important;
            }
            p{
            color:white;
        }</style>
    </head>
    <%@include  file="nav.jsp" %>
    <body onload="timeReservationDetails()">

        <div class="im">
            <div class="details">
                <span class="big" id="movie_title"></span>
                <div class="small" id="movie_description"></div>
            </div>
            <span class="imdb">
                <img src="resources/IMG/imdb.png" alt="imdb">
                <span class="imdb_text">IMDb - <span id="movie_rating"></span></span>
            </span>
            <a href="" target="_blank" id="movie_trailer" class="trail">
                <span class="trailer">
                    <img src="resources/IMG/show.png" alt="trailer">
                    WACTH TRAILER </span></a>

            <img src="" alt="Movie.png" id="movie_poster">
        </div>
        <div >
            <h1>BUY TICKETS</h1>
            <div class="drop">
                <div class="date_movie">
                    <table>
                        <tr>
                            <td class="dropdown-cell">
                                <div class="cell">
                                    <span><img src="resources/IMG/Calendar.png" alt=""></span>
                                    <span>
                                        <select name="date" id="date_dropdown">
                                            <option value="today" selected hidden>Today</option>
                                            <option value="" id="date_dropdown_option">Wed, 13 Nov</option>
                                        </select>
                                    </span>
                                </div>
                            </td>
                            <td class="dropdown-cell" style="width:60%;">
                                <select name="movie" id="movie_dropdown">
                                    <option value="2" id="options"></option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <div class="word">
                        <div id="available">AVAILABLE</div>
                        <div id="sold">SOLD OUT</div>
                        <div id="lapsed">UNAVAILABLE</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="location">
            <div><img src="resources/IMG/location.png" alt=""></div>
            <div>ABC CINEMAS MULTIPLEX</div>
        </div>
        <div>
            <div class="category">
                <div>DIGITAL 3D</div>
                <div><img src="resources/IMG/digital.png" alt=""></div>
            </div>
            <div class="time" id="digital">
                <button id="digital_btn" class="available" onclick="navigate_hall(3)">10:45 AM</button>
            </div>
        </div>
        <div>
            <div class="category">
                <div>GOLD 3D</div>
                <div><img src="resources/IMG/gold.png" alt=""></div>
            </div>
            <div class="time" id="gold">
                <button id="gold_btn" class="available" onclick="navigate_hall(2)">11:45 AM</button>
            </div>
        </div>
        <div>
            <div class="category">
                <div>IMAX 3D</div>
                <div><img src="resources/IMG/imax.png" alt=""></div>
            </div>
            <div class="time" id="imax">
                <button id="imax_btn" class="available" onclick="navigate_hall(1)">11:45 AM</button>
            </div>
        </div>

        <script src="resources/JS/timeReservation.js"></script>


    </body>
    <%@include  file="footer.jsp" %>
</html>

<%    }

%>

