<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : viewcart
    Created on : Jun 24, 2023, 5:42:57 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your cart</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

        <style>
            /* Định nghĩa kiểu cho bảng */
            .header{
                display: flex;
                justify-content: space-between;
                align-items: center;
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
            h1{
                margin-left: 320px;
                color:red;
            }
            h2{
                color:black
            }
            span{
                color:red;
            }
            .cart-table{
                border-collapse: collapse;
                width: 100%;
                margin-top: 20px;
            }
            .cart-table th, td {
                text-align: left;
                padding: 10px;
                font-size:1.2rem;
                font-weight: 700;
            }
            a{
                text-decoration: none;
                color: red;
            }
            .cart-table td a.delete {
                color: black; /* thay đổi màu chữ của nút "Delete" */
            }
            .cart-table td a.delete:hover {
                color:red;
                transition: all 0.3s ease 0s;
            }

            .cart-table td a.plus,
            .cart-table td a.minus {
                color: black; /* thay đổi màu chữ của dấu "+" và "-" */
            }

            .cart-table td a.plus:hover,
            .cart-table td a.minus:hover {
                text-decoration: none; /* ẩn dấu gạch chân khi rê chuột vào */
                color: gray; /* thay đổi màu chữ khi rê chuột vào */
            }
            th {
                background-color: black;
                color: white;
            }
/* Định nghĩa kiểu cho nút "Add to cart" */
            .button2 {
                display: inline-block;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                background-color: black;
                color: white;
                border-radius: 4px;
                transition: all 0.3s ease 0s;

            }
            .button1:hover,.button2:hover {
                background-color: red;
                color: white;
            }
            .emtyC{

                font-size: 1.5rem;
                font-weight: bold;
                text-align: center;


            }
            .Cart{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="back">
                <a href="/index-control"> <i class="fa fa-arrow-left" aria-hidden="true"></i>Shop</a>
            </div>
            <h1 class="Cart">Your cart</h1><br>
            <div class="back">
                <a href="/home"">Add more product</a>
            </div>
        </div>
       
        <br><!-- comment -->
        <c:if test="${empty sessionScope.cart.items}">
            <table border="1" class="cart-table" >
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>-</th>
                        <th>Quantity</th>
                        <th>+</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <p class="emtyC">Your shopping cart is empty now. Please add product to view product packaging !</p>
        </c:if>
        <c:if test="${not empty sessionScope.cart.items}">
            <table border="1" class="cart-table" >
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>-</th>
                        <th>Quantity</th>
                        <th>+</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ca" items="${sessionScope.cart.items}">
                        <tr>
                            <td>${ca.product.p_id}</td>
                            <td>${ca.product.p_name}</td>
                            <td><a class="minus" href="change-quantity?quantity=${ca.quantity-1}&pid=${ca.product.p_id}">-</a></td>
                            <td>${ca.quantity}</td>
                            <td><a class="plus" href="change-quantity?quantity=${ca.quantity+1}&pid=${ca.product.p_id}">+</a></td>
                            <td>${ca.product.price}$</td>
<td>${ca.product.price * ca.quantity}$</td>
                            <td><a class="delete" href="delete-cart?pid=${ca.product.p_id}">Delete</a></td>
                        </tr>
                    </c:forEach>
                <br><!-- comment -->

                </tbody>
            </table>
            <h2>Total: <span>${sessionScope.cart.getTotalMoney()}$</span> </h2><br>
            <a href="/pay" class="button2">Payment</a>
            <div style="text-align: center; color: red; font-size: 30px">
        </c:if>
             <c:if test="${not empty mess}">
            <p>${mess}</p>
        </c:if>
            </div>
    </body>
</html>