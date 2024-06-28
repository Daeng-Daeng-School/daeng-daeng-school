package com.ddschool.project.common.wrapper;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;

public class EncryptRequestWrapper extends HttpServletRequestWrapper {

	public EncryptRequestWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		
		System.out.println("래퍼 도착!");
		
		if("memberPwd".equals(name)) {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			System.out.println(passwordEncoder.encode(super.getParameter(name)));
			return passwordEncoder.encode(super.getParameter(name));
			
		} else {
			return super.getParameter(name);
		}
		
	}
}
