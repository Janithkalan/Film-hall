<%-- 
    Document   : comming_soon
    Created on : Dec 9, 2024, 2:27:32 AM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comming Soon</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

        body {
            background-color: black !important;
            font-family: 'Poppins', sans-serif;
        }

        .im {
            position: relative;
            display: inline-block;
            width: 100%;
        }

        .im img {
            display: block;
            width: 100%;
            height: auto;
        }

        .im::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.655);
            pointer-events: none;
            z-index: 1;
        }


        .details {
            position: absolute;
            bottom: 6%;
            left: 2.5%;
            color: white;
            font-size: 2.5em;
            font-weight: 300;
            z-index: 2;
        }

        .details .small{
            font-size: 0.47em;
            font-weight: 600;
        }

        .imdb {
            display: flex;
            position: absolute;
            top: 5%;
            right: 2.5%;
            color: white;
            font-size: 0.9em;
            font-weight: 400;
            z-index: 2;
        }

        .imdb_text{
            margin-top: 3px;
        }

        .imdb img{
            width: 30px !important;
            padding-right: 5px;
        }

        .trailer{
            display: flex;
        }

        .trailer img{
            width: 40px !important;
            padding-right: 10px;
            margin-top: -6px;
        }


        .trail {
            color: white;
            font-size: 1em;
            font-weight: 500;
            text-decoration: none;
            position: absolute;
            bottom: 7.5%;
            right: 2.5%;
            display: inline-block;
            overflow: hidden;
            padding: 0.5rem 0.75rem;
            z-index: 2;
        }

        .trail span::before{
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            height: 0%;
            width: 2px;
            background-color: #ffffff;
            transition: height 0.5s ease-in-out;
        }

        .trail span::after{
            content: "";
            position: absolute;
            top: 0;
            right: 0;
            height: 0%;
            width: 2px;
            background-color: #ffffff;
            transition: height 0.5s ease-in-out;
        }

        .trail::before{
            content: "";
            position: absolute;
            left: 0;
            bottom: 0;
            height: 2px;
            width: 100%;
            background-color: #ffffff;
            transform: translateX(-105%);
            transition: transform 0.5s ease-in-out;
        }

        .trail::after{
            content: "";
            position: absolute;
            right: 0;
            top: 0;
            height: 2px;
            width: 100%;
            background-color: #ffffff;
            transform: translateX(105%);
            transition: transform 0.5s ease-in-out;
        }

        .trail:hover::after, .trail:hover::before {
            transform: translateX(0);
        }

        .trail:hover span::before, .trail:hover span::after{
            height: 100%;
        }
        .background{
            background-color: #0D0D0D;
        }

        .storyline{
            color: #ffffff;
            font-family: 'Poppins', sans-serif;
            padding: 80px 0px 20px 100px;
            width: 60%;

        }
        .s-title{
            font-weight: 300;
            font-size: 35px;
        }

        .Story-text{
            font-size: 19px;
            font-weight: 200;
            margin-bottom: 50px;
        }

        .comingsoon-btn{
            background-color: #261CBA;
            color: #ffffff;
            font-family: 'Poppins', sans-serif;
            font-weight: 200;
            font-size: 20px;
            border: none;
            padding: 12px 40px;
            margin-bottom: 60px;
        }
        @media(max-width:1024px){
            .storyline{
                padding: 80px 0px 20px 70px;
                width: 70%;

            }
            .s-title{
                font-weight: 300;
                font-size: 30px;
            }

            .Story-text{
                font-size: 16px;
                margin-bottom: 40px;
            }

            .comingsoon-btn{
                font-size: 17px;
                padding: 10px 35px;
            }
        }
        @media(max-width:778px){
            h1{
                font-size: 2rem !important;
            }


            .big{
                font-size: 25px;
            }

            .small{
                font-size: 12px !important;
            }
            .storyline{
                padding: 40px 0px 20px 60px;
                width: 70%;

            }
            .s-title{
                font-weight: 300;
                font-size: 25px;
            }

            .Story-text{
                font-size: 14px;
                margin-bottom: 40px;
            }

            .comingsoon-btn{
                font-size: 15px;
                padding: 10px 30px;
            }
        }
        @media(max-width:585px){


            .big{
                font-size: 20px;
            }

            .small{
                font-size: 10px !important;
            }

            .trail{
                font-size: 10px !important;
            }

            .trailer img{
                display:inline ;
                width: 25px !important;
                padding-right: 10px;
            }

            .imdb {
                font-size: 12px;
            }

            .imdb img{
                width: 30px !important;
            }
            .storyline{
                padding: 20px 0px 20px 30px;
                width: 80%;

            }
            .s-title{
                font-weight: 300;
                font-size: 20px;
            }

            .Story-text{
                font-size: 13px;
                margin-bottom: 40px;
            }

            .comingsoon-btn{
                font-size: 14px;
                padding: 10px 30px;
            }
        }

    </style>
</head>
<body>
<%@include  file="nav.jsp" %>
    <div class="im">
        <div class="details">
            <span class="big" id="movie_title">RED ONE</span>
            <div class="small" id="movie_description">(U) . 2h 03m . Friday, November8, 2024 . ENGLISH . ACTION<br>
                Dwayne Johnson, Chris Evans</div>
        </div>
        <span class="imdb">
            <img src="img/Imdb.png" alt="imdb">
            <span class="imdb_text">IMDb - <span id="movie_rating">7.9</span></span>
        </span>
        <a href="https://www.youtube.com/watch?v=U8XH3W0cMss&ab_channel=AmazonMGMStudios" target="_blank" id="movie_trailer" class="trail">
            <span class="trailer">
                <img src="img/show.png" alt="trailer">
                WACTH TRAILER </span></a>

        <img src="img/redone.png" alt="Venom: The Last Dance" id="movie_poster">
    </div>
    <div class="background">
        <div class="storyline">
            <h1 class="s-title">STORY LINE</h1>
            <P class="Story-text">After Santa Claus (code name: Red One) is kidnapped, the North Pole's Head of Security (Dwayne Johnson) must team up with the world's most infamous bounty hunter (Chris Evans) in a globe-trotting, action-packed mission to save Christmas.</P>
            <button class="comingsoon-btn">COMING SOON</button>
        </div>
    </div>
</body>
<%@include  file="footer.jsp" %>
</html>
