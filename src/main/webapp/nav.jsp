<%-- 
    Document   : nav
    Created on : Nov 14, 2024, 1:02:37 PM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Navbar</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/CSS/search.css"/>
    <style>
        body{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            background-color: black;

        }
        li , a ,button,input{
            font-size: 16px;
            font-weight: 500;
            color: white;
            text-decoration: none;
        }
        header{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 5%;
            position: relative;
        }
        .logo{
            cursor: pointer;
        }
        .logo img{
            width: 50px;
            height: 50px;
        }
        .nav__links{
            list-style: none;
            display: flex;
            align-items: center;
            z-index: 3;
        }
        .nav__links li{
            display: inline-block;
            margin-right: 20px;
        }
        .nav__links li a{
            transition: all 0.3s ease 0s;
        }
        .nav__links li a:hover{
            color: #1e8dc0;
        }
        .buttons button{
            padding: 9px ;
            background-color: #1e8dc0;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease 0s;
        }
        .buttons button:hover{
            background-color: #12597a;
        }
        input{
            background-color: #252525;
            color: rgb(255, 255, 255);
            border: none;
            padding: 8px;
            margin-left: 10px;
        }
        .login{
            margin-left: 50px;
        }
        .menu-icon {
            display: none;
            cursor: pointer;
            font-size: 24px;
        }
        .buttons{
            display: flex;
            margin-left: 200px;
            align-items: center;
        }
        hr {
            margin-left: 8%;
            margin-right: 8%;
            border: 1px solid white;
        }
        @media (max-width: 1500px){
            li , a ,button,input{
                font-size: 13px;
                font-weight: 300;
            }
            .buttons{
                margin-left: 100px;
            }
        }
        @media (max-width: 1300px){
            li , a ,button,input{
                font-size: 13px;
            }
            .buttons button{
                padding: 7px;
            }
            input{
                padding: 6px;
            }
            .login{
                margin-left: 30px;
            }
            .buttons{
                margin-left: 75px;
            }
        }
        @media (max-width: 1180px) {
            .nav__links {
                display: none;
                flex-direction: column;
                align-items: center;
                background-color: rgb(0, 0, 0);
                position: absolute;
                top: 70px;
                left: 0;
                width: 100%;
                animation: slideDown 0.5s forwards;
            }
            .nav__links li {
                display: block;
                margin: 10px 0;
            }
            .nav__links li a {
                padding: 10px 0;
                display: block;
            }
            .nav__links li a:hover{
                color: #1e8dc0;
            }
            .menu-icon {
                display: block;
                color: white;
            }
            .buttons {
                display: none;
            }
            .nav__links.active .buttons {
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
                width: 100%;
                margin-top: 10px;
                margin-left: 0px;
            }
            .buttons a {
                margin: 10px 0;
            }
            .logo img{
                width: 40px;
                height: 40px;
            }

            input{
                margin-left: 50px;
            }
            .dropdown-content{
                margin-left: 40px; 
            }
        }
        .nav__links.active {
            display: flex;
            margin: 0 !important;
            z-index: 3;
        }
        @keyframes slideDown {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <header>
        <a class="logo" href="/"><img src="logo.png" alt="logo"></a>
        <nav>
            <ul class="nav__links">
                <li><a href="index.jsp">HOME</a></li>
                <li><a href="#nav_movies_id">MOVIES</a></li>
                <li><a href="deals.jsp">EXCLUSIVE DEALS</a></li>
                <li><a href="contact.jsp">CONTACT US</a></li>
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
                <div class="buttons">
                    <a class="buy_tickets" href="#"><button>BUY TICKETS</button></a>
                    <a class="login" href="login.jsp">LOGIN</a>
                </div>
            </ul>
            <div class="menu-icon" id="menu-icon">☰</div>
        </nav>           
    </header>
    <hr>
    <script>
        const menuIcon = document.getElementById('menu-icon');
        const navLinks = document.querySelector('.nav__links');

        menuIcon.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });
    </script>
    <script src="resources/JS/search.js"></script>
</body>
</html>