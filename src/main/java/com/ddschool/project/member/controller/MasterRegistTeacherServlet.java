package com.ddschool.project.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.ddschool.project.ddclass.model.dto.ClassDTO;
import com.ddschool.project.ddclass.model.service.ClassService;
import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.member.model.service.MemberService;

@WebServlet("/master/teacherRegist")
public class MasterRegistTeacherServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// class 정보를 가져와서 함께 넘겨준다
		List<ClassDTO> classList = new ClassService().getClassList();
		request.setAttribute("classList", classList);
		System.out.println(classList);
		
		request.getRequestDispatcher("/WEB-INF/views/member/masterRegistTeacher.jsp").forward(request, response);
	
	}

	// 선생님 등록
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 폼데이터에서 넘어온 파라미터 정보를 꺼낸다
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String memberBirth = request.getParameter("memberBirth");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		int classCode = Integer.parseInt(request.getParameter("classCode"));
		
		// 꺼낸 정보를 Dto 객체에 담는다
		MemberDTO registMember = new MemberDTO();
		registMember.setMemberId(memberId);
		registMember.setMemberPwd(memberPwd);
		registMember.setMemberName(memberName);
		registMember.setMemberBirth(memberBirth);
		registMember.setPhone(phone);
		registMember.setAddress(address);
		registMember.setClassCode(classCode);
		registMember.setRoleCode(2);
		System.out.println(registMember);
				
		// MemberService 호출해 db 저장하여 가입 처리 후 성공여부 반환
		int result = new MemberService().registMember(registMember);
				
		if(result > 0) {
			System.out.println("등록 성공!");
			request.getSession().setAttribute("registTeacherSuccessMessage", "등록이 성공적으로 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/master/management");
		} else {
			System.out.println("등록 실패!");
			request.setAttribute("errorMessage", "등록에 실패했습니다. 다시 시도해 주세요.");
			request.getRequestDispatcher("/WEB-INF/views/member/masterRegistTeacher.jsp").forward(request, response);
		}
	
	}

}
