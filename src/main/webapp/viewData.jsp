<%--
  Created by IntelliJ IDEA.
  User: Mishel Fernando
  Date: 11/12/2024
  Time: 9:20 AM
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File, javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Data</title>
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
<h2>Student Details</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Email</th>
    </tr>
    <%
        try {
            File xmlFile = new File(application.getRealPath("/") + "data.xml");
            if (xmlFile.exists()) {
                DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
                Document doc = dBuilder.parse(xmlFile);
                doc.getDocumentElement().normalize();

                NodeList nList = doc.getElementsByTagName("entry");

                for (int temp = 0; temp < nList.getLength(); temp++) {
                    Element entry = (Element) nList.item(temp);
                    String id = entry.getAttribute("id");
                    String name = entry.getElementsByTagName("name").item(0).getTextContent();
                    String age = entry.getElementsByTagName("age").item(0).getTextContent();
                    String email = entry.getElementsByTagName("email").item(0).getTextContent();
    %>
    <tr>
        <td><%= id %></td>
        <td><%= name %></td>
        <td><%= age %></td>
        <td><%= email %></td>
    </tr>
    <%
                }
            } else {
                System.out.println("<tr><td colspan='4'>No data found.</td></tr>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
