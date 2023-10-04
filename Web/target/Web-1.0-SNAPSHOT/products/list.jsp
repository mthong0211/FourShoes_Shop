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
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Manager Page</title>
    </head>
    <style>
        .clearfix {
            display: flex;
            justify-content: center;
        }
        .back {
            position: absolute;
            top: 0;
            left: 0;
            padding: 10px;
        }
        h1{
            color: white;
            margin-left: 25px;
        }
        .back a{
            text-decoration: none;
            font-size: 25px;
            font-weight: bold;
            color: whitesmoke;
            display: flex;
            align-items: center;
            margin-left: 10px;
        }

        .back a:hover{
            color:red;
            transition: all 0.3s ease 0s;
        }
        .back i {
            font-size: 25x;
            margin-right: 10px;
        }
        a.header-btn {
            display: inline-block;
            padding: 10px 10px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
            margin-left: auto;
        }
        a.header-btn:hover {
            background-color: #3e8e41;
            transform: translateY(-2px);
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
        }
        .input-group input::placeholder {
            color: whitesmoke;
            font-weight: bold;
        }
        * {
            margin: 0;
            padding: 0;

            box-sizing: border-box;
            font-family: sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url("https://wallpaperaccess.com/full/3312983.jpg");
        }

        main.table {
            width: 82vw;
            height: 90vh;
            background-color: #fff5;
            backdrop-filter: blur(7px);
            box-shadow: 0 0.4rem 0.8rem #0005;
            border-radius: .8rem;
            overflow: hidden;
        }

        .table__header {
            width: 100%;
            height: 10%;
            padding: .8rem 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .table__header h1{
            margin-top: 10px;
        }

        .table__header .input-group {
            width: 35%;
            height: 100%;
            padding: 0 .8rem;
            border-radius: 2rem;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: .2s;
            margin-left: 40px;
        }

        .table__header .input-group:hover {
            width: 45%;
            background-color: #fff8;
            box-shadow: 0 .1rem .4rem #0002;
        }
        .table__header .input-group input {
            width: 100%;
            padding: 0.8rem 0 .6rem;
            background-color: transparent;
            border: none;
            outline: none;
        }

        .table__body {
            width: 95%;
            max-height: calc(100% - 1.2rem);
            background-color: #fffb;
            margin: .8rem auto;
            border-radius: .6rem;
            overflow: auto;
            overflow: overlay;
        }

        .table__body::-webkit-scrollbar{
            width: 0.5rem;
            height: 0.5rem;
        }

        .table__body::-webkit-scrollbar-thumb{
            border-radius: .5rem;
            background-color: #0004;
            visibility: hidden;
        }

        .table__body:hover::-webkit-scrollbar-thumb{
            visibility: visible;
        }

        table {
            width: 100%;
        }

        td img {
            width: 70px;
            height: 70px;
            margin-right: .5rem;
            border-radius: 50%;
            vertical-align: middle;
        }

        table, th, td {
            border-collapse: collapse;
            padding: 1rem;
            text-align: left;
        }
        th,td{
            font-size: 17px;
        }

        thead th {
            position: sticky;
            top: 0;
            left: 0;
            background-color: #d5d1defe;
            cursor: pointer;
            text-transform: capitalize;
        }
        a.detail{
            color: black;
            text-decoration: none;
        }

        a.detail:hover {
            color: red;
        }

        tbody tr:nth-child(even) {
            background-color: #0000000;
        }

        tbody tr {
            --delay: .1s;
            transition: .5s ease-in-out var(--delay), background-color 0s;
        }

        tbody tr.hide {
            opacity: 0;
            transform: translateX(100%);
        }

        tbody tr:hover {
            background-color: #fff6 !important;
        }

        tbody tr td,
        tbody tr td p,
        tbody tr td img {
            transition: .2s ease-in-out;
        }

        tbody tr.hide td,
        tbody tr.hide td p {
            padding: 0;
            font: 0 / 0 sans-serif;
            transition: .2s ease-in-out .5s;
        }

        tbody tr.hide td img {
            width: 0;
            height: 0;
            transition: .2s ease-in-out .5s;
        }

        .status {
            padding: .4rem 0;
            border-radius: 2rem;
            text-align: center;
        }

        .status.delivered {
            background-color: #86e49d;
            color: #006b21;
        }

        .status.cancelled {
            background-color: #d893a3;
            color: #b30021;
        }

        .status.pending {
            background-color: #ebc474;
        }

        .status.shipped {
            background-color: #6fcaea;
        }


        @media (max-width: 1000px) {
            td:not(:first-of-type) {
                min-width: 12.1rem;
            }
        }

        thead th span.icon-arrow {
            display: inline-block;
            width: 1.3rem;
            height: 1.3rem;
            border-radius: 50%;
            border: 1.4px solid transparent;

            text-align: center;
            font-size: 1rem;

            margin-left: .5rem;
            transition: .2s ease-in-out;
        }

        thead th:hover span.icon-arrow{
            border: 1.4px solid #6c00bd;
        }

        thead th:hover {
            color: #6c00bd;
        }

        thead th.active span.icon-arrow{
            background-color: #6c00bd;
            color: #fff;
        }

        thead th.asc span.icon-arrow{
            transform: rotate(180deg);
        }

        thead th.active,tbody td.active {
            color: #6c00bd;
        }
        .pagination {
            float: right;
            margin: 12px 2px 5px;
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
    </style>
    <body>
        <div class="back">
            <a href="/home"> <i class="fa fa-arrow-left" aria-hidden="true"></i>Shop</a>
        </div> 
        <main class="table">
            <form method="get" action="list-product">
                <section class="table__header">
                    <h1>All products</h1>


                    <div class="input-group">
                        <input type="text" name="search" placeholder="Search...">
                        <i class="fa fa-search"></i>

                    </div>

                    <a class="header-btn" href="/add-product">Add new product</a>
                </section>
            </form>
            <section class="table__body">
                <table>
                    <thead>
                        <tr>
                            <th>ID </th>
                            <th>Name </th>
                            <th>Price </th>
                            <th>Image </th>
                            <th>Action</th>
                            <th>Action </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty list}">
                            <tr>
                                <td colspan="6" style="text-align: center;">Not found</td>
                            </tr>
                        </c:if>
                        <c:forEach var="p" items="${list}">
                            <tr>
                                <td>${p.p_id}</td>
                                <td><a class="detail" href="detail-product?pid=${p.p_id}">${p.p_name}</a></td>
                                <td><strong> $${p.price}</strong></td>
                                <td><img src="${pageContext.request.contextPath}/images/${p.image}"></td>
                                <td><a class="detail" href="update-product?p_id=${p.p_id}">Update</a></td>
                                <td><a class="detail" href="delete-product?p_id=${p.p_id}">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>
            <div class="clearfix">
                <c:forEach var="x" begin="1" end="${pageCount}" step="1">
                    <ul class="pagination">
                        <li>
                            <a href="list-product?index=${x}&search=${search}&priceFrom=${priceFrom}&priceTo=${priceTo}&sortType=${sortType}">${x}</a>
                        </li>
                    </ul>
                </c:forEach>
            </div>
        </main>
    </body>
</html>
