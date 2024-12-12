<%-- 
    Document   : checkout
    Created on : Dec 3, 2024, 6:49:56 PM
    Author     : Dilum
--%>

<%@page import="com.google.gson.Gson"%>
<%@ page import="java.util.List" %>
<%@ page import="dto.Reservation_DTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String moive_name = request.getParameter("param1");
    String hall_name = request.getParameter("param2");
    String time_name = request.getParameter("param3");
    String seat_count = request.getParameter("param4");
    String total_price = request.getParameter("param5");
    String reservation_dto_json = request.getParameter("param6");

    Gson gson = new Gson();
    Reservation_DTO reservation_dto = gson.fromJson(reservation_dto_json, Reservation_DTO.class);

    User_DTO normal_user1 = (User_DTO) request.getSession().getAttribute("user");
    GoogleUser_DTO google_user1 = (GoogleUser_DTO) request.getSession().getAttribute("google_user");
    //validate sessions
    if (normal_user1 == null && google_user1 == null) {
    //redirect to need to login message
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
        <title>Movie Ticket Booking</title>
        <style>
            body{
                margin: 0;
                font-family: "Poppins", sans-serif;

            }
            .body_styles {
                background-color: #0D0D0D;
                color: #FFFFFF;

                justify-content: center;
                display: flex;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .container {
                width: 1300px;
                padding: 20px;
            }
            .title {
                font-size: 35px;
                font-weight: 300;
                text-align: left;
            }
            .subtitle {
                font-size: 15px;
                text-align: left;
                margin-top: 5px;
                font-weight: 500;
            }
            .time-box {
                background-color: #3333FF;
                padding: 5px 10px;
                color: #FFFFFF;
                border-radius: 5px;
                font-size: 12px;
                display: inline-block;
                margin-top: 10px;
            }
            .section-title {
                font-size: 21px;
                font-weight: 300;
                margin-bottom: 21px;
                text-align: left;
            }
            .divider {
                border-top: 1px solid #444444;
                margin: 15px 0;
            }
            .input-row {
                display: flex;
                justify-content: space-between;
            }
            .input-group {
                width: 32%;
                text-align: left;
            }
            .input-group label {
                display: block;
                font-size: 12px;
                color: #888888;
                margin-bottom: 5px;
            }
            .input-group input {
                width: 100%;
                padding: 8px;
                background-color: #0D0D0D;
                color: #FFFFFF;
                border: none;
                border-bottom: 1px solid #888888;
                font-size: 14px;
            }
            .input-group input:focus {
                outline: none;
                border-bottom: 1px solid #FFFFFF;

            }
            .container_c {
                width: 800px;
                padding: 20px;
                display: flex;
                gap: 100px;
                flex-direction: row-reverse;
            }
            .seat-info, .payment-info {
                width: 48%;
            }

            .payment-info{
                margin-left: 100px;
            }
            .seat-details, .total-info, .payment-mode, .terms {
                margin-top: 15px;
            }
            .seat-title{
                font-size: 17px;
                font-weight: 300;
            }
            .seat-details {
                display: flex;
                justify-content: space-between;
                font-size: 14px;
            }
            .seat-labels, .seat-prices {
                width: 50%;
            }
            .seat-labels div{
                font-size: 14px;
                padding: 4px 0;
                font-weight: 300;
            }

            .seat-prices div {
                font-size: 14px;
                padding: 4px 0;
                font-weight: 200;
            }
            .seat-prices {
                text-align: right;
                font-size: 16px;
            }
            .total-info {
                display: flex;
                justify-content: space-between;
                font-size: 14px;
                margin-top: 15px;
            }
            .total-amount {
                font-size: 18px;
                font-weight: 300;
                text-align: right;
                margin-top: 6px;
            }
            .total-label{
                text-align: center;
            }
            .payment-mode img {
                width: 40px;
                margin-right: 10px;
                vertical-align: middle;
            }
            .mode-title{
                font-size: 18px;
                font-weight: 300;
            }
            .terms {
                display: flex;
                align-items: center;
                font-size: 14px;
                font-weight: 300;
            }
            .terms input {
                margin-right: 10px;
            }
            .terms a {
                color: #FFFFFF;
                font-weight: 500;
                text-decoration: none;
            }
            .button-container {
                display: flex;
                gap: 8px;
                margin-top: 20px;
            }
            .button {
                width: 100px;
                padding: 12px;
                background-color: #252525;
                color: #FFFFFF;
                border: none;
                font-size: 13px;
                font-weight: 200;
                cursor: pointer;
                text-align: center;
            }
            .button-2 {
                width: 140px;
                padding: 12px;
                background-color: #261CBA;
                color: #FFFFFF;
                border: none;
                font-size: 13px;
                font-weight: 200;
                cursor: pointer;
                text-align: center;
            }
            @media (max-width: 1368px) {
                .container {
                    width: 95%;
                    padding: 20px;
                }

                .container_c {
                    display: flex;
                    flex-direction: row;
                    gap: 20px;
                    justify-content: space-between;
                }

                .seat-info, .payment-info {
                    width: 48%;
                }

                .payment-info {
                    order: 2;
                    margin-left: 80px;
                    margin-right: 0;
                }

                .input-group input {
                    width: 100%;
                }

                .payment-mode img {
                    width: 35px;
                }

                .button-container {
                    justify-content: flex-start;
                }
            }
            @media (max-width: 1024px) {
                .container {
                    width: 90%;
                    padding: 15px;
                }

                .container_c {
                    display: flex;
                    flex-direction: column !important;
                    gap: 30px;
                    width: 100%;
                }

                .seat-info,
                .payment-info {
                    width: 100%;
                    margin: 0 auto;
                }
                .terms {
                    display: flex;
                    align-items: center;
                    font-size: 14px;
                    font-weight: 300;
                }
                .payment-info {
                    order: 2;
                    margin-top: 20px;
                }
                .input-group input {
                    width: 190px;
                }


                .terms {
                    display: flex;
                    align-items: center;
                    font-size: 14px;
                    font-weight: 300;
                }
            }

            @media (max-width: 768px) {
                .title {
                    font-size: 28px;
                }
                .subtitle {
                    font-size: 14px;
                }
                .section-title {
                    font-size: 18px;
                }
                .input-group {
                    width: 100%;
                    margin-bottom: 15px;
                }
                .seat-title {
                    font-size: 16px;
                }
                .seat-details {
                    font-size: 12px;
                }
                .total-amount {
                    font-size: 16px;
                }
                .input-group input {
                    width: 110px;
                }

            }

            @media (max-width: 480px) {
                .title {
                    font-size: 24px;
                }
                .subtitle {
                    font-size: 12px;
                }
                .time-box {
                    font-size: 10px;
                    padding: 3px 6px;
                }
                .input-row {
                    flex-direction: column;
                    gap: 10px;
                }
                .seat-title {
                    font-size: 14px;
                    text-align: center;
                }
                .seat-details, .total-info {
                    font-size: 10px;
                }
                .total-amount {
                    font-size: 14px;
                }
                .payment-mode img {
                    width: 25px;
                }
                .button {
                    width: 80px;
                    font-size: 11px;
                }
                .button-2 {
                    width: 100px;
                    font-size: 11px;
                }
            }
        </style>
    </head>
    <%@include  file="nav.jsp" %>
    <body onload="calculatePrice(<%= total_price%>, '<%= hall_name%>')">
        <div class="body_styles">
            <div class="container">
                <div class="title"><%= moive_name%></div>
                <div class="subtitle">
                    MOONBEAM CINEMAS MULTIPLEX - Havelock City Mall,  
                     <%= reservation_dto.getDate_id() %> Dec &nbsp; | &nbsp; <%= hall_name%> &nbsp; | &nbsp;
                    <span class="time-box"><%= time_name%></span>
                    <br><br>
                    <div class="divider"></div>
                </div>

                <div class="container">
                    <div class="section-title">ENTER YOUR DETAILS</div>
                    <div class="input-row">
                        <div class="input-group">
                            <label for="name">NAME</label>
                            <input type="text" id="name" name="name" 
                                   value="<%= (normal_user != null) ? normal_user.getFirst_name() + " " + normal_user.getLast_name() : google_user.getName()%>" disabled>
                        </div>
                        <div class="input-group">
                            <label for="email">EMAIL</label>
                            <input type="text" id="email" name="email" 
                                   value="<%= (normal_user != null) ? normal_user.getEmail() : google_user.getEmail()%>" disabled>
                        </div>
                        <div class="input-group">
                            <label for="phone">COUPON CODE</label>
                            <input type="text" id="coupon" name="coupon" value="" onkeyup="coupon_search()">
                        </div>
                    </div>
                </div>

                <div class="container_c">
                    <div class="payment-info">
                        <div class="mode-title">AVAILABLE PAYMENT METHODS</div>
                        <div class="payment-mode">
                            <img src="resources/IMG/visa.png" alt="Visa">
                            <img src="resources/IMG/master.png" alt="MasterCard">
                        </div>
                        <div class="terms">
                            <input type="checkbox" id="terms">
                            <label for="terms">I agree to the <a href="terms_and_conditions.jsp"><u>Terms & conditions</u></a></label>
                        </div>
                        

                        <div class="button-container">
                            <button class="button-2" onclick='paymentProcess(<%= gson.toJson(reservation_dto)%>)'>PAY NOW</button>
                        </div>
                    </div>

                    <div class="seat-info">
                        <div class="seat-title">SEAT INFO</div>
                        <div class="seat-details">
                            <!-- Left side: Labels -->
                            <div class="seat-labels">
                                <div><%= seat_count%></div>
                                <div>VAT</div>
                                <div>Conv. Fees</div>
                                <div>Service fee Rs.30 (for coupon users only)</div>
                            </div>
                            <!-- Right side: Prices -->
                            <div class="seat-prices">
                                <div>LKR <%= total_price%></div>
                                <div>LKR <span id="vat"></span></div>
                                <div>LKR <span id="conv"></span></div>
                            </div>
                        </div>
                        <div class="divider"></div>
                        <div class="total-info">
                            <div class="total-label">TOTAL<br>  [LKR]</div>
                            <div class="total-amount" id="final_price">4,165.45</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
                
        <script type="text/javascript" src="https://www.payhere.lk/lib/payhere.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="resources/JS/checkout.js"></script>  
    </body>
    <%@include  file="footer.jsp" %>
</html>

<%    }


%>
