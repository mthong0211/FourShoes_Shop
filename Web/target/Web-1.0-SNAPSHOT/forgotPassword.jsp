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
            h1 {
                font-size: 36px;
                margin-bottom: 20px;
            }
            input[type="email"] {
                display: block;
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
            }
            input[type="submit"] {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Reset password!</h1>
            <form action="forgot-password" method="POST">
                <input type="email" name="email" placeholder="Enter your email"><br>
                <input type="submit" value="Reset your password">
            </form>
            <p>${mess}</p>
        </div>
    </body>
</html>
