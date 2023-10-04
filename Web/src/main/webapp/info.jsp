<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User_Information</title>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <style>
            .body {
                background: #f9f9f9 url("https://wallpaperaccess.com/full/3312983.jpg") no-repeat center center fixed;
                background-size: cover;
                font-family: "Roboto", sans-serif;
                height: 800px;
                margin: 0 auto;
            }
            span{
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 70px;
                margin-bottom: 50px;
            }
            h1{
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            table {
                border-collapse: collapse;
                width: 80%;
                margin: auto;
                border: 1px solid #ddd;
                background-color: #f2f2f2;
            }
            th, td {
                text-align: center;
                padding: 12px;
                font-size: 18px;
                border: 1px solid #ddd;
            }
            th {
                background-color: #ddd;
            }
            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
                background-color: black;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .update{
                text-align: center;
                justify-content: center;
                align-items: center;
                cursor: pointer;
            }
            .btn2{
                background-color: black;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .text-success{
                color: greenyellow;
            }
            .text-fail{
                color: red;
            }

            body {
                background: #f9f9f9;
                font-family: "Roboto", sans-serif;
            }

            .shadow {
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1) !important;
            }

            .profile-tab-nav {
                min-width: 250px;
            }

            .tab-content {
                flex: 1;
            }
            .account-tab {
                color: white;
            }

            .form-group {
                margin-bottom: 1.5rem;
            }

            .nav-pills a.nav-link {
                padding: 15px 20px;
                border-bottom: 1px solid #ddd;
                border-radius: 0;
                color: #333;
            }
            .nav-pills a.nav-link i {
                width: 20px;
            }

            .img-circle img {
                height: 100px;
                width: 100px;
                border-radius: 100%;
                border: 5px solid #fff;
            }

        </style>
    </head>
    <body>
        <div class="body">
            <button class="back-button" onclick="goBack()">Back</button>
            <form action="/UpdateI" method="post">
                <section class="py-5 my-6">
                    <div class="container">
                        <h1 class="mb-5">Account Information</h1>
                        <c:forEach var="info" items="${infoList}">
                            <div class="bg-white shadow rounded-lg d-block d-sm-flex">
                                <div class="profile-tab-nav border-right">
                                    <div class="p-4">
                                        <div class="img-circle text-center mb-3">
                                            <span class="icon"><ion-icon name="person"></ion-icon></span>
                                        </div>
                                        <h4 type="hidden" class="text-center">
                                            <input type="hidden" name="user" value="${info.user}">${info.user}
                                        </h4>
                                    </div>
                                    <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                                        <a class="nav-link active" id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
                                            <i class="fa fa-home text-center mr-1"></i> 
                                            Account
                                        </a>
                                    </div>
                                </div>
                                <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
                                    <div class="tab-pane fade show active"role="tabpanel">
                                        <h3 class="mb-4">Information</h3>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Full Name</label>
                                                    <input type="text" class="form-control" name="name" value="${info.name}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Birthday</label>
                                                    <input type="text" class="form-control" name="birthday" value="${info.birthday}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Phone</label>
                                                    <input type="text" class="form-control" name="phone" value="${info.phone}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" class="form-control" name="email" value="${info.email}">
                                                </div>
                                            </div>                              
                                        </div>
                                        <div>
                                            <p class= "text-success" >${messc}</p>
                                            <p class= "text-fail" >${mesfl}</p>
                                            <button type="submit">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </section>
            </form>
        </div>

        <script>
            function goBack() {
                window.location.href = "/home";
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>