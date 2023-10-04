<%-- 
    Document   : login
    Created on : Jun 21, 2023, 9:13:07 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./public/css/bootstrap.min.css"/>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <title>JSP Page</title>
    </head>
    <style>
        body {
            background-image: url("https://www.nikeshoebot.com/wp-content/uploads/2019/05/Using-A-BotTo-Cop-Sneakers-1024x512.jpg");
            background-size: cover;
            background-position: center;
            width: 100%;
            margin: 0 auto;
            font-family: Arial, sans-serif;
        }
        .fr {
            margin-top: 10px;
            margin-bottom: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: white;
        }
        .form header{
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            font-weight: bold;
            font-size:20px;
        }

        .logo {
            font-size: 48px;
        }

        .button-group {
            display: flex;
        }

        .button-group button {
            border: none;
            background-color: transparent;
            color: #256eff;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 20px;
            cursor: pointer;
            margin-right: 20px;
            transition: color 0.3s ease-in-out;
        }

        .button-group button:hover {
            color: red
        }

        .button-group button.active {
            color: red;
        }

        .log {
            background-color: white;
            width: 50%;
            max-height: 700px;
            margin: 0 auto;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }

        .wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form {
            display: none;
        }

        .form.active {
            display: block;
        }


        .header {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }

        .form input[type="text"], .form input[type="password"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: none;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
        }

        .form input[type="submit"] {
            background-color: blue;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .form input[type="submit"]:hover {
            background-color: darkblue;
        }

        .form a {
            margin-left: 20px;
            color: blue;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s ease-in-out;
            margin-bottom: 10px;
        }

        .form a:hover {
            color: darkblue;
        }

        .checkbox {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .checkbox input[type="checkbox"] {
            margin-right: 10px;
            transform: scale(1.2);
            /* Đảm bảo icon checkbox không bị biến dạng */
            transform-origin: left center;
        }

        .checkbox label {
            color: blue;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s ease-in-out;
            margin-top:5px;
        }

        .checkbox label:hover {
            color: darkblue;
        }

        .Not-same {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .input-row1 .input1 {
            display: inline-block;
            justify-content: center;
            align-items: center;
            margin-left:50px;
            margin-bottom: 10px;
        }
        .footer{
            display:flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container p {
            text-align: center;
        }
        .dob{
            margin-left: 50px;
        }
        .label1{
            margin-bottom:18px;
        }
    </style>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body>
        <div class="fr">
            <div class="button-group">
                <button class="active" id="login-btn">Login</button>
                <button id="signup-btn">Register</button>
            </div>
        </div>
        <div class="log">
            <section class="wrapper">
                <div class="form login active">
                    <header>Login</header>
                    <form action="login" method="post" class="top">
                        <div class="input-row1">
                            <input class="input1" type="text" name="name" placeholder="Username" required>
                            <input class="input1" type="password" name="pass" placeholder="Password" required>
                            <div class="container">
                                <p class="text-danger">${mess}</p>
                            </div>
                            <div class="footer">
                                <input type="submit" value="Login">
                                <a href="forgot-password">Forgot password?</a>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="form signup">
                    <header>Sign Up</header>
                    <form action="signup" class="form1" method="post">
                        <div class="input-row1">
                            <input class="input1" type="text" name="username" placeholder="Username" required>
                            <input class="input1" type="text" name="email" placeholder="Email" required>
                            <input class="input1" type="password" name="password" placeholder="Password" required>
                            <input class="input1" type="password" name="RePassword" placeholder="Re-Password" required>
                            <input class="input1" type="text" name="name" placeholder="Name" required><br>
                            <div class="dob">
                                Birthday:
                                <input type="date" name="birthday" placeholder="Birthday" required>
                                <br><br> 
                            </div> 
                            <input class="input1" type="text" name="phone" placeholder="Phone" required>
                            <div class="container">
                            <p class="Not-same">${mes}</p>
                            </div>
                            <div class="checkbox">
                                <input class="input1" type="checkbox" id="signupCheck" name="btnCheck">
                                <label class="label1" for="signupCheck" onclick="window.location.href = 'dieukhoan';">I accept the publisher's terms and conditions.</label>
                                <span id="error-message" style="color: red;"></span>
                            </div>
                            <div class="footer">
                                <input  type="submit" value="Sign up">
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <script>
            function goBack() {
                window.location.href = "/index-control";
            }

            const loginBtn = document.getElementById("login-btn");
            const signupBtn = document.getElementById("signup-btn");
            const loginForm = document.querySelector(".form.login");
            const signupForm = document.querySelector(".form.signup");

            loginBtn.addEventListener("click", () => {
                loginForm.classList.add("active");
                signupForm.classList.remove("active");
                loginBtn.classList.add("active");
                signupBtn.classList.remove("active");
            });

            signupBtn.addEventListener("click", () => {
                signupForm.classList.add("active");
                loginForm.classList.remove("active");
                signupBtn.classList.add("active");
                loginBtn.classList.remove("active");
            });

        </script>
    </body>
</html>
