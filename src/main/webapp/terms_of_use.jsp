<%-- 
    Document   : terms_of_user
    Created on : Dec 4, 2024, 4:39:25 AM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms of Use</title>
    <style>
        * {
            
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #0D0D0D; 
            color: #ffffff; 
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .terms-container {
            padding: 3% 80px;
            border-radius: 10px;
        }

        .terms-header {
            font-size: 24px;
            font-weight: 600; 
            color: #ffffff;
            margin-top: 25px;
            margin-bottom: 25px;
        }

        .terms-paragraph {
            font-size: 20px;
        }

        .terms-list {
            list-style-type: disc; 
            padding-left: 20px;
            font-size: 20px;
            line-height: 1.6;
            color: #ffffff;
            margin-bottom: 15px;
        }

        .terms-list-item {
            margin-bottom: 5px;
        }

        .terms-section {
            margin-bottom: 20px;
        }
    </style>
</head>
<%@include  file="nav.jsp" %>
<body>
    <div class="terms-container">
        <section class="terms-section">
            <p class="terms-paragraph">By accessing and using our website, you agree to comply with the following terms of use. Please read these terms carefully, as they govern your interaction with our website and services.</p>
        </section>

        <h2 class="terms-header">Acceptance of Terms</h2>
        <ul class="terms-list">
            <li class="terms-list-item">By using this website, you acknowledge that you have read, understood, and agree to these Terms of Use. If you do not agree with any of these terms, please refrain from using our website.</li>
        </ul>

        <h2 class="terms-header">Use of Website Content</h2>
        <ul class="terms-list">
            <li class="terms-list-item">All content on this website, including text, images, logos, and graphics, is the property of Moonbeams Cinemas and protected by copyright and trademark laws. Any unauthorized use may violate these protections and result in legal action.</li>
            <li class="terms-list-item">The website is intended for personal, non-commercial use only. Unauthorized commercial use is strictly prohibited.</li>
        </ul>

        <h2 class="terms-header">User Conduct</h2>
        <ul class="terms-list">
            <li class="terms-list-item">Users agree to use the website responsibly, in compliance with all applicable laws, and refrain from any behavior that may interfere with the website’s operation or be offensive to other users.</li>
            <li class="terms-list-item">Users may not upload, post, or transmit any content that is obscene, defamatory, unlawful, or that infringes on the rights of others.</li>
        </ul>

        <h2 class="terms-header">Ticket Purchases and Transactions</h2>
        <ul class="terms-list">
            <li class="terms-list-item">All transactions conducted through our website are subject to our ticketing policies, which include rules on refunds, exchanges, and age restrictions.</li>
            <li class="terms-list-item">Moonbeams Cinemas is not liable for delays in processing transactions due to network errors, system maintenance, or third-party service providers.</li>
        </ul>

        <h2 class="terms-header">Governing Law</h2>
        <ul class="terms-list">
            <li class="terms-list-item">These Terms of Use are governed by the laws of Sri Lanka, and any disputes will be resolved in the courts of Colombo.</li>
        </ul>

        <h2 class="terms-header">Contact Us</h2>
        <ul class="terms-list">
            <li class="terms-list-item">If you have questions or concerns about our privacy practices, please contact us through our website. Thank you for trusting Moonbeams Cinemas with your information. We're committed to safeguarding your privacy and enhancing your movie-going experience.</li>
        </ul>
    </div>
</body>
<%@include  file="footer.jsp" %>
</html>
