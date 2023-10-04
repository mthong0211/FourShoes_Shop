<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
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
        input[type="text"],
        input[type="password"] {
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
        <h1>Change Password for ${param.email}</h1>
        <form action="change-password" method="post">
            Email:<br> <input type="text" name="email" readonly value="${param.email}"><br>
            New password:<br> <input type="password" name="password"><br>
            Confirm new password:<br> <input type="password" name="repassword"><br>
            <input type="submit" value="Change">
        </form>
    </div>
</body>
</html>
