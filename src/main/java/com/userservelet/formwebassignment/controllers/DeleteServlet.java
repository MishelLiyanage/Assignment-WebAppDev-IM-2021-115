package com.userservelet.formwebassignment.controllers;

import java.io.IOException;
import com.userservelet.formwebassignment.model.DataManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "formServlet", value = "/delete-servlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null && !id.isEmpty()) {
            try {
                String filePath = getServletContext().getRealPath("/") + "data.xml";
                DataManager dataManager = new DataManager(filePath);
                boolean deleted = dataManager.deleteEntry(id);

                if (deleted) {
                    request.setAttribute("message", "Data deleted successfully.");
                } else {
                    request.setAttribute("message", "No entry found with ID: " + id);
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error processing request: " + e.getMessage());
            }
        } else {
            request.setAttribute("message", "ID is required.");
        }

        request.getRequestDispatcher("delete.jsp").forward(request, response);
    }
}
