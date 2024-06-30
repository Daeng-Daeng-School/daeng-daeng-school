package com.ddschool.project.common.filter;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.apache.catalina.tribes.util.Arrays;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpFilter;

@WebServlet("/dog/*")
public class dogFilter extends HttpFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		chain.doFilter(request, response);
		System.out.println("필터 동작 확인");

//		로그인한 회원들만 접근가능 
		private static final Set<String> ALLOWED_PATHS = new HashSet<>( Arrays.asList("/member/login.jsp", "/member/login"));
		// 요청

	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
