<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 500px;
                margin: 0 auto;
                text-align: center;
                padding: 50px 0;
            }
            h1, h2 {
                font-size: 32px;
                margin-bottom: 20px;
                color: #45a049;
            }
            a {
                display: inline-block;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;
            }
            a:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <a href="home">Home</a>
            <h1>We just sent a link to your email</h1><br>
            <h2>Please check your email!</h2>

        </div>
    </body>
</html>
