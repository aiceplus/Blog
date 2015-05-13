package com.aice.action;


import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.aice.db.DBConn;
import com.aice.model.Blog;
import com.aice.model.Sort;
import com.aice.model.User;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private String name;
	private String psw;
	private int id = 0;
	private User user;
	public ArrayList<Sort> listSort;
	private ArrayList<Blog> listBlog;
	
	@Override
	public String execute(){
		return "";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String checkUser(){
		name = request.getParameter("name");
		psw = request.getParameter("psw");
		System.out.println(name + ":" + psw);
		String sql = "SELECT ID FROM AICE_USER WHERE name='" + name + "' AND psw='" + psw + "'";
		id = DBConn.checkUser(sql);
		if(id == 0){
			return "no";
		}
		else{
			user = DBConn.queryById(id);
			setMsgSession(user);
			return SUCCESS;
		}
	}
	
	public void setMsgSession(User user){
		System.out.println("print" + user.getId());
		request.getSession().setAttribute("userId", user.getId());
		
		//set listSort attribute
		int id = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		listSort = DBConn.querySortById(id);
		request.getSession().setAttribute("listSort", listSort);
		//set listBlog attribute
		listBlog = DBConn.queryBlogById(id, "USERID");
		request.getSession().setAttribute("listBlog", listBlog);
		
		request.getSession().setAttribute("userName", user.getName());
		request.getSession().setAttribute("userNiname", user.getNiname());
		request.getSession().setAttribute("psw", user.getPsw());
		request.getSession().setAttribute("age", user.getAge());
		request.getSession().setAttribute("sex", user.getSex());
		request.getSession().setAttribute("headImgUrl", user.getHeadImgUrl());
		request.getSession().setAttribute("birthday", user.getBirthday());
		request.getSession().setAttribute("address", user.getAddress());
		request.getSession().setAttribute("contact", user.getContact());
		request.getSession().setAttribute("grade", user.getGrade());
		request.getSession().setAttribute("score", user.getScore());
		request.getSession().setAttribute("createTime", user.getCreateTime());
		request.getSession().setAttribute("updateTime", user.getUpdateTime());
		
	}
}
