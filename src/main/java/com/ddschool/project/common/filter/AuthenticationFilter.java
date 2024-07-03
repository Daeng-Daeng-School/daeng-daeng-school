package com.ddschool.project.common.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ddschool.project.member.model.dto.MemberDTO;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/member/*", "/master/*", "/teacher/*", "/class/*", "/dog/*", "/notice/*"})
public class AuthenticationFilter implements Filter {
	
	Map<String, List<String>> permitURIList;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		permitURIList = new HashMap<>();
		
		List<String> masterPermitList = new ArrayList<>();
		List<String> memberPermitList = new ArrayList<>();
		List<String> teacherPermitList = new ArrayList<>();
		List<String> allPermitList = new ArrayList<>();
		
		masterPermitList.add("/master/mypage");
		masterPermitList.add("/master/management");
		masterPermitList.add("/master/teacherRegist");
		masterPermitList.add("/member/mypage");
		masterPermitList.add("/member/delete");
		masterPermitList.add("/member/update");
		masterPermitList.add("/member/getMemberInfo");
		masterPermitList.add("/master/teacherInfo");
		masterPermitList.add("/member/rejoin");
		masterPermitList.add("/class/management");
		masterPermitList.add("/class/regist");
		masterPermitList.add("/notice");
		masterPermitList.add("/notice/insert");
		masterPermitList.add("/notice/detail");
		masterPermitList.add("/notice/modify");
		masterPermitList.add("/notice/delete");
		masterPermitList.add("/notice/selectClassDog");
		masterPermitList.add("/notice/search");
		masterPermitList.add("/notice/comment");
		
		memberPermitList.add("/member/mypage");
		memberPermitList.add("/member/delete");
		memberPermitList.add("/member/update");
		memberPermitList.add("/member/getMemberInfo");
		memberPermitList.add("/dog/insert"); 
		memberPermitList.add("/dog/update");
		memberPermitList.add("/dog/select");
		memberPermitList.add("/notice");
		memberPermitList.add("/notice/insert");
		memberPermitList.add("/notice/detail");
		memberPermitList.add("/notice/modify");
		memberPermitList.add("/notice/delete");
		memberPermitList.add("/notice/selectClassDog");
		memberPermitList.add("/notice/search");
		memberPermitList.add("/notice/comment");
		
		 
		teacherPermitList.add("/teacher/mypage");
		teacherPermitList.add("/member/delete");
		teacherPermitList.add("/member/update");
		teacherPermitList.add("/member/getMemberInfo");
		teacherPermitList.add("/notice");
		teacherPermitList.add("/notice/insert");
		teacherPermitList.add("/notice/detail");
		teacherPermitList.add("/notice/modify");
		teacherPermitList.add("/notice/delete");
		teacherPermitList.add("/notice/selectClassDog");
		teacherPermitList.add("/notice/search");
		teacherPermitList.add("/notice/comment");
		
		
		allPermitList.add("/member/regist");
		allPermitList.add("/member/login");
		allPermitList.add("/member/logout");
		
		permitURIList.put("masterPermitList", masterPermitList);
		permitURIList.put("memberPermitList", memberPermitList);
		permitURIList.put("teacherPermitList", teacherPermitList);
		permitURIList.put("allPermitList", allPermitList);
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest hrequest = (HttpServletRequest) request;
		String uri = hrequest.getRequestURI();
		String intent = uri.replace(hrequest.getContextPath(), "");
		
		HttpSession requestSession = hrequest.getSession();
		MemberDTO loginMember = (MemberDTO) requestSession.getAttribute("loginMember");
		boolean isAuthorized = false;
		
		if(loginMember != null) {
			
			boolean isPermitMaster = permitURIList.get("masterPermitList").contains(intent);
			boolean isPermitMember = permitURIList.get("memberPermitList").contains(intent);
			boolean isPermitTeacher = permitURIList.get("teacherPermitList").contains(intent);
			boolean isPermitAll = permitURIList.get("allPermitList").contains(intent);
			
            if (isPermitAll) {
                isAuthorized = true;
            } else if(loginMember.getRoleCode() == 1) {
                if (isPermitMaster) {
                    isAuthorized = true;
                }
            } else if(loginMember.getRoleCode() == 2) {
                if (isPermitTeacher) {
                    isAuthorized = true;
                }
            } else if(loginMember.getRoleCode() == 3) {
                if (isPermitMember) {
                    isAuthorized = true;
                }
            }
			
			if(isAuthorized) {
				chain.doFilter(hrequest, response);
			} else {
				request.setAttribute("accessDeniedMessage", "접근 가능한 권한이 아닙니다.");
				request.getRequestDispatcher("/WEB-INF/views/common/error403.jsp").forward(request, response);
			}
			
		} else {
			
			if(permitURIList.get("allPermitList").contains(intent)) {
				chain.doFilter(hrequest, response);
			} else {
				request.setAttribute("authFailMessage", "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요!");
				request.getRequestDispatcher("/WEB-INF/views/common/failed.jsp").forward(request, response);
			}
		}
	}
}