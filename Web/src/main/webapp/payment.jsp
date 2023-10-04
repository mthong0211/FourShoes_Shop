<%-- 
    Document   : payment
    Created on : Jul 13, 2023, 6:28:47 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Payment Form</title>
        <link rel="stylesheet" href="style.css">
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    </head>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        h2 {
            background-color: black;
            color: white;
            font-size: 24px;
            padding: 10px;
            margin-bottom: 8px;
            text-align: center;
            border: 2px solid black;
        }

        p{

        }

        .input_group {
            width: 100%;
            position: relative;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }
        .input_box1 {
            text-align: center;
        }

        .input_box1 button {
            background-color: #21cdd3;
            border: none;
            color: #fff;
            padding: 15px;
            border-right: 4px;
            font-size: 16px;
            transition: all 0.3s ease;
            border-radius: 8px;
        }

        .input_box1 button:hover {
            cursor: pointer;
            background-color: #05b1a3;
        }


        .admin_bg {
            position: fixed;
            top: 0;
            left: 0;
            z-index: -10;
            width: 100vw;
            height: 1vh;
            background-image: url(/img/adminback.png);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .admin_container {
            border-radius: 10px;
            margin: 80px auto;
            background-color: #b3c9c9;
            overflow: hidden;
        }

        .admin_header {
            padding: .5rem 2rem .25rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow:0 1px 2px rgba(35, 31, 32, 0.3);
        }
        .admin_logo{
            color: black;
            font-weight: 700;
            font-size:18px;
            transform: translateX(-55px);
            transition: font-weight 0.3s ease-in-out;
        }
        .admin_logo:hover {
            font-weight:900;
            cursor:pointer;
        }
        .nav_admin{
            display: flex;
            background-color: var(--light-gray-color);
            border-radius: 20px 20px 0 0;
            transform: translate(0px,16px);
        }
        .nav_admin-link{
            color: var(--black--color);
            background-color: #fff;
            padding: .5rem 1.25rem;
            border-radius: 20px 20px 0 0;
            font-size: var(--h2-font-size);
            font-weight: 600;
        }
        .nav_notin{
            background-color: var(--light-gray-color);
        }
        .admin_product-List{
            display: flex;
            flex-direction: column-reverse;
            background-color: #fff;
            padding: 2rem;
        }
        .admin_product-item{
            position: relative;
            display: flex;
            justify-content: space-around;
            align-items: center;
            width: 100%;
            padding: 1rem;
            margin-bottom: 1rem;
            box-shadow: 1px 1px 5px rgba(35, 31, 32, 0.3);
            border-radius: 10px;
        }
        .admin_product-item-descripttion span {
            font-size: 20px; /* Change this value to your desired font size */
        }
        .admin_product-item-descripttion p {
            font-size: 17px;
        }
        .admin_product-item img{
            width: auto;
            height: 200px;
        }

        .admin_product-function-add{
            position: relative;
            display: flex;
            align-items: center;
            width: 100%;
            padding: 1rem;
            margin-bottom: 1rem;
            box-shadow: 1px 1px 5px rgba(35, 31, 32, 0.3);
            border-radius: 10px;
            background-color: var(--gray-color);
            color: var(--white-color);
            font-size: var(--h2-font-size);
            justify-content: center;
            transition: 0.3s;
            gap: 1.5rem;
            order: 1;
        }
        .admin_product-function-edit ion-icon,
        .admin_product-function-remove ion-icon {
            color: black;
        }
        .admin_product-function-add:hover{
            background-color: #5b7b80;
            box-shadow: inset 1px 1px 5px rgba(35, 31, 32, 0.3);
        }
        .admin_product-item-id span{
            font-weight: 600;
            margin-right: .5rem;
        }
        .admin_product-item-descripttion{
            display: grid;
            grid-template-columns: repeat(2,1fr);
            padding: 1rem;
            gap: 2rem;
            font-size: var(--h3-font-size);
        }
        .admin_product-item-descripttion div p{
            margin-bottom: .5rem;
            text-align: left;
        }
        .admin_product-item-name{
            font-weight: 600;
            font-size: var(--h2-font-size);
        }
        .admin_product-item-name:first-letter{
            text-transform: uppercase;
        }
        .admin_product-item-price{
            margin-top: .25rem;
            color: crimson;
        }
        .admin_product-function{
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        .admin_product-function a{
            font-size: 1.5rem;
            padding: .35rem .65rem;
            border-radius: 50%;
            transition: 0.3s;
        }
        .admin_product-function-edit{
            background-color: #CA8696;
        }
        .admin_product-function a:hover{
            transform: translateY(-3px);
            box-shadow: 1px 1px 2px rgba(35, 31, 32, 0.5);
        }
        .admin_product-function-remove{
            background-color: var(--light-gray-color);
        }

        .addproduct_container{
            background: rgba(195, 238, 236, 0.2);
            backdrop-filter: blur(10px);
        }
        .addproduct_data{
            position: relative;
            font-weight: 600;
            color: var(--black--color);
        }
        .addproduct_back a{
            color: #2d2d2d;
        }
        .addproduct_data input{
            background-color: rgba(255,255,255,0.3);
            padding: .75rem;
            color: #2d2d2d;
        }
        .addproduct_data input:focus{
            border-bottom: 2px solid #2d2d2d;
        }
        .addproduct_data-img input{
            background-color: transparent;
            border: none;
        }
        .addproduct_data-img input:focus{
            border: none;
        }
        .addproduct_data-img label{
            position: absolute;
            background-color: #CA8696;
            color: #f2f8f8;
            padding: .5rem 1rem;
            border-radius: 4px;
            top: 2px;
            left: 5px;
            cursor: pointer;
        }
        .addproduct_data-img input{
            padding-left: 80px;
        }
        .addproduct_back a:hover{
            color: #231f20;
        }
        .addproduct_submit{
            background-color: #2d2d2d;
        }
        .addproduct_submit:hover{
            background-color: #231f20;
        }

        .nav_admin-right{
            display: flex;
            align-items: center;
            gap: 1.5rem;
            position: relative;
        }
        .admin_nameside{
            z-index: 10;
        }
        .nav_admin-right input{
            position: absolute;
            left: 0;
            width: 0;
            opacity: 0;
            z-index: 1;
            outline: none;
            background-color: var(--white-color);
            border-radius: 20px;
            transition-duration: .3s;
            transition-property: opacity, width,left,padding;
        }
        .nav_admin-right i{
            font-size: 22px;
            font-weight: 600;
            z-index: 3;
        }
        .nav_admin-right button{
            z-index: 3;
        }
        .input_search-show input{
            left: -88%;
            opacity: 1;
            padding: .35rem .75rem;
            padding-right: 2.5rem;
            width: 100%;
        }
        .total{
            font-size: 100px;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            font-size: 20px;
        }
    </style>
    <body>
        <h2>Payment</h2>
        <form action="/PayControl" method="post">
            <div class="admin_container container">
                <div class="admin_header">
                    <div class="nav_admin">
                        <a href="/view-cart" class="nav_admin-link">Payment</a>
                    </div>
                    <a href="/home" class="logo__item admin_logo">FOUR SHOES <span></span></a>
                </div>
                <div class="admin_product-List" id="searchResults">
                    <c:forEach var="info" items="${infoList}">
                        <!-- ======== item1 ============== -->
                        <div class="admin_product-item">
                            <div class="admin_product-item-descripttion">
                                <div>
                                    User: <input type="hidden" name="user" value="${info.user}">${info.user}<br>
                                    Name: <input type="hidden" name="name" value="${info.name}">${info.name}<br>
                                    Email: <input type="hidden" name="email" value="${info.email}">${info.email}<br>
                                    <p class="admin_product-item-id" ><span>Address:</span> <textarea name="address" value="address" required ></textarea></p>
                                </div>

                                <!-- ======== products ============== -->
                                <c:forEach var="ca" items="${sessionScope.cart.items}">
                                    <div class="admin_product-item-descripttion">
                                        <div> 
                                            Shoes Name: <input type="hidden" name="shoes_name" value="${ca.product.p_name}">${ca.product.p_name}<br>
                                            Quantity: <input type="hidden" name="quantity" value="${ca.quantity}">${ca.quantity}<br>
                                            Price: <input type="hidden" name="price" value="${ca.product.price}">${ca.product.price}<br>

                                        </div>
                                    </div>
                                </c:forEach>


                            </div>
                        </div>

                    </c:forEach>

                </div>

                <div class="input_group">
                    <div class="input_box1">

                        <input class="total" type="hidden" name="Total" value="${sessionScope.cart.getTotalMoney()}">Total: ${sessionScope.cart.getTotalMoney()}$
                        <button type="submit">PAY NOW</button>
                    </div>
                </div>
        </form>
        <script>
            document.querySelector('form').addEventListener('submit', function (e) {
                e.preventDefault(); 
                alert('Thank you for purchasing products from FOURSHOES !!!');
                window.location.href = '/home'; 
            });
        </script>
    </body>

</html>

