<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : list
    Created on : Jun 7, 2023, 4:17:26 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Four Shop</title>
        <script src="https://kit.fontawesome.com/0f702670e0.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/0f702670e0.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    </head>
    <style>
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
            height: 2vh;
        }
        .body{
            background-image: url("https://wallpaperaccess.com/full/3312983.jpg");
        }
        #header{
            position: static;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 9999;
            transition: top 0.3s ease-in-out;
            background-color: black;
            background-size: cover;
            background-position: center;
            height: 120px;
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
            margin-left: 100px;
            overflow-x: auto;
        }

        #menu .item {
            display: flex;
            justify-content: space-between;
            margin-left: 35px
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
            font-size:27px;
            margin-right: 30px;
        }
        #actions .item i.fa.fa-shopping-cart {
            font-size: 25px;
        }

        .card-img-top {
            width: 100%;
            height: 200px; /* Đặt độ cao ảnh tùy ý */
            object-fit: cover; /* Đảm bảo ảnh không bị biến dạng */
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
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .card-title a:hover {
            color: red;
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
        .config1 {
            padding: 20px;
            margin-top:100px;
            margin-left: 190px;
            margin-right: 120px;
        }
        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 50px;
            min-height: 30px;
            color: black;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }
        .pagination li a:hover {
            color: #666;
        }
        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }
        .pagination li.active a:hover {
            background: #0397d6;
        }
        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }
        .clearfix {
            display: flex;
            justify-content: center;

        }
        .pagination li a {
            color: white; /*đổi màu chữ thành trắng*/
            text-decoration: none; /*loại bỏ gạch chân cho liên kết*/
            font-size: 20px;
            margin-bottom: 10px;
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
            .wrapper {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                align-items: center;
            }
            #menu {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                align-items: center;
                margin-right: 10px;
            }
            #menu .item {
                margin: 0 10px;
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
        }
    </style>
    <body>
        <div id="wrapper">
            <div id="header">
                <a href="/index-control" class="logo">
                    <img src="assets/logo3.jpg" alt="Logo not found" />
                </a>
                <div id="menu">
                    <div class="item">
                        <c:if test="${isAdmin == 1}">
                            <a href="/list-product">Manager Page</a>
                        </c:if>
                        <c:if test="${isAdmin != 1}">
                            <a href="/index-control">Home</a>
                        </c:if>
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
                </div>
                <div id="actions">

                    <div class="item">
                        <a href="/view-cart" class="logo1">
                            <i class="fa fa-shopping-cart"></i> Cart
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="body">
            <div class="col-sm-9 config1">
                <div class="row">
                    <c:forEach items="${list}" var="p">
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="card">

                                <img class="card-img-top" src="${pageContext.request.contextPath}/images/${p.image}" alt="Product Image"><!-- comment -->
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
            <div class="clearfix">
                <c:forEach var="x" begin="1" end="${pageCount}" step="1">
                    <ul class="pagination">
                        <li>
                            <a href="home?index=${x}">${x}</a>
                        </li>
                    </ul>
                </c:forEach>
            </div><!-- comment -->
        </div>


        <footer class="footer">

            <div class="footer-left">
                <h3>Four<span>Shoes</span></h3>

                <p class="footer-links">
                    <a href="/index-control">Home</a>
                    |
                    <a href="about.jsp">About</a>
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



    </body>
</html>
