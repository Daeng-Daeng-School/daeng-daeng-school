package com.ddschool.project.dog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.Collection;
import java.io.File;
import java.io.IOException;

import org.apache.ibatis.session.SqlSession;

@WebServlet("/dog/insert")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class DogInsertServlet extends HttpServlet {
	/* 반려견정보등록 클릭시 get 요청 들어와서 하는 반려견 등록폼으로 포워딩해주는 역할 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/WEB-INF/views/dog/dogInsertpage.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	}

	/* 반려견등록 폼을 작성후 post 요청을 할 경우 처리하는 역할 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String dogBreed = request.getParameter("dog_breed");
		String ClassCode = request.getParameter("dog_class");
		String Gender = request.getParameter("dog_gender");
		String dogName = request.getParameter("name");
		String birth = request.getParameter("birthdate");
		String chipNo = request.getParameter("regNumber");
		String weight = request.getParameter("weight");
		String Notes = request.getParameter("specialNotes");

//		강아지 프로필이미지 등록처리

		String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

		// 폼 데이터에서 파일 가져오기
		Collection<Part> fileParts = request.getParts();
		for (Part part : fileParts) {
			String fileName = getFileName(part);
			String filePath = uploadPath + File.separator + fileName;
			part.write(filePath);

			// 이미지 URL을 클라이언트에게 반환
			String imageUrl = request.getContextPath() + "/uploads/" + fileName;
			response.getWriter().write(imageUrl);
		}
	}

	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] tokens = contentDisp.split(";");
		for (String token : tokens) {
			if (token.trim().startsWith("filename")) {
				return token.substring(token.indexOf("=") + 2, token.length() - 1);
			}
		}
		return "";
	}

}
