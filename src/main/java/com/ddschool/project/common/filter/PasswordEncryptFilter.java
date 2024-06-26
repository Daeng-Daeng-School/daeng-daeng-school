package com.ddschool.project.common.filter;

import java.io.IOException;

import com.ddschool.project.common.wrapper.EncryptRequestWrapper;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;

@WebFilter(urlPatterns = {"/member/*", "/master/*"})
public class PasswordEncryptFilter extends HttpFilter implements Filter {
       
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("필터 동작 확인");
		
		// 요청이 온 경로 확인
		HttpServletRequest hrequest = (HttpServletRequest) request;
		String uri = hrequest.getRequestURI();
		System.out.println("[Filter] requestURI : " + uri);
		
		String intent = uri.substring(uri.lastIndexOf("/"));
		System.out.println("[Filter] intent : " + intent);
		
		// 회원가입 요청 경로라면 암호화 래퍼로 보낸다
		if("/regist".equals(intent) || "/teacherRegist".equals(intent)) {
			EncryptRequestWrapper wrapper = new EncryptRequestWrapper(hrequest);
			chain.doFilter(wrapper, response);
			
		// 회원가입 요청 경로가 아니라면 아무것도 하지않고 그냥 보낸다	
		} else {
			System.out.println("필터확인 : 회원가입 요청이 아니군! 패스~");
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
