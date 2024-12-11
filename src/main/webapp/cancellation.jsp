<%-- 
    Document   : cancellation
    Created on : Dec 9, 2024, 3:32:22 PM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Invoice Page</title>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Poppins');

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            html, body {
                height: 100%;
                margin: 0;
                background-color: #0D0D0D;
                color: #ffffff;
            }

            .container {
                width: 100vw;
                height: 100vh;
                padding: 40px;
                padding-left: 120px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                overflow-y: auto;
                border-radius: 0;
            }

            h2{
                font-size: 22px;
                margin-bottom: 10px;
                font-weight: 100;
            }
            h3 {
                font-size: 22px;
                margin-bottom: 10px;
                font-weight: 100;

            }

            .form-group, .info-row, .invoice-details, .seat-info, .price, .cancel-section {
                width: 100%;
                margin-bottom: 20px;

            }

            .invoice-details{
                margin-top: 10px;
            }

            .info-row {
                display: flex;
                justify-content: space-between;
                gap: 20px;
                width: 100%;
            }

            .info-group {
                flex: 1;
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-size: 14px;
                color: #bbbbbb;
                margin-bottom: 5px;
            }

            #invoice-id {
                width: 100%;
                max-width: 447px;
                height: 45px;
                padding: 15px;
                background-color: #252525;
                color: #ffffff;
                border: none;
                border-bottom: none;
                outline: none;
            }


            input[type="text"], input[type="email"] {
                width: 100%;
                padding: 8px;
                background-color: transparent;
                color: #ffffff;
                border: none;
                border-bottom: 2px solid #716F6F;
                outline: none;
                border-radius: 0;
            }

            .seat-info p, .price p {
                font-size: 14px;
                color: #ffffff;
                margin: 5px 0;
            }
            .location{
                font-size: 14px;
                font-weight:100;
                color: #ffffff;
                margin: 5px 0;
            }

            .price{
                display: flex;
                gap: 40px;
            }


            .seat-info {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .seats {
                display: flex;
                gap: 5px;
            }

            .seat {
                padding: 6px 11px;
                background-color: #261CBA;
                color: #ffffff;
                border-radius: 0;
                font-size: 13px;
                font-weight: 100;
            }

            .Imax{
                font-weight: 600;
            }
            .Date, .Time{
                font-weight: 400;
            }

            button {
                width: 120px;
                height: 37px;
                padding: 10px;
                color: #ffffff;
                background-color: #261CBA;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.2s ease;
                font-weight: 200;

            }

            button:hover {
                background-color: #261CBA;
                transform: scale(1.05);
            }

            button:active {
                transform: scale(0.95);
            }

            .cancel-section {
                display: flex;
                align-items: center;
            }

            .cancel-section label {
                margin-left: 10px;
                margin-top: 5px;
            }


            @media screen and (max-width: 768px) {
                .container {
                    padding: 20px;
                }

                .info-row {
                    flex-direction: column;
                    align-items: stretch;
                }

                .info-group {
                    margin-bottom: 15px;
                }

                #invoice-id {
                    max-width: 100%;
                }

                button {
                    width: 100%;
                    padding: 12px;
                    font-size: 1.1em;
                }
            }

            @media screen and (max-width: 480px) {
                .container {
                    padding: 15px;
                }

                h2 {
                    font-size: 20px;
                }

                .info-row {
                    flex-direction: column;
                    gap: 10px;
                }

                .info-group input {
                    font-size: 14px;
                    padding: 10px;
                }

                .seat-info p, .price p {
                    font-size: 14px;
                }

                .seats {
                    flex-direction: column;
                }

                button {
                    width: 100%;
                    padding: 15px;
                    font-size: 1.2em;
                }
            }




        </style>
    </head>
    <%@include file="nav.jsp" %>
    <body>
        <div class="container">
            <h2>ENTER YOUR DETAILS</h2>
            <div class="form-group">
                <input type="text" id="invoice-id" placeholder="Invoice ID" onkeyup="load_data()" style="width:447px; height:50px; size: 18px; font-weight: 600;">
            </div>
            <div class="info-row">
                <div class="info-group">
                    <label for="name">NAME</label>
                    <input type="text" id="name" value="" style="border: none ; border-bottom: 2px solid #716F6F; background-color: 0D0D0D;" disabled>
                </div>
                <div class="info-group">
                    <label for="email">EMAIL</label>
                    <input type="email" id="email" value="" style="border: none ; border-bottom: 2px solid #716F6F; text-decoration: underline;" disabled>
                </div>
                <div class="info-group">
                    <label for="phone">PHONE</label>
                    <input type="text" id="phone" value="" style="border: none ; border-bottom: 2px solid #716F6F;" disabled>
                </div>
            </div>
            <h3>INVOICE DETAILS</h3>
            <div class="invoice-details">
                <p class="mov-title" id="title"></p>
                <p class="location">Moonbeam Cinemas Multiplex - Havelock City Mall<span class="Date" id="date"></span> <span class="Imax" id="hall"></span><span class="Time" id="time"></span></p>
            </div>
            <div class="seat-info">
                <p>SEAT INFO</p>
                <div class="seats">
                    <span class="seat">SEAT</span>
                </div>
            </div>
            <div class="price">
                <p>PRICE:  </p>
                <P><span id="total_price">0 </span>.00 [LKR]</P>
            </div>
            <div class="cancel-section">
                <input type="checkbox" id="confirm-cancel">
                <label for="confirm-cancel">Confirm Cancellation</label>
            </div>
            <button onclick="coupon()">CANCEL</button>
        </div>
        <script src="resources/JS/cancellation.js"></script>
    </body>
    <%@include file="footer.jsp" %>
</html>

