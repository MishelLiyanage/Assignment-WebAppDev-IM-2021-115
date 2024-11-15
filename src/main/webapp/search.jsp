<%--
  Created by IntelliJ IDEA.
  User: Mishel Fernando
  Date: 11/12/2024
  Time: 9:23 AM
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File, javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Data</title>
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
    <h2>Search Data</h2>
<%--    search particular record of details using the name user enters--%>
    <form method="post" action="search.jsp">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <input type="submit" value="Search">
    </form>

    <%
        // get the name from the parameters of the request
        String searchName = request.getParameter("name");

        // the parameter value should not be empty
        if (searchName != null && !searchName.isEmpty()) {
            try {
                //create a FIle object that point to the data.xml file
                File xmlFile = new File(application.getRealPath("/") + "data.xml");
                if (xmlFile.exists()) {
                    // Create a DocumentBuilderFactory and a DocumentBuilder then parse XML and normalize the document
                    DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                    DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
                    Document doc = dBuilder.parse(xmlFile);
                    doc.getDocumentElement().normalize();

                    //get a list of all <entry> elements in the document
                    NodeList nList = doc.getElementsByTagName("entry");
                    boolean found = false;

                    //loop through the list and check each name to find the entry with the searched name
                    for (int temp = 0; temp < nList.getLength(); temp++) {
                        Element entry = (Element) nList.item(temp);
                        String name = entry.getElementsByTagName("name").item(0).getTextContent();

                        //chech whether the searched name is equal to the name in the entry
                        if (name.equalsIgnoreCase(searchName)) {
                            // if yes - get the id, age and the email address to display
                            String id = entry.getAttribute("id");
                            String age = entry.getElementsByTagName("age").item(0).getTextContent();
                            String email = entry.getElementsByTagName("email").item(0).getTextContent();
                            found = true;
    %>
<%--    display the id, name age and the email address--%>
    <h3>Search Result</h3>
    <p>ID: <%= id %></p>
    <p>Name: <%= name %></p>
    <p>Age: <%= age %></p>
    <p>Email: <%= email %></p>
    <%
                        }
                    }
                    //if the searched name is not equal to the user entered name
                    if (!found) {
                        request.setAttribute("message", "No data found for the name: " + searchName);
                    }
                // if the file did not find
                } else {
                    request.setAttribute("message", "No data found.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error processing request: " + e.getMessage());
            }
        }
    %>

    <%--    display the sucess and error message--%>
    <c:if test="${not empty message}">
        <div class="message ${message.contains('successfully') ? 'success' : 'error'}">${message}</div>
    </c:if>
</div>
</body>
</html>
