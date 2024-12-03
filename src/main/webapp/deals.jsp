<%-- 
    Document   : deals
    Created on : Dec 4, 2024, 4:33:31 AM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins');
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins';
        }
        body{
            background-color: #1E1E1E;
            color: white;
        }
        .container{
            padding-right: 250px;
            padding-left: 250px;
            margin-top: 50px;
        }
        h1{
            font-size: 28px;
        }
        h4{
            font-size: 24px;
        }
        p{
            font-size: 18px;
            color: #B6B2B2;
        }
        .sub_container2{
            display: flex;
            column-gap: 30px;
            margin-top: 50px;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .sub_container2 p{
            margin-top: 30px;
        }
        .sub_container3{
            display: flex;
            margin-top: 30px;
            justify-content: center;
            text-align: center;
        }
        .image img{
            width: 750px;
        }
        @media (max-width:1780px){
            .container{
            padding-right: 200px;
            padding-left: 200px;
            }
        }
        @media (max-width:1680px){
            .container{
            padding-right: 150px;
            padding-left: 150px;
            }
        }
        @media (max-width:1400px){
            .container{
            padding-right: 50px;
            padding-left: 50px;
            }
            .image img{
                width: 600px;
            }
        }
        @media (max-width:1180px){
            .container{
            padding-right: 100px;
            padding-left: 100px;
            }
            .sub_container2{
                flex-wrap: wrap;
            }
            .image{
                margin-top: 50px;
            }
        }
        @media (max-width:800px){
            .container{
            padding-right: 50px;
            padding-left: 50px;
            }
            .sub_container2{
                flex-wrap: wrap;
            }
            .image img{
                width: 600px;
            }
        }
        @media (max-width:700px){
            .container{
            padding-right: 20px;
            padding-left: 20px;
            }
            .image img{
                width: 550px;
            }
        }
        @media (max-width:580px){
            .image img{
                width: 450px;
            }
            p{
                font-size: 14px;
            }
            h4{
                font-size: 20px;
            }
            h1{
                font-size: 24px;
            }
        }
        @media (max-width:580px){
            .image img{
                width: 350px;
            }
        }

    </style>
</head>
<%@include  file="nav.jsp" %>
<body>
    <div class="container">
        <div class="sub_container1">
            <h1>Exclusive Deals</h1>
        </div>
        <div class="sub_container2">
            <div class="paragrapph">
            <h4>Bigger Bites, Better Prices at Moonbeams!</h4>
            <p>Why settle for less when you can enjoy more? 
                Our food deals offer generous portions of your 
                favorite snacks at unbeatable prices, so you can
                savor every moment at Moonbeams Cinemas.</p>
            </div>
            <div class="image">
                <img src="resources/IMG/DealsImg.png" alt="">
            </div>
        </div>
        <div class="sub_container3">
            <p>Enjoy a 10% discount on all Food & Beverages exclusively at Moonbeams Cinemas</p>
        </div>
    </div>
</body>
<%@include  file="footer.jsp" %>
</html>
