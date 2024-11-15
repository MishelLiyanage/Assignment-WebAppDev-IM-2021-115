<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Navigation</title>
    <style>
        body{
            margin: 0;
            background-color: #d4e3f8;
        }
        .navbar {
            overflow: hidden;
            background-color: #020247;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<body>
<%--navigation bar to navigate between different sections of the application--%>
<div class="navbar">
    <a href="index.jsp">Home</a>
    <a href="form.jsp">Add Entry</a>
    <a href="viewData.jsp">View Data</a>
    <a href="search.jsp">Search Data</a>
    <a href="authenticateUpdate.jsp">Update Data</a>
    <a href="authenticateDelete.jsp">Delete Data</a>
    <a href="SortFilter.jsp">Sorting & Filtering Data</a>
</div>
</body>
</html>
