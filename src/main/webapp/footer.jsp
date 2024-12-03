<%-- 
    Document   : footer
    Created on : Dec 4, 2024, 3:57:56 AM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="resources/CSS/footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap');
        </style>
        <title>Footer</title>
    </head>
    <body>
        <div class="Background"></div>
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #0D0D0D;
            }

        </style>


        <footer>

            <div class="newsletter-box">
                <div class="newsletter-input">
                    <div class="newsletter"><p style="cursor: pointer;">Subscribe For Newsletter</p></div>
                    <input type="email" placeholder="ENTER YOUR EMAIL">
                    <button>SUBSCRIBE</button>
                </div>
            </div>
        </div>
        <div class="footer-container">
            <div class="footer-links">
                <ul>
                    <li><a href="index.jsp">HOME</a></li>
                    <li><a href="#nav_moives_id">MOVIES</a></li>
                    <li><a href="deals.jsp">EXCLUSIVE DEALS</a></li>
                    <li><a href="#">ABOUT US</a></li>
                    <li><a href="contact.jsp">CONTACT US</a></li>
                </ul>
            </div>
            <div class="footer-policies">
                <a href="privacy_policy.jsp">PRIVACY POLICY</a>
                <a href="terms_and_conditions.jsp">TERMS & CONDITIONS</a>
                <a href="terms_of_use.jsp">TERMS OF USE</a>
            </div>
            <div class="social-icons">
                <a href="#"><i class="fa-brands fa-square-facebook" style="color: #ffffff;"></i></a>
                <a href="#"><i class="fa-brands fa-instagram" style="color: #ffffff;"></i></a>
                <a href="#"><i class="fa-brands fa-x-twitter" style="color: #ffffff;"></i></a>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2024 Moonbeam Ltd. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>