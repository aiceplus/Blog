package com.aice.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.aice.model.Blog;
import com.opensymphony.xwork2.ActionSupport;

public class BlogAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private Blog blog = new Blog();
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

}
