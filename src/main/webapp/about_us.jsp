<%-- 
    Document   : about_us
    Created on : Dec 11, 2024, 8:33:02 AM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About us</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins');

        * {
            margin: 0;
            padding: 0;
            font-family: 'Poppins';
        }

        body {
            box-sizing: border-box;
            background-color: #1E1E1E;
            color: white;
        }

        .container {
            padding-left: 13%;
            padding-right: 13%;
        }

        .sub_container_1 {
            text-align: left;
        }

        .sub_container_1 h1 {
            font-weight: 300;
            margin-top: 15px;
        }

        .sub_container_2 {
            text-align: center;
            padding-left: 9%;
            padding-right: 9%;
            margin-top: 70px;
        }

        .sub_container_2 h1 {
            font-weight: 300;
            margin-bottom: 40px;
        }

        .sub_container_2 img {
            max-width: 100%;
            height: auto;
            margin-top: 40px;
        }

        .container hr {
            margin-top: 40px;
        }

        .sub_container_3 {
            display: flex;
            justify-content: center;
            column-gap: 70px;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        .sub_container_3 h1 {
            font-weight: 200;
            margin-bottom: 15px;
            margin-top: 10px;
        }

        .vision,
        .mission {
            max-width: 500px;
            flex: 1;
            min-width: 300px;
        }

        .vision p,
        .mission p {
            text-align: justify;
        }

        @media (max-width:1450px) {
            .container {
                padding-left: 10%;
                padding-right: 10%;
            }

            .sub_container_2 {
                text-align: center;
                padding-left: 2%;
                padding-right: 2%;
            }
        }

        @media (max-width:900px) {
            .container {
                padding-left: 5%;
                padding-right: 5%;
            }

            .sub_container_2 {
                margin-top: 40px;
            }

            .sub_container_2 h1 {
                margin-bottom: 20px;
            }
        }

        @media (max-width:750px) {
            .sub_container_3 {
                flex-wrap: wrap;
                text-align: center;
            }

            .sub_container_3 p {
                text-align: center;
            }

            .container h1 {
                font-size: 24px;
            }

            .container p {
                font-size: 13px;
            }
        }

        @media (max-width:500px) {
            .sub_container_1 {
                text-align: center;
            }
            .container h1{
                font-size: 20px;
            }
        }
    </style>
</head>

<body>
    <%@include  file="nav.jsp" %>
    <div class="container">
        <div class="sub_container_1">
            <h1>ABOUT US</h1>
        </div>
        <div class="sub_container_2">
            <h1>ABOUT MOONBEAMS CINEMAS</h1>
            <p>Welcome to Moonbeams Cinemas, where every visit feels like a cinematic escape under the stars. We're
                dedicated to
                creating a magical movie-going experience, blending the latest in film technology with the warmth and
                charm of a classic
                theater. At Moonbeams, we're passionate about showcasing a diverse selection of films, from timeless
                classics to the latest
                blockbusters, all in a cozy, inviting atmosphere. Join us for an unforgettable experience where stories
                come alive, and memories
                are made under the glow of the big screen.</p>
            <img src="resources/IMG/aboutus.png" alt="">
        </div>
        <hr>
        <div class="sub_container_3">
            <div class="vision">
                <h1>VISION</h1>
                <P>To be the most cherished cinema destination, where
                    every film lover can experience the magic of storytelling
                    in an inspiring, welcoming space that celebrates creativity,
                    diversity, and community.</P>
            </div>
            <div class="mission">
                <h1>MISSION</h1>
                <p>At Moonbeams Cinemas, our mission is to create memorable
                    cinematic experiences by combining state-of-the-art
                    technology with exceptional service. We strive to bring
                    communities together through a thoughtfully curated
                    selection of films, fostering an inclusive environment that
                    ignites imagination, and celebrates the art of cinema.</p>
            </div>
        </div>
    </div>
</body>
<%@include  file="footer.jsp" %>
</html>
