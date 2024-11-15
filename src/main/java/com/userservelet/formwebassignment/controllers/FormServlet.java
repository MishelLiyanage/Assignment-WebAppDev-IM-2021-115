package com.userservelet.formwebassignment.controllers;

import java.io.IOException;
import java.io.Serial;

import com.userservelet.formwebassignment.model.DataManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "FormServlet", value = "/FormServlet")
public class FormServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get form data the user entered
        String name = request.getParameter("name");
        String ageStr = request.getParameter("age");
        String email = request.getParameter("email");

        // Validate form data
        if (name == null || name.isEmpty() || ageStr == null || ageStr.isEmpty() || email == null || email.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required.");
            return;
        }

        int age;
        try {
            age = Integer.parseInt(ageStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Age must be a number.");
            return;
        }

        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid email format.");
            return;
        }

        // Create XML entry using DataManager
        try {
            DataManager dataManager = new DataManager(getServletContext().getRealPath("/") + "data.xml");
            dataManager.addEntry(name, age, email);
            request.setAttribute("message", "Data added successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error processing request: " + e.getMessage());
        }
    }
}