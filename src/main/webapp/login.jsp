
<%@page contentType="text/html" pageEncoding="UTF-8"%>

                
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <title>Document</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins');
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
            width: 100%;
            max-width: 1000px;
            padding-right: 250px;
            padding-left: 250px;
            margin-top: 50px;
        }
        h1{
            font-size: 28px;
        }
        .form-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-grow: 1;
            width: 100%;
        }
        .form{
            text-align: left;
            margin-top: 70px;
        }
        input{
            height: 50px;
            width: 450px;
            font-size: 18px;
            background-color: #252525;
            border: none;
            padding: 10px;
            color: white;
            margin-top: 5px;
            margin-bottom: 15px;
        }
        button{
            width: 450px;
            height: 50px;
            font-size: 18px;
            border: none;
            margin-top: 15px;
            margin-right: 15px;
        }
        .login {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            background-color: #261CBA;
            color: white;
        }
        .login:hover {
            background-color: #3025cf;
        }
        .login:active {
            background-color: #3025cf;
            transform: translateY(4px);
        }
        .google:hover {
            background-color: #d3d3d3;
        }
        .google:active {
            background-color: #d3d3d3;
            transform: translateY(4px);
        }
        .login .text {
            margin-right: auto;
            margin-left: 40px;
        }
        p{
            text-align: left;
            margin-top: 10px;
            margin-left: 5px;
        }
        i{
            margin-left: 10px;
            font-size: 7px;
        }
        img{
            margin-right: 30px;
            width: 30px;
            height: 30px;
            margin-top: 8px;
        }
        .google {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #fff;
            color: black;
        }
        .google img {
            margin-left:40px;
            margin-bottom: 8px;
        }
        .google .text {
            flex: 1;
            text-align: left;
        }
        a{
            color: #fff;
        }
        a:hover {
            color: #ccc;
        }
        @media(max-width:1080px){
            .container{
                padding-right: 150px;
                padding-left: 150px;
                margin-top: 30px;
            }
            .form{
                margin-top: 30px;
            }
            .input{
                margin-top: 15px;
            }
        }
        @media(max-width:750px){
            body{
                text-align: center;
            }
            h1{
                font-size: 25px;
            }
            .container{
                padding-right: 50px;
                padding-left: 50px;
                margin-top: 20px;
            }
            .form{
                margin-top: 50px;
            }
            input{
                height: 40px;
                width: 360px;
                font-size: 15px;
            }
            button{
                width: 360px;
                height: 40px;
                font-size: 13px;
            }
            .title{
                margin-top: 100px;
            }
            img{
                width: 20px;
                height: 20px;
                margin-top: 8px;
            }
        }
        @media(max-width:550px){
            .container{
                padding-right: 10px;
                padding-left: 10px;
                margin-top: 20px;
            }
            .label{
                font-size: 13px;
            }
        }
        @media(max-width:400px){
            input{
                height: 30px;
                width: 270px;
                font-size: 13px;
            }
            button{
                width: 270px;
                height: 30px;
                font-size: 13px;
            }
            p{
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">
            <h1>LOGIN</h1>
        </div>
    </div>
    <div class="form-wrapper">
        <div class="form">
                <label class="label">Email Address</label><br>
                <input type="email" placeholder="Enter Email Address" id="email"><i class="fa-solid fa-circle" style="color: #261cba;"></i><br>
                <label class="label">Password</label><br>
                <input type="password" placeholder="Enter Password" id="password"><i class="fa-solid fa-circle" style="color: #261cba;"></i><br>
                <p style="text-align: right; margin-right: 20px;"><a href="">Forgot Password?</a></p>
                <button class="login" onclick="login()"><span class="text">LOGIN</span></button><br>
                <button class="google" onclick="window.location.href = '/CinemaHall/google_oauth';"><img src="resources/IMG/google.png" alt=""><span class="text">Continue With Google</span></button>
                <p>Don't Have An Account?<a href="#">CREATE NEW</a></p>
           
        </div>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="resources/JS/login.js"></script>
</body>
</html>

