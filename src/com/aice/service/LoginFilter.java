package com.aice.service;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter extends HttpServlet implements Filter{
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doFilter(ServletRequest sRequest, ServletResponse sResponse, FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)sRequest;
		HttpServletResponse response = (HttpServletResponse)sResponse;
		HttpSession session = request.getSession();
		String url = request.getServletPath();
		String contextPath = request.getContextPath();
		if(url.equals(""))url += "/";
		if(url.startsWith("/") && !url.startsWith("/login")){
			String id = (String)session.getAttribute("userId");
			if(id == null){
				response.sendRedirect(contextPath + "/login.jsp");
				return;
			}
		}
		filterChain.doFilter(sRequest, sResponse);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
