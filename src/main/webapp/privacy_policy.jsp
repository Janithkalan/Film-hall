<%-- 
    Document   : privacy_policy
    Created on : Dec 4, 2024, 4:38:47 AM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Privacy Policy - Moonbeams Cinemas</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600&display=swap" rel="stylesheet">
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
            padding: 20px;
        }

        .privacy-container {
            padding: 3% 80px;
            border-radius: 10px;
        }

        .privacy-header {
            font-size: 24px;
            font-weight: 600; 
            color: #ffffff;
            margin-top: 25px;
            margin-bottom: 25px;
        }

        .privacy-paragraph {
            font-size: 20px;
        }

        .privacy-list {
            list-style-type: disc; 
            padding-left: 20px;
            font-size: 20px;
            line-height: 1.6;
            color: #ffffff;
            margin-bottom: 15px;
        }

        .privacy-list-item {
            margin-bottom: 5px;
        }

        .privacy-section {
            margin-bottom: 20px;
        }
    </style>
</head>
<%@include  file="nav.jsp" %>
<body>
    <div class="privacy-container">
        <section class="privacy-section">
            <h2>Privacy Policy</h2>
            <p class="privacy-paragraph">At Moonbeams Cinemas, we are committed to protecting your privacy and ensuring the security of your personal information. This policy outlines how we collect, use, and protect your data when you interact with our website.</p>
        </section>
        
        <section class="privacy-section">
            <h2 class="privacy-header">Information We Collect</h2>
            <ul class="privacy-list">
                <li class="privacy-list-item"><strong>Personal Information:</strong> When you book tickets, sign up for newsletters, or contact us through the website, we may collect personal information such as your name, email address, phone number, and payment information.</li>
                <li class="privacy-list-item"><strong>Non-Personal Information:</strong> We collect data on website usage (e.g., pages visited, time spent) using cookies and analytics to improve the user experience. This information does not identify individual users.</li>
            </ul>
        </section>
        
        <section class="privacy-section">
            <h2 class="privacy-header">How We Use Your Information</h2>
            <ul class="privacy-list">
                <li class="privacy-list-item"><strong>Transaction Processing:</strong> Your information is used to complete transactions, process payments, and confirm ticket bookings.</li>
                <li class="privacy-list-item"><strong>Customer Support:</strong> We use contact information to respond to inquiries, provide customer support, and resolve any issues.</li>
                <li class="privacy-list-item"><strong>Marketing and Updates:</strong> If you opt in, we may send you promotional emails or newsletters with upcoming movie schedules, special events, and offers. You can unsubscribe at any time.</li>
            </ul>
        </section>
        
        <section class="privacy-section">
            <h2 class="privacy-header">Sharing Your Information</h2>
            <ul class="privacy-list">
                <li class="privacy-list-item">We do not sell, rent, or share your personal information with third parties, except as required by law or as necessary to process payments.</li>
                <li class="privacy-list-item">We may share information with trusted service providers for payment processing, email distribution, and customer service. These providers are required to maintain your data's confidentiality and security.</li>
            </ul>
        </section>
        
        <section class="privacy-section">
            <h2 class="privacy-header">Cookies and Tracking Technologies</h2>
            <ul class="privacy-list">
                <li class="privacy-list-item">Our website uses cookies to enhance your experience, remember preferences, and analyze site traffic. You can adjust your browser settings to decline cookies; however, this may affect some website functionalities.</li>
            </ul>
        </section>
        
        <section class="privacy-section">
            <h2 class="privacy-header">Third-Party Links</h2>
            <ul class="privacy-list">
                <li class="privacy-list-item">Our website may contain links to third-party websites. We are not responsible for the privacy practices or content of these websites. Please review the privacy policies of any third-party sites you visit.</li>
            </ul>
        </section>
        
        <section class="privacy-section">
            <h2 class="privacy-header">Your Rights</h2>
            <ul class="privacy-list">
                <li class="privacy-list-item">You have the right to request access to your personal data, correct any inaccuracies, or request deletion where applicable. To exercise your rights, please contact us via our website.</li>
            </ul>
        </section>
        
        <section class="privacy-section">
            <h2 class="privacy-header">Data Security</h2>
            <ul class="privacy-list">
                <li class="privacy-list-item">We implement appropriate technical and organizational measures to protect your information from unauthorized access, alteration, or disclosure. Our secure servers and encrypted transactions safeguard sensitive information.</li>
            </ul>
        </section>
        
        <section class="privacy-section">
            <h2 class="privacy-header">Contact Us</h2>
            <ul class="privacy-list">
                <li class="privacy-list-item">If you have questions or concerns about our privacy practices, please contact us through our website. Thank you for trusting Moonbeams Cinemas with your information. We’re committed to safeguarding your privacy and enhancing your movie-going experience.</li>
            </ul>
        </section>
    </div>
</body>
<%@include  file="footer.jsp" %>
</html>


