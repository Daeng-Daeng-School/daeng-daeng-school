package com.ddschool.project.dog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.ddschool.project.dog.model.service.DogService;

@WebServlet("/dog/delete")
public class DogDeleteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int dogCode = Integer.parseInt(request.getParameter("dogCode"));

        DogService dogService = new DogService();
        boolean isDeleted = dogService.deleteDog(dogCode) > 0;

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        if (isDeleted) {
            response.getWriter().write("{\"status\":\"success\"}");
        } else {
            response.getWriter().write("{\"status\":\"failure\"}");
        }
    }
}
