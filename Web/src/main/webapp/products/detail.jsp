<%-- 
    Document   : detail
    Created on : Jun 8, 2023, 12:41:51 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

    </head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap');

        *{
            box-sizing: border-box;
            padding: 0;
            margin: 0;
            font-family: 'Open Sans', sans-serif;
        }
        body{
            line-height: 1.5;
        }
        .back a{
            text-decoration: none; /* ẩn dấu gạch chân */
            font-size: 25px; /* cỡ chữ */
            font-weight: bold; /* in đậm */
            color: #000; /* màu chữ */
            display: flex; /* sử dụng mô hình flexbox để căn giữa phần tử */
            align-items: center; /* căn giữa phần tử theo trục dọc */
            margin-left: 10px;
        }
        .back a:hover{
            color:red;
            transition: all 0.3s ease 0s;
        }
        .back i {
            font-size: 25x; /* cỡ chữ của biểu tượng */
            margin-right: 10px; /* khoảng cách giữa biểu tượng và chữ */
        }
        .card-wrapper{
            max-width: 1100px;
            margin: 20px auto;
        }
        .img-display{
            overflow: hidden;
            height: calc(100% - 50px);
        }
        .img-display a img{
            max-width: 100%;
            max-height: 600px;
            display: block;
            transition: all 0.3s ease-in-out;
        }
        .img-display:hover img {
            transform: scale(1.1);
        }
        .product-imgs {
            height: 100%;
        }
        .product-content{
            padding: 2rem 1rem;
        }
        .product-name {
            font-size: 2rem;
            text-transform: capitalize;
            font-weight: 1000;
            text-align: center;
            position: relative;
            color: black;
            margin: 2rem 0;
        }
        .product-title{
            font-size: 2rem;
            text-transform: capitalize;
            font-weight: 700;
            position: relative;
            color: #12263a;
            margin: 2rem 0;
        }
        .product-title::after{
            content: "";
            position: absolute;
            left: 0;
            bottom: 0;
            height: 4px;
            width: 80px;
            background: #12263a;
        }
        .product-link{
            text-decoration: none;
            text-transform: uppercase;
            font-weight: 400;
            font-size: 0.9rem;
            display: inline-block;
            margin-bottom: 0.5rem;
            background: #256eff;
            color: #fff;
            padding: 0 0.3rem;
            transition: all 0.5s ease;
        }
        .product-link:hover{
            opacity: 0.9;
        }
        .product-rating{
            color: #ffc107;
        }
        .product-rating span{
            font-weight: 600;
            color: #252525;
        }
        .product-price{
            margin: 1rem 0;
            font-size: 25px;
            font-weight: 700;
        }
        .product-price span{
            font-weight: 400;
        }
        .product-detail h2{
            text-transform: capitalize;
            color: #12263a;
            padding-bottom: 0.6rem;
        }
        .product-detail p{
            font-size: 0.9rem;
            padding: 0.3rem;
            opacity: 1;
        }
        .product-detail ul{
            margin: 1rem 0;
            font-size: 0.9rem;
        }
        .product-detail ul li{
            margin: 0;
            list-style: none;
            background: url(../assets/checked.png) left center no-repeat;
            background-size: 18px;
            padding-left: 1.7rem;
            margin: 0.4rem 0;
            font-weight: 600;
            opacity: 0.9;
        }
        .product-detail ul li span{
            font-weight: 400;
        }
        .purchase-info{
            margin: 1.5rem 0;
        }
        .purchase-info input,
        .purchase-info .btn{
            border: 1.5px solid #ddd;
            border-radius: 25px;
            text-align: center;
            padding: 0.45rem 0.8rem;
            outline: 0;
            margin-right: 0.2rem;
            margin-bottom: 1rem;
        }
        .purchase-info input{
            width: 60px;
        }
        .purchase-info .btn{
            cursor: pointer;
            color: white;
        }
        .purchase-info .btn a{
            text-decoration: none;
            color:white;
        }
        .purchase-info .btn:first-of-type{
            background: black;
        }

        .purchase-info .btn:hover{
            opacity: 0.9;
        }
        .social-links{
            display: flex;
            align-items: center;
        }
        .social-links a{
            display: flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            color: #000;
            border: 1px solid #000;
            margin: 0 0.2rem;
            border-radius: 50%;
            text-decoration: none;
            font-size: 0.8rem;
            transition: all 0.5s ease;
        }
        .social-links a:hover{
            background: #000;
            border-color: transparent;
            color: #fff;
        }

        @media screen and (min-width: 992px){
            .card{
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                grid-gap: 1.5rem;
            }
            .card-wrapper{
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .product-imgs{
                display: flex;
                flex-direction: column;
                justify-content: center;
            }
            .product-content{
                padding-top: 0;
            }
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
            .footer .footer-left, .footer .footer-center, .footer .footer-right {
                display: block;
                width: 100%;
                margin-bottom: 40px;
                text-align: center;
            }
            .footer .footer-center i {
                margin-left: 0;
            }
        }
    </style>
    <div class="back">
        <a href="/home"> <i class="fa fa-arrow-left" aria-hidden="true"></i>Shop</a>
    </div>
    <div class = "card-wrapper">

        <div class = "card">
            <!-- card left -->
            <div class = "product-imgs">
                <div class="product-name">${p.p_name}</div>
                <div class = "img-display">
                    <a>
                        <img src="${pageContext.request.contextPath}/images/${p.image}"/>
                    </a>
                </div>
            </div>
            <!-- card right -->
            <div class = "product-content">
                <h2 class = "product-title">Four shoes</h2>
                <a href = "/home" class = "product-link">visit our store</a>
                <div class = "product-rating">
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star-half-alt"></i>
                    <span>4.7(21)</span>
                </div>

                <div class = "product-price">
                    Price: ${p.price}$
                </div>

                <div class = "product-detail">
                    <h2>about this item: </h2>
                    <p>- ${p.des}</p>
                    <ul>
                        <li>Available:<span> ${p.stock}</span></li>
                        <li>Category: <span>Shoes</span></li>
                        <li>Brand:<span> ${p.brand}</span> </li>
                        <li>Shipping Area: <span>In the Vietnam</span></li>
                        <li>Shipping Fee: <span>Free</span></li>
                    </ul>
                </div>

                <div class = "purchase-info">
                    <button type = "button" class = "btn">
                        <a href="add-cart?quantity=1&pid=${p.p_id}">Add to cart</a> <i class = "fas fa-shopping-cart"></i>
                    </button>
                </div>

                <div class = "social-links">
                    <p>Share At: </p>
                    <a href = "https://www.facebook.com/huynhhungloi1">
                        <i class = "fab fa-facebook-f"></i>
                    </a>
                    <a href = "#">
                        <i class = "fab fa-twitter"></i>
                    </a>
                    <a href = "#">
                        <i class = "fab fa-instagram"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>




    <footer class="footer">

        <div class="footer-left">
            <h3>Four<span>Shoes</span></h3>

            <p class="footer-links">
                <a href="/index-control">Home</a>
                |
                <a href="/home">About</a>
                |
                <a href="#">Contact</a>
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

</body>
</html>
