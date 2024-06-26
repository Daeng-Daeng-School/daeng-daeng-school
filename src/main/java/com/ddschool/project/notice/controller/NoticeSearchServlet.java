package com.ddschool.project.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.sound.midi.Soundbank;

import com.ddschool.project.notice.model.dto.NoticeDTO;
import com.ddschool.project.notice.model.service.NoticeService;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/notice/search")
public class NoticeSearchServlet extends HttpServlet {
    
    private NoticeService noticeService = new NoticeService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        System.out.println(keyword);
        List<NoticeDTO> noticeList = noticeService.searchNotices(keyword);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(noticeList);

        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}
