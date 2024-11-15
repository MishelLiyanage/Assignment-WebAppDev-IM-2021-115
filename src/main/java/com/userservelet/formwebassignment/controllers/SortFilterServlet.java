package com.userservelet.formwebassignment.controllers;

import com.userservelet.formwebassignment.model.DataManager;
import com.userservelet.formwebassignment.model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@WebServlet("/SortFilterServlet")
public class SortFilterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String sortOrder = request.getParameter("sortOrder");
        String minAgeStr = request.getParameter("minAge");
        String maxAgeStr = request.getParameter("maxAge");

        int minAge, maxAge;

        if (minAgeStr != null && !minAgeStr.isEmpty()) {
            minAge = Integer.parseInt(minAgeStr);
        } else {
            minAge = 0;
        }

        if (maxAgeStr != null && !maxAgeStr.isEmpty()) {
            maxAge = Integer.parseInt(maxAgeStr);
        } else {
            maxAge = 0;
        }

        try {
            DataManager dataManager = new DataManager(getServletContext().getRealPath("/") + "data.xml");
            List<Student> students = dataManager.getEntries();

            // Filter entries by age
            List<Student> filteredEntries = new ArrayList<>();
            for (Student student : students) {
                int age = student.getAge();
                if (age >= minAge && age <= maxAge) {
                    filteredEntries.add(student);
                }
            }

            // Sort entries by age
            if ("asc".equals(sortOrder)) {
                Collections.sort(filteredEntries, Comparator.comparingInt(Student::getAge));

            } else if ("desc".equals(sortOrder)) {
                Collections.sort(filteredEntries, Comparator.comparingInt(Student::getAge).reversed());
            }

            request.setAttribute("entries", filteredEntries);

            request.getRequestDispatcher("sortedFilteredResults.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error processing request: " + e.getMessage());
            request.getRequestDispatcher("sortFilter.jsp").forward(request, response);
        }
    }
}
