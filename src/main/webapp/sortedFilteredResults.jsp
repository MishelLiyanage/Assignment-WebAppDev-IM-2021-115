<%@ page import="com.userservelet.formwebassignment.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Mishel Fernando
  Date: 11/15/2024
  Time: 6:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sorted and Filtered Results</title>
    <style>
        h2{
            margin-left: 50px;
            font-size: 30px;
            margin-top: 50px;
            text-align: center;
        }
        table {
            margin-left: 100px;
            background-color: #dce3ec;
            width: 87%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 2px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th{
            background-color: #023063;
            color: white;
        }
        tr:hover{
            background-color: #97a9bd;
        }
    </style>
</head>
<body>
<h2>Sorted and Filtered Results</h2>

<table>


    <thead>


    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Email</th>
    </tr>
    </thead>

    <%
        List<Student> entries = (List<Student>) request.getAttribute("entries");

        for (Student student : entries) {
            String id = student.getId();
            String name = student.getName();
            String age = String.valueOf(student.getAge());
            String email = student.getEmail();

    %>
    <tr>
        <td><%= id %></td>
        <td><%= name %></td>
        <td><%= age %></td>
        <td><%= email %></td>
    </tr>
    <%
        }

    %>
</table>
</body>
</html>
