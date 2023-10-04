<%-- 
    Document   : index
    Created on : Jun 19, 2023, 4:47:11 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/0f702670e0.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <title>Four Shoes </title>
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;1,200;1,400;1,500&display=swap');
        *{
            padding:0;
            margin:0;
            box-sizing: border-box;
            font-family:'Poppins', sans-serif;
            cursor: pointer;
        }


        #wrapper {
            /* Kích thước màn hình là 1280 x 720 */
            width: 100%;
            height: 100vh;
        }
        .body{
            background-image: url("https://wallpaperaccess.com/full/3312983.jpg");
        }
        #header{
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 9999;
            transition: top 0.3s ease-in-out;
            background-color: black;
            background-size: cover;
            background-position: center;
            height: 100px;
            width: 100%;
            padding: 30px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        #header .logo img{
            width: 85px;
            height: auto;
        }

        #menu {
            list-style:none;
            display: flex;
            margin-left: 70px;
            overflow-x: auto;
        }

        #menu .item {
            display: flex;
            justify-content: space-between;
            margin: 0 30px;
        }

        #menu .item a,#menu .item .menu-link {
            color:whitesmoke;
            text-decoration: none;
            font-size: 25px;
        }
        #menu-toggle {
            display: none;
        }

        #actions {
            display: flex;
        }
        #actions .item{
            margin-left:10px;
        }
        #actions .item a{
            font-size:20px;
        }
        #actions .item i.fa.fa-shopping-cart {
            font-size: 20px;
        }

        #banner {
            width: 100%;
            background-image :url("https://i.pinimg.com/564x/7f/da/0b/7fda0b7bcad9a8260bbdc00e375af523.jpg");
            height: 463px;
            display: flex;
            padding:0px 133px;
            position:relative;
        }

        #banner .box-left ,#banner .box-right {
            width: 50%;
        }

        #banner  .box-left h2 {
            font-size:50px;
            margin-top:165px;
            color:#fff;
        }

        #banner .box-left p {
            color:white;
            font-weight: bold;
            font-size:20px;
        }


        #banner .box-right {
            padding-left:200px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #banner .box-right img {
            margin:0px 10px;
            animation :animation 3s infinite linear;
        }


        #banner .box-right img:nth-child(1)
        {
            animation-delay: 0.5s;
        }
        #banner .box-right img:nth-child(2)
        {

            animation-delay: 1s;
        }

        @keyframes animation {
            0%{
                transform:translateY(0px);
            }
            50%{
                transform: translateY(-10px);
            }
            100%{
                transform: translateY(0px);
            }

        }

        .to-bottom {
            position:absolute;
            bottom:-40px;
            left:50%;
            transform:translateX(-50%);
        }



        #wp-products {
            padding-top:116px;
            padding-bottom: 78px;
            padding-left:134px;
            padding-right:134px;
        }

        #wp-products h2 {
            text-align: center;
            margin-bottom: 76px;
            font-size:32px;
            color:white;
        }
        #a-products {
            padding-bottom: 78px;
            padding-left:134px;
            padding-right:134px;
        }

        #a-products h2 {
            text-align: center;
            margin-bottom: 76px;
            font-size:32px;
            color:white;
        }
        .card-img-top {
            width: 100%;
            height: 200px; /* Đặt độ cao ảnh tùy ý */
            object-fit: cover; /* Đảm bảo ảnh không bị biến dạng */
        }
        .card-title a {
            display: inline-block;
            width: 100%;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .card {
            width: 100%;
            height: 400px;
            margin-bottom: 20px;
        }
        .card-body {
            position:relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
        }
        .card-title {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            margin-bottom: 0.5rem;
        }
        .card-title a {
            text-decoration: none;
            color:black;
            text-align: center;
            width: 100%;
        }
        .btn-block {
            margin-top: auto;
        }
        .btn-success {
            width: 100%;
            font-size: 1rem;
            color: white;
            border: none;
            cursor: pointer;
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0% {
                background-color: green;
            }
            66% {
                background-color: red;
            }
            100% {
                background-color: black;
            }
            /* Thêm các thuộc tính sau để làm cho chuyển đổi màu sắc mượt hơn */
            animation-timing-function: linear;
            animation-fill-mode: forwards;
        }

        #list-products {
            display: flex;
            list-style: none;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
        }

        #list-products .item {
            width: 290px;
            height: 400px;
            background:white;
            border-radius: 10px;
            margin-bottom: 50px;
            margin: 0px;
        }

        #list-products .item img {
            width: 100%;
            display: block;
            margin:0px auto;
        }

        #list-products .item .stars {

            display: flex;
            margin:0px auto;
            width: 50%;
        }

        #list-products .item .name {
            text-align: center;
            color:black;
            font-weight: bold;
            margin-top:21px;
        }

        #list-products .item .desc {
            text-align: center;
            color:#626a67;
        }

        #list-products .item .price {
            text-align: center;
            color:black;
            font-weight: bold;
            margin-top:15px;
        }


        .list-page {
            width: 50%;
            margin:0px auto;
        }

        .list-page {
            display: flex;
            list-style: none;
            justify-content: center;
            align-items: center;
        }

        .list-page .item {
            margin:70px 15px;
            width: 37px;
            height: 37px;
            background:black;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .list-page .item a {
            color:#fff;
            text-decoration: none;
        }


        #saleoff {
            width: 100%;
            display: flex;
            height: 322px;
        }
        #saleoff .box-left ,#saleoff .box-right {
            width: 50%;
        }
        #saleoff .box-left {
            background:#3e413e;
            text-align: center;
            min-height: 322px;
        }

        #saleoff .box-left h1 {
            padding-top:38px;
        }
        #saleoff .box-left span:nth-child(1)
        {
            color:#fff;
            font-size:50px;
        }

        #saleoff .box-left span:nth-child(2)
        {
            color:orange;
            font-size:128px;
        }

        #saleoff .box-right {
            background-image:url("assets/off2.png");
        }
        .item a{
            color:#fff;
            text-decoration: none;
        }
        footer {
            position: fixed;
            bottom: 0;
        }

        @media (max-height:800px) {
            footer {
                position: static;
            }
            header {
                padding-top: 40px;
            }
        }

        .footer {
            background:rgb(0,0,0,0.79);
            box-sizing: border-box;
            width: 100%;
            text-align: left;
            font: bold 16px sans-serif;
            padding: 50px 50px 60px 50px;
            margin-top: 80px;
        }

        .footer .footer-left, .footer .footer-center, .footer .footer-right {
            display: inline-block;
            vertical-align: top;
        }

        /* Footer left */

        .footer .footer-left {
            width: 30%;
        }

        .footer h3 {
            color: #ffffff;
            font: normal 36px 'Cookie', cursive;
            margin: 0;
        }


        .footer h3 span {
            color: #e0ac1c;
        }

        /* Footer links */

        .footer .footer-links {
            color: #ffffff;
            margin: 20px 0 12px;
        }

        .footer .footer-links a {
            display: inline-block;
            line-height: 1.8;
            text-decoration: none;
            color: inherit;
        }

        .footer .footer-company-name {
            color: #8f9296;
            font-size: 14px;
            font-weight: normal;
            margin: 0;
        }

        /* Footer Center */

        .footer .footer-center {
            width: 35%;
        }

        .footer .footer-center i {
            background-color: #33383b;
            color: #ffffff;
            font-size: 25px;
            width: 38px;
            height: 38px;
            border-radius: 50%;
            text-align: center;
            line-height: 42px;
            margin: 10px 15px;
            vertical-align: middle;
        }

        .footer .footer-center i.fa-envelope {
            font-size: 17px;
            line-height: 38px;
        }

        .footer .footer-center p {
            display: inline-block;
            color: #ffffff;
            vertical-align: middle;
            margin: 0;
        }

        .footer .footer-center p span {
            display: block;
            font-weight: normal;
            font-size: 14px;
            line-height: 2;
        }

        .footer .footer-center p a {
            color: #e0ac1c;
            text-decoration: none;
            ;
        }

        /* Footer Right */

        .footer .footer-right {
            width: 30%;
        }

        .footer .footer-company-about {
            line-height: 20px;
            color: #92999f;
            font-size: 13px;
            font-weight: normal;
            margin: 0;
        }

        .footer .footer-company-about span {
            display: block;
            color: #ffffff;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .footer .footer-logo img {
            width: 120px;
            height: auto;
            margin-top: 30px;
        }


        .footer .footer-icons a:hover {
            background-color: #3F71EA;
        }

        .footer-links a:hover {
            color: #3F71EA;
        }
        @media (max-width: 880px) {
            #menu {
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: center;
                align-items: center;
                height: 0;
                overflow: hidden;
                transition: all 0.3s ease-in-out;
            }

            #menu.active {
                height: auto;
                overflow: visible;

            }
            #menu.active .item a {
                font-size: 1em;
                text-align: center;
            }
            #menu.active .menu-link {
                font-size: 1em;
            }

            #menu.active .logo1 {
                font-size: 1em;
            }

            #menu-toggle {
                display: block;
                cursor: pointer;
                font-size: 25px;
                color: whitesmoke;
            }

            #header .logo img {
                width: 60px;
            }

            #actions {
                position: relative;
            }

            #actions .item {
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                background-color: black;
                padding: 10px 0;
                overflow: hidden;
                max-height: 0;
                transition: all 0.3s ease;
            }

            #actions .item.active {
                max-height: 300px;
            }

            #actions .item a {
                color: whitesmoke;
                font-size: 20px;
                margin: 10px 0;
            }

            #actions .item i.fa.fa-shopping-cart {
                font-size: 20px;
                margin-right: 5px;
            }
            .footer .footer-left, .footer .footer-center, .footer .footer-right {
                display: block;
                width: 100%;
                margin-bottom: 40px;
                text-align: center;
            }
            .footer .footer-center i {
                margin-left: 0;
            }
            #banner {
                height: 300px;
                background-size: cover;
                padding: 0 30px;
            }
            #banner .box-left {
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: center;
            }
            #banner .box-left h2 {
                font-size: 5vw;
                margin-top: 0;
                margin-bottom: 10px;
                color: #fff;
            }
            #banner .box-left p {
                color: white;
                font-weight: bold;
                font-size: 2vw;
            }
            #banner .box-right {
                display: none;
            }
        }
    </style>
    <body>
        <div id="wrapper">
            <div id="header">
                <a href="" class="logo">
                    <img src="assets/logo3.jpg" alt="">
                </a>

                <div id="menu">
                    <div class="item">
                        <a href="/index-control">Home</a>
                    </div>
                    <div class="item">
                        <a href="/home">Shop</a>
                    </div>
                    <% boolean isLoggedIn = (session.getAttribute("isLoggedIn") != null && (boolean) session.getAttribute("isLoggedIn"));
                    String username = (String) session.getAttribute("username");
                    if (isLoggedIn) { %>
                    <div class="item" style="float: right;">
                        <c:if test="${isAdmin == 1}">
                            <span class="menu-link"><a href ="/Info">Hello, Boss</a></span>
                        </c:if>
                        <c:if test="${isAdmin != 1}">
                            <span class="menu-link"><a href ="/Info">Hello, <%= username.substring(0, 1).toUpperCase() + username.substring(1) %></a></span>
                        </c:if>    
                        <div class="item">
                            <a href="/logout"> Logout</a>
                        </div>
                    </div>
                    <% } else { %>
                    <div class="item" style="float: right;">
                        <a href="/Login-page">Login/Register</a>
                    </div>
                    <% } %>
                    <div class="item">
                        <a href="/view-cart" class="logo1">
                            <i class="fa fa-shopping-cart"></i> Cart
                        </a>
                    </div>
                </div>
                <div id="menu-toggle">
                    <i class="fa fa-bars"></i>
                </div>
            </div>

            <div class="body">
                <div id="banner">
                    <div class="box-left">
                        <h2>
                            <span>Four Shoes</span>
                        </h2>
                        <p>Choose Four Shoes - For Your Shoes</p>
                    </div>
                    <div class="box-right">
                        <img src="assets/imgg1.png" alt="">
                        <img src="assets/imgg2.png" alt="">
                    </div>
                    <div class="to-bottom a">
                        <a href="#wp-products">
                            <img src="assets/to_bottom.png" alt="">
                        </a>
                    </div>
                </div>
                <div id="wp-products">
                    <h2>Newest Products</h2>
                    <!--                <ul id="list-products">-->
                    <div class="config1">
                        <div class="row">
                            <c:forEach items="${list}" var="p">
                                <div class="col-12 col-md-6 col-lg-4">
                                    <div class="card">
                                        <img class="card-img-top" src="${pageContext.request.contextPath}/images/${p.image}" alt="Card image cap">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a  href="detail-product?pid=${p.p_id}" title="View Product">${p.p_name}</a></h4>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${p.price} $</p>
                                                </div>
                                                <div class="col">
                                                    <a href="add-cart?quantity=1&pid=${p.p_id}" class="btn btn-success btn-block">Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div> 
                    </div>
                </div>
                <div id="a-products">
                    <h2>ADIDAS</h2>
                    <div class="config1">
                        <div class="row">
                            <c:forEach items="${listA}" var="p">
                                <div class="col-12 col-md-6 col-lg-4">
                                    <div class="card">
                                        <img class="card-img-top" src="${pageContext.request.contextPath}/images/${p.image}" alt="Card image cap">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a  href="detail-product?pid=${p.p_id}" title="View Product">${p.p_name}</a></h4>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${p.price} $</p>
                                                </div>
                                                <div class="col">
                                                    <a href="add-cart?quantity=1&pid=${p.p_id}" class="btn btn-success btn-block">Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div> 
                    </div>
                </div>
                <div id="a-products">
                    <h2>NIKE</h2>
                    <div class="config1">
                        <div class="row">
                            <c:forEach items="${listN}" var="p">
                                <div class="col-12 col-md-6 col-lg-4">
                                    <div class="card">
                                        <img class="card-img-top" src="${pageContext.request.contextPath}/images/${p.image}" alt="Card image cap">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a  href="detail-product?pid=${p.p_id}" title="View Product">${p.p_name}</a></h4>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${p.price} $</p>
                                                </div>
                                                <div class="col">
                                                    <a href="add-cart?quantity=1&pid=${p.p_id}" class="btn btn-success btn-block">Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div> 
                    </div>
                </div>

                <div id="saleoff">
                    <div class="box-left">
                        <h1>
                            <span>SALE OFF</span>
                            <span>20%</span>
                        </h1>
                    </div>
                    <div class="box-right"></div>
                </div>

            </div>         

            <footer class="footer">

                <div class="footer-left">
                    <h3>Four<span>Shoes</span></h3>

                    <p class="footer-links">
                        <a href="/index-control">Home</a>
                        |
                        <a href="about.jsp">About us</a>
                        |
                        <a href="https://www.facebook.com/huynhhungloi1">Contact</a>
                    </p>

                    <p class="footer-company-name">Copyright © 2023 <strong>FourShoes</strong> All rights reserved</p>
                </div>

                <div class="footer-center">
                    <div>
                        <i class="fa fa-map-marker"></i>
                        <p><span>CanTho</span>
                            Vietnam</p>
                    </div>

                    <div>
                        <i class="fa fa-phone"></i>
                        <p>+ 0969091310</p>
                    </div>
                    <div>
                        <i class="fa fa-envelope"></i>
                        <p><a href="mailto:hungloipro123@gmail.com">hungloipro123@gmail.com</a></p>
                    </div>
                </div>
                <div class="footer-right">
                    <p class="footer-company-about">
                        <span>About the company</span>
                        <strong>Four Shoes</strong> is a shop where you can find more Adidas, Nike or Vans Shoes and Provide safe quality products for customers
                    </p>
                    <div class="footer-logo">
                        <img src="assets/logo3.jpg" alt="">
                    </div>
                </div>
            </footer>
        </div>

        <script>
            var menuToggle = document.getElementById('menu-toggle');
            var menu = document.getElementById('menu');

            menuToggle.addEventListener('click', function () {
                menu.classList.toggle('active');
            });
            const toBottomBtn = document.querySelector(".to-bottom");
            var translateY = 0;
            var count = commentItem.length;
            toBottomBtn.addEventListener("click", function (event) {
                event.preventDefault();
                const product = document.querySelector("#wp-products");
                product.scrollIntoView({behavior: "smooth"});
            });
        </script>
    </body>
</html>
