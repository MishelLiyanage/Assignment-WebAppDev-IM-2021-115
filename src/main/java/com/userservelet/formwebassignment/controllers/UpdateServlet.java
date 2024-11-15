package com.userservelet.formwebassignment.controllers;

import java.io.IOException;
import java.io.Serial;

import com.userservelet.formwebassignment.model.DataManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String ageStr = request.getParameter("age");
        String email = request.getParameter("email");

        if (id != null && !id.isEmpty() && name != null && !name.isEmpty() && ageStr != null && !ageStr.isEmpty() && email != null && !email.isEmpty()) {
            try {
                int age = Integer.parseInt(ageStr);
                String filePath = getServletContext().getRealPath("/") + "data.xml";
                DataManager dataManager = new DataManager(filePath);
                dataManager.updateEntry(id, name, age, email);
                request.setAttribute("message", "Data updated successfully.");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error processing request: " + e.getMessage());
            }
        } else {
            request.setAttribute("message", "All fields are required.");
        }

        request.getRequestDispatcher("update.jsp").forward(request, response);
    }
}
