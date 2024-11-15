<%--
  Created by IntelliJ IDEA.
  User: Mishel Fernando
  Date: 11/12/2024
  Time: 9:30 AM
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Data</title>
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
            border-radius: 10px;
        }
        .form-container h2 {
            text-align: center;
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
        }
        .form-container input[type="text"] {
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
            background-color: #af0101;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #af0101;
        }
        .message {
            text-align: center;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Delete Data</h2>
<%--    get id form to delete the particular record of details--%>
    <form method="post" action="delete-servlet">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required>
        <input type="submit" value="Delete">
    </form>
<%--    display the sucess and error message--%>
    <c:if test="${not empty message}">
        <div class="message ${message.contains('successfully') ? 'success' : 'error'}">${message}</div>
    </c:if>
</div>
</body>
</html>
