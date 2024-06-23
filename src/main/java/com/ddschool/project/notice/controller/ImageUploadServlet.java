package com.ddschool.project.notice.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * 이미지 업로드 처리 서블릿 예제
 */
@WebServlet("/upload_image")
@MultipartConfig
public class ImageUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 업로드된 파일 파트 가져옴
        Part filePart = request.getPart("file");
        // 업로드된 파일명 가져옴
        String fileName = getFileName(filePart);
        // 파일이 저장될 경로 설정.
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        // 업로드 디렉토리가 존재하지 않으면 생성
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        // 실제 저장될 파일 객체 생성
        File file = new File(uploadPath, fileName);
        // 업로드된 파일 저장
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
        // 업로드된 파일의 URL 생성
        String fileUrl = request.getContextPath() + "/uploads/" + fileName;
        // JSON 형식으로 응답 설정
        response.setContentType("application/json");
        response.getWriter().write("{\"location\": \"" + fileUrl + "\"}");
    }

    /**
     * Part에서 파일명을 추출하는 메서드
     *
     * @param part 업로드된 파일 파트
     * @return 추출된 파일명
     */
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String token : contentDisposition.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
