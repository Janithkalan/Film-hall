<%-- 
    Document   : seatReservation
    Created on : Nov 25, 2024, 2:09:44 PM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String current_movie = request.getParameter("param1");
    String current_date = request.getParameter("param2");
    String current_time = request.getParameter("param3");
    String current_hall = request.getParameter("param4");

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <title>Document</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins';
            }
            body{
                background-color: #1E1E1E;
                color: white;
            }
            .container{
                padding-left: 250px;
                padding-right: 250px;

            }
            .detail_bar{
                display: flex;
            }

            .pendingSeat{
                background-color: #AD069D !important;
            }
            .unavailableSeat{
                background-color: #82580B !important;
            }
            .reservedSeat{
                background-color: #C61515 !important;
            }


            .icon{
                margin-right: 5px;
                margin-left: 10px;
            }
            .datetime{
                display: flex;
            }
            .IMAX2{
                color: #261CBA;
                margin-left: 10px;
            }
            .show_time{
                display: flex;
                column-gap: 10px;
            }
            .show_time .time{
                color: #261CBA;
            }
            i{
                margin-top: 4px;
            }
            .sub_container_1{
                margin-top: 50px;
            }
            .sub_container_2{
                display: flex;
                justify-content: space-between;
                margin-top: 50px;
                column-gap: 50px;
                margin-left: 100px;
                margin-right: 100px;
            }
            .sub_seat_container{
                display: flex;
                column-gap: 50px;
            }
            .table1{
                margin-top: 80px;
            }
            .table2{
                margin-bottom: 45px;
            }
            .seat{
                margin: 1px;
                width: 30px;
                height: 30px;
                background-color: #1E1E1E;
                color: #ffffff;
                border-color: #ffffff;
            }
            .availability{
                display: flex;
                margin-bottom: 5px;
                margin-left: 20px;
            }
            .total_bar{
                display: flex;
                justify-content: space-between;
            }
            .seat_info{
                display: flex;
            }
            .selected_seat {
                display: flex;
                flex-wrap: wrap;
                gap: 5px;
            }

            .selected_seat button {
                background-color: #261CBA;
                width: 30px;
                height: 30px;
                margin-left: 5px;
                color: white;
                border: none;
                cursor: pointer;
                display: inline-block;
            }
            .total{
                display: flex;
            }
            .booking{
                width: 400px;
            }
            .booking .b_btn{
                margin-top: 20px;
            }
            .availability p{
                margin-top: 18px;
                margin-left: 30px;
            }

            .submit_btn{
                text-align: right;
            }
            .submit_btn .btn1{
                margin-right: 20px;
                background-color: #555555;
                color: white;
                width: 70px;
                height: 30px;
                border: none;
            }
            .submit_btn .btn2{
                background-color: #261CBA;
                color: white;
                width: 100px;
                border: none;
                height: 30px;
            }
            .screen_txt{
                text-align: center;
                margin-top: 50px;
            }
            .Amount{
                margin-left: 10px;
                margin-top: 15px;
            }
            img{
                width: 600px;
            }
            .movie_name{
                font-size: 35px;
                margin-bottom: 20px;
            }
            .page_heading{
                font-size: 28px;
                margin-bottom: 15px;
            }


            @media (max-width: 1650px){
                .container{
                    padding-left: 150px;
                    padding-right: 150px;
                }
                .sub_container_2{
                    margin-left: 50px;
                    margin-right: 50px;
                }
            }
            @media (max-width: 1360px){
                .container{
                    padding-left: 50px;
                    padding-right: 50px;
                }
                .booking{
                    width: 350px;

                }
                .sub_container_2{
                    margin-left: 0px;
                    margin-right: 0px;
                    column-gap: 30px
                }
            }
            @media (max-width: 1080px){
                .sub_container_2{
                    flex-wrap: wrap;
                    justify-content: center;
                    column-gap: 20px;
                    margin-bottom: 20px;
                }
                .booking{
                    margin-top: 40px;
                }
            }
            @media(max-width: 750px){
                .seat{
                    width: 25px;
                    height: 25px;
                }
                img{
                    width: 500px;
                }
                .movie_name{
                    font-size: 30px;
                }
                .page_heading{
                    font-size: 28px;
                }
            }
            @media(max-width: 600px){
                .container{
                    padding-left: 10px;
                    padding-right: 10px;
                }
                .sub_seat_container{
                    column-gap: 20px;
                }
                img{
                    width: 450px;
                }
            }
            @media(max-width:500px){
                .seat{
                    width: 22px;
                    height: 22px;
                    margin: 0.5px;
                }
                .table2{
                    margin-bottom: 20px;
                }
                .table1{
                    margin-top: 50px;
                }
                img{
                    width: 400px;
                }
                .movie_name{
                    font-size: 25px;
                }
                .page_heading{
                    font-size: 20px;
                }
                .container{
                    padding-left: 5px;
                    padding-right: 5px;
                }
            }
            @media(max-width:450px){
                .seat{
                    width: 18px;
                    height: 18px;
                    font-size: 10px;
                }
                img{
                    width: 350px;
                }

            }

        </style>
    </head>
    <%@include  file="nav.jsp" %>
    <body onload="loadSeats(<%= current_movie%>,<%= current_date%>, '<%= current_time%>',<%= current_hall%>)">
        <div class="container sub_container_1">
            <h1 class="page_heading">SELECT SEATS</h1>
            <h1 class="movie_name" id="movie_name">VENOM: THE LAST DANCE</h1>
            <div class="detail_bar">
                <i class="icon fa-solid fa-location-dot" style="color: #bfbfbf; margin-left: 0px;"></i>
                <p>MOONBEAM CINEMAS MULTIPLEX</p>
                <div class="datetime">
                    <i class="icon fa-solid fa-calendar-days" style="color: #ffffff;"></i>
                    <div class="date" id="date"></div>
                </div>
                <p class="IMAX2" id="hall_name"><b>IMAX 3D</b></p>
            </div>
            <hr style="margin-top: 20px; margin-bottom: 20px;">
            <div class="show_time">
                <p style="font-size: 18px;">Showtime</p>
                <p class="time" id="time_name">02:30 PM</p>
            </div>
            <hr style="margin-top: 20px; margin-bottom: 20px;">
        </div>
        <div class="container sub_container_2">
            <div class="main_seat_container">
                <div class="sub_seat_container">
                    <div class="table1">
                        <table>
                            <tr>
                                <td><button class="seat" id="A1">A1</button></td>
                                <td><button class="seat" id="A2">A2</button></td>
                                <td><button class="seat" id="A3">A3</button></td>
                                <td><button class="seat" id="A4">A4</button></td>
                                <td><button class="seat" id="A5">A5</button></td>
                            </tr>
                            <tr>
                                <td><button class="seat" id="D1">D1</button></td>
                                <td><button class="seat" id="D2">D2</button></td>
                                <td><button class="seat" id="D3">D3</button></td>
                                <td><button class="seat" id="D4">D4</button></td>
                                <td><button class="seat" id="D5">D5</button></td>
                            </tr>
                            <tr>
                                <td><button class="seat" id="E8">E8</button></td>
                                <td><button class="seat" id="E9">E9</button></td>
                                <td><button class="seat" id="F1">F1</button></td>
                                <td><button class="seat" id="F2">F2</button></td>
                                <td><button class="seat" id="F3">F3</button></td>
                            </tr>
                            <tr>
                                <td><button class="seat" id="G6">G6</button></td>
                                <td><button class="seat" id="G7">G7</button></td>
                                <td><button class="seat" id="G8">G8</button></td>
                                <td><button class="seat" id="G9">G9</button></td>
                                <td><button class="seat" id="H1">H1</button></td>
                            </tr>
                            <tr>
                                <td><button class="seat" id="I4">I4</button></td>
                                <td><button class="seat" id="I5">I5</button></td>
                                <td><button class="seat" id="I6">I6</button></td>
                                <td><button class="seat" id="I7">I7</button></td>
                                <td><button class="seat" id="I8">I8</button></td>
                            </tr>
                            <tr>
                                <td><button class="seat" id="K2">K2</button></td>
                                <td><button class="seat" id="K3">K3</button></td>
                                <td><button class="seat" id="K4">K4</button></td>
                                <td><button class="seat" id="K5">K5</button></td>
                                <td><button class="seat" id="K6">K6</button></td>
                            </tr>
                            <tr>
                                <td><button class="seat" id="L9">L9</button></td>
                                <td><button class="seat" id="M1">M1</button></td>
                                <td><button class="seat" id="M2">M2</button></td>
                                <td><button class="seat" id="M3">M3</button></td>
                                <td><button class="seat" id="M4">M4</button></td>
                            </tr>
                            <tr>
                                <td><button class="seat" id="N7">N7</button></td>
                                <td><button class="seat" id="N8">N8</button></td>
                                <td><button class="seat" id="N9">N9</button></td>
                                <td><button class="seat" id="O1">O1</button></td>
                                <td><button class="seat" id="O2">O2</button></td>
                            </tr>
                            <tr>
                                <td><button class="seat" id="P5">P5</button></td>
                                <td><button class="seat" id="P6">P6</button></td>
                                <td><button class="seat" id="P7">P7</button></td>
                                <td><button class="seat" id="P8">P8</button></td>
                                <td><button class="seat" id="P9">P9</button></td>
                            </tr>
                        </table>

                    </div>
                    <div class="tableset">
                        <div class="table2">
                            <table>
                                <tr>
                                    <td><button class="seat" id="A6">A6</button></td>
                                    <td><button class="seat" id="A7">A7</button></td>
                                    <td><button class="seat" id="A8">A8</button></td>
                                    <td><button class="seat" id="A9">A9</button></td>
                                    <td><button class="seat" id="B1">B1</button></td>
                                    <td><button class="seat" id="B2">B2</button></td>
                                    <td><button class="seat" id="B3">B3</button></td>
                                    <td><button class="seat" id="B4">B4</button></td>
                                    <td><button class="seat" id="B5">B5</button></td>
                                    <td><button class="seat" id="B6">B6</button></td>
                                    <td><button class="seat" id="B7">B7</button></td>
                                </tr>
                                <tr>
                                    <td><button class="seat" id="B8">B8</button></td>
                                    <td><button class="seat" id="B9">B9</button></td>
                                    <td><button class="seat" id="C1">C1</button></td>
                                    <td><button class="seat" id="C2">C2</button></td>
                                    <td><button class="seat" id="C3">C3</button></td>
                                    <td><button class="seat" id="C4">C4</button></td>
                                    <td><button class="seat" id="C5">C5</button></td>
                                    <td><button class="seat" id="C6">C6</button></td>
                                    <td><button class="seat" id="C7">C7</button></td>
                                    <td><button class="seat" id="C8">C8</button></td>
                                    <td><button class="seat" id="C9">C9</button></td>
                                </tr>
                            </table>

                        </div>
                        <div class="table3">
                            <table>
                                <tr>
                                    <td><button class="seat" id="D6">D6</button></td>
                                    <td><button class="seat" id="D7">D7</button></td>
                                    <td><button class="seat" id="D8">D8</button></td>
                                    <td><button class="seat" id="D9">D9</button></td>
                                    <td><button class="seat" id="E1">E1</button></td>
                                    <td><button class="seat" id="E2">E2</button></td>
                                    <td><button class="seat" id="E3">E3</button></td>
                                    <td><button class="seat" id="E4">E4</button></td>
                                    <td><button class="seat" id="E5">E5</button></td>
                                    <td><button class="seat" id="E6">E6</button></td>
                                    <td><button class="seat" id="E7">E7</button></td>
                                </tr>
                                <tr>
                                    <td><button class="seat" id="F4">F4</button></td>
                                    <td><button class="seat" id="F5">F5</button></td>
                                    <td><button class="seat" id="F6">F6</button></td>
                                    <td><button class="seat" id="F7">F7</button></td>
                                    <td><button class="seat" id="F8">F8</button></td>
                                    <td><button class="seat" id="F9">F9</button></td>
                                    <td><button class="seat" id="G1">G1</button></td>
                                    <td><button class="seat" id="G2">G2</button></td>
                                    <td><button class="seat" id="G3">G3</button></td>
                                    <td><button class="seat" id="G4">G4</button></td>
                                    <td><button class="seat" id="G5">G5</button></td>
                                </tr>
                                <tr>
                                    <td><button class="seat" id="H2">H2</button></td>
                                    <td><button class="seat" id="H3">H3</button></td>
                                    <td><button class="seat" id="H4">H4</button></td>
                                    <td><button class="seat" id="H5">H5</button></td>
                                    <td><button class="seat" id="H6">H6</button></td>
                                    <td><button class="seat" id="H7">H7</button></td>
                                    <td><button class="seat" id="H8">H8</button></td>
                                    <td><button class="seat" id="H9">H9</button></td>
                                    <td><button class="seat" id="I1">I1</button></td>
                                    <td><button class="seat" id="I2">I2</button></td>
                                    <td><button class="seat" id="I3">I3</button></td>
                                </tr>
                                <tr>
                                    <td><button class="seat" id="I9">I9</button></td>
                                    <td><button class="seat" id="J1">J1</button></td>
                                    <td><button class="seat" id="J2">J2</button></td>
                                    <td><button class="seat" id="J3">J3</button></td>
                                    <td><button class="seat" id="J4">J4</button></td>
                                    <td><button class="seat" id="J5">J5</button></td>
                                    <td><button class="seat" id="J6">J6</button></td>
                                    <td><button class="seat" id="J7">J7</button></td>
                                    <td><button class="seat" id="J8">J8</button></td>
                                    <td><button class="seat" id="J9">J9</button></td>
                                    <td><button class="seat" id="K1">K1</button></td>
                                </tr>
                                <tr>
                                    <td><button class="seat" id="K7">K7</button></td>
                                    <td><button class="seat" id="K8">K8</button></td>
                                    <td><button class="seat" id="K9">K9</button></td>
                                    <td><button class="seat" id="L1">L1</button></td>
                                    <td><button class="seat" id="L2">L2</button></td>
                                    <td><button class="seat" id="L3">L3</button></td>
                                    <td><button class="seat" id="L4">L4</button></td>
                                    <td><button class="seat" id="L5">L5</button></td>
                                    <td><button class="seat" id="L6">L6</button></td>
                                    <td><button class="seat" id="L7">L7</button></td>
                                    <td><button class="seat" id="L8">L8</button></td>
                                </tr>
                                <tr>
                                    <td><button class="seat" id="M5">M5</button></td>
                                    <td><button class="seat" id="M6">M6</button></td>
                                    <td><button class="seat" id="M7">M7</button></td>
                                    <td><button class="seat" id="M8">M8</button></td>
                                    <td><button class="seat" id="M9">M9</button></td>
                                    <td><button class="seat" id="N1">N1</button></td>
                                    <td><button class="seat" id="N2">N2</button></td>
                                    <td><button class="seat" id="N3">N3</button></td>
                                    <td><button class="seat" id="N4">N4</button></td>
                                    <td><button class="seat" id="N5">N5</button></td>
                                    <td><button class="seat" id="N6">N6</button></td>
                                </tr>
                                <tr>
                                    <td><button class="seat" id="O3">O3</button></td>
                                    <td><button class="seat" id="O4">O4</button></td>
                                    <td><button class="seat" id="O5">O5</button></td>
                                    <td><button class="seat" id="O6">O6</button></td>
                                    <td><button class="seat" id="O7">O7</button></td>
                                    <td><button class="seat" id="O8">O8</button></td>
                                    <td><button class="seat" id="O9">O9</button></td>
                                    <td><button class="seat" id="P1">P1</button></td>
                                    <td><button class="seat" id="P2">P2</button></td>
                                    <td><button class="seat" id="P3">P3</button></td>
                                    <td><button class="seat" id="P4">P4</button></td>
                                </tr>
                                <tr>
                                    <td><button class="seat" id="Q1">Q1</button></td>
                                    <td><button class="seat" id="Q2">Q2</button></td>
                                    <td><button class="seat" id="Q3">Q3</button></td>
                                    <td><button class="seat" id="Q4">Q4</button></td>
                                    <td><button class="seat" id="Q5">Q5</button></td>
                                    <td><button class="seat" id="Q6">Q6</button></td>
                                    <td><button class="seat" id="Q7">Q7</button></td>
                                    <td><button class="seat" id="Q8">Q8</button></td>
                                    <td><button class="seat" id="Q9">Q9</button></td>
                                    <td><button class="seat" id="R1">R1</button></td>
                                    <td><button class="seat" id="R2">R2</button></td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>
                <p class="screen_txt">SCREEN</p>
                <img src="resources/IMG/Line 10.png" alt="">
            </div>
            <div class="booking">
                <div class="availability">
                    <button class="b_btn reserveB" style="background-color: #C61515; width: 20px; height: 20px; border: none;"></button>
                    <p>Reserved</p>
                </div>
                <div class="availability">
                    <button class="b_btn selectB" style="background-color: #261CBA; width: 20px; height: 20px; border: none;"></button>

                    <p>Selected</p>
                </div>
                <div class="availability">
                    <button class="b_btn availableB" style=" width: 20px; height: 20px; background-color:#0000; border-color: white;"></button>

                    <p>Available</p>
                </div>
                <div class="availability">
                    <button class="b_btn unavailableB" style="width: 20px; height: 20px; background-color: #82580B; border: none;"></button>

                    <p>Unavailable</p>
                </div>
                <hr>
                <p style="margin-bottom: 20px; margin-top: 10px; margin-left: 20px;"><span id="seat-count" class="count">0</span> ticket(s) selected.Please select seats</p>
                <div class="total_bar">
                    <div class="seat_info">
                        <p style="margin-left: 20px;">SEAT INFO </p>
                        <div class="selected_seat" id="selected_seat">

                        </div>
                    </div>
                    <div class="total">
                        <p style="font-size: 15px;"><b>TOTAL</b><br> [LKR]</p>
                        <p class="Amount" id="total_price">0</p>
                    </div>
                </div>
                <hr style="margin-top: 10px; margin-bottom: 10px;">
                <div class="submit_btn">
                    <button class="btn2" style="background-color: #261CBA; color: white; width: 100px; border: none;" onclick="navigateCheckout(<%= current_movie%>,<%= current_date%>, '<%= current_time%>',<%= current_hall%>),pending_update();">CONTINUE</button>
                </div>
            </div>
        </div>

        <script src="resources/JS/seatReservation.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
    <%@include  file="footer.jsp" %>
</html>
<%    }


%>



