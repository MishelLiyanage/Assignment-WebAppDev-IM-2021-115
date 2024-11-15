<%--
  Created by IntelliJ IDEA.
  User: Mishel Fernando
  Date: 11/12/2024
  Time: 8:10 AM
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Person Details Form</title>
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
        .form-container input[type="text"],
        .form-container input[type="number"],
        .form-container input[type="email"] {
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
        .message {
            text-align: center;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 4px;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Student Details Form</h2>

<%--    form to get data from the user about personal details--%>
    <form method="post" action="FormServlet">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <input type="submit" value="Submit">
    </form>

    <c:if test="${not empty message}">
        <div class="message ${message.contains('successfully') ? 'success' : 'error'}">${message}</div>
    </c:if>
</div>
</body>
</html>
