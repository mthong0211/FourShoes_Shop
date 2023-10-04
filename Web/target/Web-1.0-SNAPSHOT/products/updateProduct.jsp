<%-- 
    Document   : updateProduct
    Created on : Jul 7, 2023, 5:19:08 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            /* Kích thước màn hình là 1280 x 720 */
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
        .update{
            margin-top: 40px;
        }

        form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            max-height: 0 auto;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid grey;
            border-radius: 10px;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 23px;
        }

        input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        button[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button[type="submit"]:hover {
            background-color: #0062cc;
        }
    </style>
    <body>
        <div class="wrapper">
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
            <div class="update">
                <form id="update-form" method="post" action="update-product" enctype="multipart/form-data">
                    <label>ID: </label><Br>
                    <input type="text" name="id" readonly value="${p.p_id}"><br>
                    <span id="nameError"></span>
                    <label>Name:</label><br>
                    <input type="text" name="name" id="nameInput" value="${p.p_name}"><br>
                    <span id="nameError"></span>

                    <label>Price:</label><br>
                    <input type="text" name="price" id="priceInput" value="${p.price}"><br>
                    <span id="priceError"></span>

                    <label>Brand:</label><br>
                    <input type="text" name="brand" id="brandInput" value="${p.brand}"><br>
                    <span id="brandError"></span>

                    <label>Image:</label><br>
                    <input type="file" name="image"><br>

                    <label>Stock:</label><br>
                    <input type="text" name="stock" id="stockInput" value="${p.stock}"><br>
                    <span id="stockError"></span>

                    <label>Status:</label><br>
                    <input type="text" name="status" id="statusInput" value="${p.status}"><br>
                    <span id="statusError"></span>

                    <label>Description:</label><br>
                    <input type="text" name="des" id="descriptionInput" value="${p.des}"><br>
                    <span id="descriptionError"></span>

                    <button type="submit" id="submitButton">Submit</button>
                </form>
                     <script type='text/javascript'>
                $(document).ready(function () {
                    $('#update-form').validate({
                        rules: {
                            name: {
                                required: true
                            },
                            price: {
                                required: true,
                                number: true,
                                min: 0
                            },
                            brand: {
                                required: true
                            },
                            stock: {
                                required: true,
                                min: 1
                            },
                            status: {
                                required: true,
                                range: [0, 1]
                            },
                            des: {
                                required: true,
                                minlength: 10
                            }
                        },
                        messages: {
                            name: {
                                required: "Please enter the product name"
                            },
                            price: {
                                required: "Please enter the product price",
                                min: "Price must be greater than zero"
                            },
                            brand: {
                                required: "Please enter the product brand"
                            },
                            stock: {
                                required: "Please enter the product stock",
                                min: "Stock must be greater than zero"
                            },
                            status: {
                                required: "Please enter the product status",
                                range: "Status must be 0 (in stock) or 1 (out of stock)"
                            },
                            des: {
                                required: "Please enter the product description",
                                minlength: "Description must be at least 10 characters long"
                            }
                        }
                    });
                });
                $('input[type="file"]').change(function () {
                    var file = this.files[0];
                    var fileType = file.type;
                    if (fileType != "image/jpeg" && fileType != "image/png" && fileType != "image/gif") {
                        // Hiển thị thông báo lỗi
                        alert("Please choose a valid image file (JPEG, PNG or GIF)");
                        $(this).val(""); // Xóa đường dẫn tệp tải lên để người dùng chọn lại
                    }
                });
                $('form#update-form').submit(function (e) {
                    if ($('input[type=file][name=image]').val() == '') {
                        e.preventDefault();
                        alert('Please select an image file.');
                    }
                });
            </script>
            </div>
        </div>


    </body>
</html>
