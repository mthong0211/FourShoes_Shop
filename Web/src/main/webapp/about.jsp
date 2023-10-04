<%-- 
    Document   : about
    Created on : Jul 17, 2023, 11:16:56 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        *{
            padding:0;
            margin:0;
            font-family: 'Josefin Sans',sans-serif;
            box-sizing: border-box;
        }
            .about{
                width: 100%;
                padding: 78px 0px;
                background-color: #191919;
            }
            .about img{
                height:auto;
                width: 380px;
            }
            .about-text{
                width: 550px;
            }
            .main{
                width:1130px;
                max-width: 95%;
                margin:0 auto;
                display:flex;
                align-items: center;
                justify-content: space-around;
            }
            .about-text h1{
                color:white;
                font-size: 80px;
                text-transform: capitalize;
                margin-bottom: 20px;
            }
            .about-text h4 {
                color:white;
                font-size:35px;
                text-transform: capitalize;
                margin-bottom: 22px;
                letter-spacing: 2px;
            }
            .about-text h5 {
                color:white;
                font-size:25px;
                text-transform: capitalize;
                margin-bottom: 25px;
                letter-spacing: 2px;
            }
            .about-text p{
                color: #fcfc;
                letter-spacing: 1px;
                line-height: 26px;
                font-size: 18px;
                margin-bottom: 45px;
            }
            a{
                background: #f9004d;
                color:white;
                text-decoration: none;
                border: 2px solid transparent;
                font-weight: bold;
                padding:13px 30px;
                border-radius: 30px;
                transition: .4s;
            }
            a:hover {
                background:transparent;
                border:2px solid #f9004d;
                cursor:pointer;
            }
    </style>
    <body>
        <section class="about">
            <div class="main">
                <img src="assets/logo3.jpg" alt="alt"/>
                <div class="about-text">
                    <h1>About Us</h1>
                    <h4>Subject: PRJ301</h4>
                    <h5>Project: FourShoes</h5>
                    <p>Members:<br>
                        <label> - Vo Minh Thong - CE171505 (Leader) <br></label>
                        <label> - Huynh Hung Loi - CA171233  <br></label>
                        <label> - Pham Minh Nhat - CE171380<br></label>
                        <label> - Dung Thanh Loc - CE170077 <br></label>
                    </p>
                    <a href="index-control">Home</a>
                </div>
            </div>
        </section>
    </body>
</html>
