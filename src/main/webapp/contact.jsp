<%-- 
    Document   : contact
    Created on : Nov 13, 2024, 12:34:41 PM
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
        .sub_container{
            margin-left: 50px;
            margin-top: 50px;
        }
        .sub_container p{
            width: 1000px;
            font-size: 19px;
        }
        .sub_container2{
            margin-top: 50px;
            display: flex;
            justify-content: space-between;
            padding-left: 300px;
            padding-right: 300px;
            column-gap: 30px;
            margin-bottom: 30px;
        }
        input{
            width: 500px;
            height: 50px;
            font-size: 18px;
            padding-left: 10px;
            margin-top: 10px;
            background-color: #252525;
            border: none;
            color: white;
        }
        textarea{
            width: 500px;
            height: 180px;
            padding-left: 10px;
            font-size: 18px;
            margin-top: 10px;
            padding-top: 10px;
            background-color: #252525;
            border: none;
            color: white;
        }
        .input{
            margin-top: 20px;
        }
        .submit{
            color: white;
            background-color: #261CBA;
            border: none;
        }
        .submit:hover{
            background-color: #3b30cc;
        }
        .submit:active{
            background-color: #3b30cc;
            transform: translateY(4px);
        }
        .details{
            background-color: #252525;
            width: 500px;
        }
        .detail{
            display: flex;
            margin-bottom: 10px;
        }
        .detail p{
            margin-left: 20px;
        }
        .cinema_contact_details{
            padding-left: 30px;
            padding-top: 30px;
            padding-bottom: 15px;
        }
        .cinema_contact_details h1{
            font-size: 24px;
            margin-bottom: 30px;
        }
        hr {
            margin-top: 20px;
            height: 3px;
            background-color: #0D0D0D;
            border: none;
        }
        .help_desk{
            padding-left: 30px;
            padding-top: 30px;
            padding-bottom: 15px;
        }
        .help_desk h1{
            font-size: 24px;
            margin-bottom: 30px;
        }
        .complaints{
            padding-left: 30px;
            padding-top: 30px;
        }
        .complaints h1{
            font-size: 24px;
            margin-bottom: 30px;
        }
        @media(max-width:1650px){
            .sub_container2{
                margin-top: 50px;
                padding-left: 150px;
                padding-right: 150px;
                column-gap: 30px;
            }
            .container{
                padding-right: 130px;
                padding-left: 130px;
            }
            .sub_container{
                margin-left: 20px;
            }
        }
        @media(max-width:1340px){
            .sub_container2{
                margin-top: 30px;
                padding-left: 50px;
                padding-right: 50px;
                column-gap: 30px;
            }
            .container{
                padding-right: 30px;
                padding-left: 30px;
                margin-top: 40px;
            }
        }
        @media(max-width:1140px){
            .sub_container2{
                flex-wrap: wrap;
                justify-content: center;
            }
            .details{
                margin-top: 70px;
            }
            .sub_container p{
                width: 100%;
                font-size: 16px;
                text-align: center;
                margin: 0 auto;
            }
            .sub_container{
                text-align: center;
                margin-left: 0px;
            }
            .sub_container2{
                column-gap: 30px;
            }
            .container{
                margin-top: 40px;
                text-align: center;
                padding-right: 20px;
                padding-left: 20px;
            }
            @media(max-width:700px){
                input{
                    width: 400px;
                    height: 40px;
                    font-size: 16px;
                }
                .label{
                    font-size: 16px;
                }
                textarea{
                    width: 400px;
                    height: 144px;
                }
                .details{
                    width: 400px;
                }
                .sub_container2 p{
                    font-size: 13px;
                }
                .details p{
                    margin-top: 5px;
                }
            }
            @media(max-width:500px){
                input{
                    width: 400px;
                    height: 40px;
                }
                textarea{
                    width: 400px;
                    height: 144px;
                }
                .sub_container p{
                    width: 100%;
                    font-size: 13px;
                    text-align: center;
                    margin: 0 auto;
                }
                h1{
                    font-size: 20px;
                }
                .sub_container2 h1{
                    font-size: 20px;
                }
                .sub_container2 p{
                    font-size: 12px;
                }
                .cinema_contact_details{
                    padding-left: 20px;
                }
                .help_desk{
                    padding-left: 20px;
                }
                .complaints{
                    padding-left: 20px;
                }
                .cinema_contact_details h1{
                    margin-bottom: 20px;
                }
                .help_desk h1{
                    margin-bottom: 20px;
                }
                .complaints h1{
                    margin-bottom: 20px;
                }
            }
            @media(max-width:450px){
                input{
                    width: 300px;
                    height: 30px;
                }
                textarea{
                    width: 300px;
                    height: 110px;
                }
                .details{
                    width: 300px;
                }
                .sub_container2 h1{
                    font-size: 18px;
                }
                .help_desk .email{
                    font-size: 10px;
                }
                .sub_container2 p{
                    margin-left: 10px;
                }
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>CONTACT US</h1>
        <div class="sub_container"> 
            <p>We’d love to connect with you! Whether you have questions, feedback, or need assistance 
                with bookings,our team at Moonbeams Cinemas is here to help. Reach out and let us make
                your experience truly special.</p>
        </div>
    </div>
    <div class="sub_container2">
        <div class="form" id="contact_form">
            <div class="input">
                <label for="name" class="label">Name</label><br>
                <input type="text" name="name" id="name" placeholder="Enter your name"><br>
            </div>
            <div class="input">
                <label for="email" class="label">Email</label><br>
                <input type="email" name="email" id="email" placeholder="Ex: youremail@email.com"><br>
            </div>
            <div class="input">
                <label for="number" class="label">Mobile Number</label><br>
                <input type="text" name="number" id="mobile" placeholder="Enter your mobile number"><br>
            </div>
            <div class="input">
                <label for="message" class="label">Message</label><br>
                <textarea name="message" id="message" placeholder="Message"></textarea>
            </div>
            <input type="submit" class="submit" placeholder="SUBMIT" onclick="submit()">
        </div>
        <div class="details">
            <div class="cinema_contact_details">
                <h1>CINEMA CONTACT DETAILS</h1>
                <div class="detail">
                    <img src="Ringer Volume.png" alt=""><p>077 7777 777</p>
                </div>
                <div class="detail">
                    <img src="Ringer Volume.png" alt=""><p>077 7777 777</p>
                </div>
            </div>
            <hr>
            <div class="help_desk">
                <h1>HELP DESK</h1>
                <div class="detail">
                    <img src="Ringer Volume.png" alt=""><p>077 7777 777</p>
                </div>
                <div class="detail">
                    <img src="Ringer Volume.png" alt=""><p>077 7777 777</p>
                </div>
                <div class="detail">
                    <img src="Letter.png" alt="" style="margin-left: 4px;"><p class="email">helpdeskmoonbeanscinemas@gmail.com</p>
                </div>
            </div>
            <hr>
            <div class="complaints">
                <h1>COMPLAINTS</h1>
                <div class="detail">
                    <img src="Ringer Volume.png" alt=""><p>077 7777 777</p>
                </div>
                <div class="detail">
                    <img src="Ringer Volume.png" alt=""><p>077 7777 777</p>
                </div>
            </div>
        </div>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="resources/JS/contact.js"></script>
</body>
</html>

