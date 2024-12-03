<%-- 
    Document   : terms_and_conditions
    Created on : Dec 4, 2024, 4:39:06 AM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms & Conditions</title>
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
            <p class="terms-paragraph">Welcome to Moonbeams Cinemas! By purchasing tickets or attending our screenings, you agree to the following terms and conditions:</p>
        </section>
        <section class="terms-section">
            <h2 class="terms-header">Ticket Purchases</h2>
            <ul class="terms-list">
                <li class="terms-list-item">All ticket sales are final. Tickets are non-refundable and non-exchangeable unless otherwise stated.</li>
                <li class="terms-list-item">Please ensure you purchase tickets for the correct date and time as changes cannot be made after purchase.</li>
            </ul>
        </section>
        
        <section class="terms-section">
            <h2 class="terms-header">Admission and Age Restrictions</h2>
            <ul class="terms-list">
                <li class="terms-list-item">Valid ID may be required for age-restricted films. Entry will be denied without a valid ID for restricted films.</li>
                <li class="terms-list-item">Children under 12 must be accompanied by an adult at all times.</li>
            </ul>
        </section>
        
        <section class="terms-section">
            <h2 class="terms-header">Behavior and Conduct</h2>
            <ul class="terms-list">
                <li class="terms-list-item">Please respect other patrons by refraining from talking, using mobile devices, or causing disruptions during screenings.</li>
                <li class="terms-list-item">Moonbeams Cinemas reserves the right to ask disruptive guests to leave without a refund.</li>
            </ul>
        </section>
        
        <section class="terms-section">
            <h2 class="terms-header">Food and Beverages</h2>
            <ul class="terms-list">
                <li class="terms-list-item">Outside food and drinks are not permitted inside the cinema. Concessions are available on-site for purchase.</li>
                <li class="terms-list-item">Alcoholic beverages will be served only to patrons of legal drinking age and must be consumed responsibly.</li>
            </ul>
        </section>
        
        <section class="terms-section">
            <h2 class="terms-header">Health and Safety</h2>
            <ul class="terms-list">
                <li class="terms-list-item">For your safety and comfort, please follow any health and safety guidelines displayed in the cinema.</li>
                <li class="terms-list-item">In case of an emergency, please follow the instructions provided by cinema staff to exit designated exits safely.</li>
            </ul>
        </section>
        
        <section class="terms-section">
            <h2 class="terms-header">Privacy Policy</h2>
            <ul class="terms-list">
                <li class="terms-list-item">Your privacy is important to us. Personal information collected during ticket purchases on our website will be used solely for screening and marketing purposes and will not be shared without consent.</li>
            </ul>
        </section>
        
        <section class="terms-section">
            <h2 class="terms-header">Changes and Cancellations</h2>
            <ul class="terms-list">
                <li class="terms-list-item">Moonbeams Cinemas reserves the right to change showtimes, cancel screenings, or make adjustments to programming as necessary.</li>
                <li class="terms-list-item">In the event of a canceled screening, affected ticket holders will be notified and provided with an exchange or refund option.</li>
            </ul>
        </section>
        
        <section class="terms-section">
            <h2 class="terms-header">Liability</h2>
            <ul class="terms-list">
                <li class="terms-list-item">Moonbeams Cinemas is not responsible for lost, stolen, or damaged personal items. Please keep your belongings secure at all times.</li>
            </ul>
        </section>
    </div>
</body>
<%@include  file="footer.jsp" %>
</html>
