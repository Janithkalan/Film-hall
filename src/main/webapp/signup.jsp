<%-- 
    Document   : sign-up
    Created on : Nov 12, 2024, 3:02:11 PM
    Author     : Dilum
--%>

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
        .input{
            margin-top: 20px;
        }
        input{
            height: 50px;
            width: 450px;
            font-size: 18px;
            background-color: #252525;
            border: none;
            padding: 10px;
            color: white;
        }
        .input_btn{
            margin-top: 40px;
            margin-right: 20px;
        }
        button{
            width: 450px;
            height: 50px;
            background-color: #261CBA;
            color: white;
            font-size: 18px;
            border: none;
        }
        button:hover {
            background-color: #3025cf;
        }
        button:active {
            background-color: #3025cf;
            transform: translateY(4px);
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
        .label{
            margin-bottom: 10px;
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
                margin-top: 20px;
            }
            .input{
                margin-top: 10px;
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
            .label{
                font-size: 13px;
            }
        }
        @media(max-width:550px){
            .container{
                padding-right: 10px;
                padding-left: 10px;
                margin-top: 20px;
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
            <h1>SIGNUP</h1>
        </div>
    </div>
    <div class="form-wrapper">
        <div class="form">
            <div class="input">
                <label class="label">First Name</label><br>
                <input type="text" placeholder="Enter First Name" id="firstname">
                <i class="fa-solid fa-circle" style="color: #261cba;"></i>
            </div>
            <div class="input">
                <label class="label">Last Name</label><br>
                <input type="text" placeholder="Enter Last Name" id="lastname">
                <i class="fa-solid fa-circle" style="color: #261cba;"></i>
            </div>
            <div class="input">
                <label class="label">Email</label><br>
                <input type="email" placeholder="Enter Email Address" id="email">
                <i class="fa-solid fa-circle" style="color: #261cba;"></i>
            </div>
            <div class="input">
                <label class="label">Date Of Birth</label><br>
                <input type="date" placeholder="Enter Date Of Birth" id="dob">
                <i class="fa-solid fa-circle" style="color: #261cba;"></i>
            </div>
            <div class="input">
                <label class="label">NIC</label><br>
                <input type="text" placeholder="Enter NIC" id="nic">
                <i class="fa-solid fa-circle" style="color: #261cba;"></i>
            </div>
            <div class="input">
                <label class="label">Mobile Number</label><br>
                <input type="text" placeholder="Enter Mobile Number" id="mobile">
                <i class="fa-solid fa-circle" style="color: #261cba;"></i>
            </div>
            <div class="input">
                <label class="label">Password</label><br>
                <input type="password" placeholder="Enter Password" id="password">
                <i class="fa-solid fa-circle" style="color: #261cba;"></i>
            </div>
            <div class="input">
                <label class="label">Confirm Password</label><br>
                <input type="password" placeholder="Confirm Password" id="conf_password">
                <i class="fa-solid fa-circle" style="color: #261cba;"></i>
            </div>
            <div class="input_btn">
                <button onclick="createAccount()">LOGIN</button>
            </div>
            <p>Already have an account? <a href="#">LOGIN</a></p>
       
        </div>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="resources/JS/signup.js"></script>
</body>
</html>

