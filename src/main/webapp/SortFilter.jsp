<%--
  Created by IntelliJ IDEA.
  User: Mishel Fernando
  Date: 11/15/2024
  Time: 5:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sort and Filter Students</title>
    <style>
        .form-container {
            background-color: #9fafc1;
            width: 300px;
            margin-left: 580px;
            margin-top: 150px;
            padding-left: 20px;
            padding-right: 20px;
            padding-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container h2 {
            text-align: center;
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
        }
        .form-container select,
        .form-container input[type="number"] {
            width: 95%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            background-color: #010150;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #010150;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Sort and Filter Data</h2>
    <form method="post" action="SortFilterServlet">
        <label for="sortOrder">Sort by Age:</label>
        <select id="sortOrder" name="sortOrder">
            <option value="asc">Ascending</option>
            <option value="desc">Descending</option>
        </select>

        <label for="minAge">Minimum Age:</label>
        <input type="number" id="minAge" name="minAge">

        <label for="maxAge">Maximum Age:</label>
        <input type="number" id="maxAge" name="maxAge">

        <input type="submit" value="Apply">
    </form>
</div>
</body>
</html>
