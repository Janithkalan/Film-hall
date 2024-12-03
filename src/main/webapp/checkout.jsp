<%-- 
    Document   : checkout
    Created on : Dec 3, 2024, 6:49:56 PM
    Author     : Dilum
--%>

<%@page import="dto.GoogleUser_DTO"%>
<%@page import="dto.User_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String moive_name = request.getParameter("param1");
    String hall_name = request.getParameter("param2");
    String time_name = request.getParameter("param3");
    String seat_count = request.getParameter("param4");
    String total_price = request.getParameter("param5");
    
    User_DTO normal_user = (User_DTO) request.getSession().getAttribute("user");
    GoogleUser_DTO google_user = (GoogleUser_DTO) request.getSession().getAttribute("google_user");
    

%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie Ticket Booking</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap');
            body {
                background-color: #0D0D0D;
                color: #FFFFFF;
                font-family: "Poppins", sans-serif;
                display: flex;
                justify-content: center;
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
                width: 60px;
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
        </style>
    </head>
    <body onload="calculatePrice(<%= total_price%>, '<%= hall_name%>')">

        <div class="container">
            <div class="title"><%= moive_name%></div>
            <div class="subtitle">
                MOONBEAM CINEMAS MULTIPLEX - Havelock City Mall 
                Thu, 28 Nov &nbsp; | &nbsp; <%= hall_name%> &nbsp; | &nbsp;
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
                        <label for="phone">PHONE</label>
                        <input type="text" id="phone" name="phone" value="">
                    </div>
                </div>
            </div>

            <div class="container_c">
                <div class="payment-info">
                    <div class="mode-title">SELECT YOUR PAYMENT MODE</div>
                    <div class="payment-mode">
                        <img src="resources/IMG/visa.png" alt="Visa">
                        <img src="resources/IMG/master.png" alt="MasterCard">
                    </div>
                    <div class="terms">
                        <input type="checkbox" id="terms">
                        <label for="terms">I agree to the <a href="#"><u>Terms & conditions</u></a></label>
                    </div>
                    
                    <div class="button-container">
                        <button class="button">BACK</button>
                        <button class="button-2">PAY NOW</button>
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


        <script src="resources/JS/checkout.js"></script>                       
    </body>
</html>
