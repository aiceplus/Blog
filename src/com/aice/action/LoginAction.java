package com.aice.action;


import java.io.InputStream;
import java.io.StringBufferInputStream;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.aice.db.DBConn;
import com.aice.model.Album;
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
	private ArrayList<Album> listAlbum;
	private InputStream inputStream = null;
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
			inputStream = new StringBufferInputStream("false");
			return "no";
		}
		else{
			System.out.println("id:" + id);
			user = DBConn.queryById(id);
			setMsgSession(user);
			return SUCCESS;
		}
	}
	
	public void setMsgSession(User user){
		request.getSession().setAttribute("userId", user.getId());
		//set listSort attribute
		int id = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		listSort = DBConn.querySortById(id);
		request.getSession().setAttribute("listSort", listSort);
		//set listBlog attribute
		listBlog = DBConn.queryBlogById(id, "USERID");
		request.getSession().setAttribute("listBlog", listBlog);
		//set listAlbum attribute
		listAlbum = DBConn.queryAlbum("SELECT * FROM AICE_ALBUM WHERE USERID=" + user.getId());
		request.getSession().setAttribute("listAlbum", listAlbum);
		
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
		request.getSession().setAttribute("userMsg", this.user);
		
	}
}
