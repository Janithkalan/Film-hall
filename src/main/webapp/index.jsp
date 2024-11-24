
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="resources/CSS/home.css">
    

    <style>
        .thumbnail{
            width: 280px;
            height: 415px;
        }
        
    </style>

</head>

<%@include  file="nav.jsp" %>

<body onload="load_movies()">
    <div class="slider">
        <div class="more">
            <p id="text"></p>
            <a id="sliderPage" href="#" target="_self"><span id="buy"><img src="resources/IMG/ticket.png" alt="">BUY TICKETS ONLINE</span></a>
            <a id="sliderLink" href="#" target="_blank"><span id="watch"><img src="resources/IMG/Start.png" alt="">WATCH TRAILER</span></a>
        </div>
        <div class="slides">
            <img class="slide"  id="f" src="resources/IMG/1.png" alt="img_1">
                <img class="slide"  id="f" src="resources/IMG/2.jpg" alt="img_2">
                <img class="slide"  id="f" src="resources/IMG/3.png" alt="img_3">
         </div>
        <button class="prev" onclick="prevSlide()">&#10094</button>
        <button class="next" onclick="nextSlide()">&#10095</button>
    </div>
    <div><h1>NOW SHOWING</h1></div>
    <div class="nowShow" id="div1">
        <div class="hov" id="div2">
            <a href="#" id="href1">
            <img class="thumbnail" src="" alt="VENOM: THE LAST DANCE" id="img1"></a>
            <div class="big" id="div3"><span class="span1">VENOM: THE LAST DANCE</span>
                <div class="small" id="div4">NOW SCREENING</div>
            </div>
        </div>
    </div>
    <div style="background-color: #0D0D0D;">
        <div>
            <h1>COMING SOON</h1>
        </div>
        <div class="comingSoon" id="updiv1">
            <div class="hov" id="updiv2">
                <a href="#">
                <img class="thumbnail" src="" alt="RED ONE"></a>
                <div class="big"><span class="upspan1">RED ONE</span>
                    <div class="small">IN CINEMAS 8TH NOVEMBER</div>
                </div>
            </div>   
        </div>
    </div>
    <script src="resources/JS/home.js"></script>
    
</body>
</html>
