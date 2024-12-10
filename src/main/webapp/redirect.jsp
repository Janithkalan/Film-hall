
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    User_DTO normal_user1 = (User_DTO) request.getSession().getAttribute("user");
    GoogleUser_DTO google_user1 = (GoogleUser_DTO) request.getSession().getAttribute("google_user");

    if (normal_user1 == null && google_user1 == null) {

%> 
<html>
    <head>
        <title>Error</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <style>
            body {
                background-color: black !important;
                font-family: 'Poppins', sans-serif;
            }
        </style>
    </head>
    <body>
        <script>

            swal("", "You need to login first", "error").then(() => {
                window.location = "index.jsp";
            });

        </script>

    </body>
</html>


<%} else {
%> 
//code
<%    }


%>

