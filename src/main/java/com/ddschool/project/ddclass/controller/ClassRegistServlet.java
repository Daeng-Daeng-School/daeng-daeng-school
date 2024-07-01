package com.ddschool.project.ddclass.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.ddschool.project.ddclass.model.dto.ClassDTO;
import com.ddschool.project.ddclass.model.service.ClassService;

@WebServlet("/class/regist")
public class ClassRegistServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("반 등록하러 서블릿 도착!");
	
		String className = request.getParameter("className");
		System.out.println("서블릿에서 신규반명 확인 : " + className);
		
		int result = new ClassService().insertClass(className);
		System.out.println("서블릿에서 신규반 등록 성공여부 확인! : " + result);
		
		response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        if (result > 0) {
            out.print("{\"status\":\"success\"}");
        } else out.print("{\"status\":\"error\"}");
        
        out.flush();
	
	}

}
