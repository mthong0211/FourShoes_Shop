<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new product</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
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
            /* Kích th??c màn hình là 1280 x 720 */
            width: 100%;
            height: 10vh;
        }
        #header{
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
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }
        form {
            margin: 50px auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            width: 500px;
            max-width: 90%;
            text-align: center;
        }
        h1 {
            margin-top: 40px;
            font-size: 36px;
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            text-shadow: 1px 1px 0 #fff;
        }
        label {
            display: block;
            font-weight: bold;
            font-size: 23px;
            margin-bottom: 10px;
            color: #333;
            text-shadow: 1px 1px 0 #fff;
            text-align: left;
        }
        input[type="text"] {
            padding: 10px;
            margin: 10px auto;
            border-radius: 5px;
            border: 2px solid #ccc;
            width: 80%;
            font-size: 20px;
            color: #555;
            text-align: center;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:hover, input[type="text"]:focus {
            border-color: #4CAF50;
        }
        button[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            padding: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        button[type="submit"]:hover {
            background-color: #3e8e41;
        }
        .error-message {
            color: red;
            font-size: 16px;
            margin-top: 10px;
        }
    </style>
    <body>

        <div>
            <div id="header">
                <a href="/index-control" class="logo">
                    <img src="assets/logo3.jpg" alt="Logo not found" />
                </a>
                <div id="menu">
                    <div class="item">
                        <c:if test="${isAdmin == 1}">
                            <a href="/list-product">Manager Page</a>
                        </c:if>
                    </div>

                    <% boolean isLoggedIn = (session.getAttribute("isLoggedIn") != null && (boolean) session.getAttribute("isLoggedIn"));
    String username = (String) session.getAttribute("username");
    if (isLoggedIn) { %>
                    <div class="item" style="float: right;">
                        <c:if test="${isAdmin == 1}">
                            <span class="menu-link">Hello, Boss</span>
                        </c:if>               
                        <div class="item">
                            <a href="/logout"> Logout</a>
                        </div>
                    </div>
                    <% } else { %>
                    <div class="item" style="float: right;">
                        <a href="login.jsp">Login/Register</a>
                    </div>
                    <% } %>
                </div>
            </div>
            <h1>ADD NEW PRODUCT</h1>
            <form id="add-product-form" method="post" action="add-product" enctype="multipart/form-data">
                <label>Name:</label> <input type="text" name="name"><br><!-- comment -->
                <p style="color: red">${messName}</p>
                <label>Price:</label> <input type="text" name="price"><br><!-- comment -->
                <label>Brand:</label> <input type="text" name="brand"><br><!-- comment -->
                <label>Image:</label> <input type="file" name="image"><br><!-- comment -->
                <label>Stock:</label> <input type="text" name="stock"><br><!-- comment -->
                <label>Status:</label> <input type="text" name="status"><br><!-- comment -->
                <label>Description:</label> <input type="text" name="des"><br><!-- comment -->
                <button type="submit">Add New Product</button>
            </form>

            <!-- jQuery Validation -->
            <script type='text/javascript'>
                $(document).ready(function() {
                    $('#add-product-form').validate({
                        rules: {
                            name: {
                                required: true,
                                minlength: 2
                            },
                            price: {
                                required: true,
                                number: true
                            },
                            brand: {
                                required: true,
                                minlength: 2
                            },
                            stock: {
                                required: true,
                                digits: true
                            },
                            status: {
                                required: true,
                                minlength: 1
                            },
                            des: {
                                required: true,
                                minlength: 2
                            }
                        },
                        messages: {
                            name: {
                                required: "Please enter the product name",
                                minlength: "The product name must be at least 2 characters long"
                            },
                            price: {
                                required: "Please enter the product price",
                                number: "The product price must be a number"
                            },
                            brand: {
                                required: "Please enter the product brand",
                                minlength: "The product brand must be at least 2 characters long"
                            },
                            stock: {
                                required: "Please enter the product stock",
                                digits: "The product stock must be a whole number"
                            },
                            status: {
                                required: "Please enter the product status",
                                minlength: "The product status must be at least 2 characters long"
                            },
                            des: {
                                required: "Please enter the product description",
                                minlength: "The product description must be at least 2 characters long"
                            }
                        }
                    });
                });
            </script>
        </div>
    </body>
</html>