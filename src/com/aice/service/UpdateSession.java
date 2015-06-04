package com.aice.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.aice.db.DBConn;
import com.aice.model.Album;
import com.aice.model.Blog;
import com.aice.model.Photo;
import com.aice.model.Sort;
import com.aice.model.User;

public class UpdateSession implements ServletRequestAware{
	private HttpServletRequest request;
	private User user;
	private Sort sort;
	private ArrayList<Sort> listSort;
	private ArrayList<Blog> listBlog;
	private ArrayList<Album> listAlbum;
	private ArrayList<Photo> listPhoto;
	public User setUser(){
		user = new User();
		this.user.setId(Integer.parseInt((String)request.getParameter("userId")));
		this.user.setName((String) request.getParameter("name"));
		this.user.setNiname((String) request.getParameter("niname"));
		this.user.setPsw((String)request.getParameter("password"));
		this.user.setAge(Integer.parseInt((String)request.getParameter("age")));
		this.user.setSex(Integer.parseInt((String)request.getParameter("sex")));
		
		this.user.setHeadImgUrl((String) request.getAttribute("headImgUrl"));
		
		this.user.setBirthday((String) request.getParameter("birthday"));
		this.user.setAddress((String) request.getParameter("address"));
		this.user.setContact((String) request.getParameter("contact"));
		this.user.setGrade(Integer.parseInt((String)request.getParameter("grade")));
		this.user.setScore(Integer.parseInt((String)request.getParameter("score")));
		this.user.setCreateTime((String)request.getParameter("createTime"));
		this.user.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		return user;
	}
	
	public void setBlogSession(){
		listBlog = DBConn.queryBlogById((Integer.parseInt(request.getSession().getAttribute("userId").toString())), "USERID");
		request.getSession().setAttribute("listBlog", listBlog);
		setSortSession();
	}
	public void setUserSession(User user){
		request.getSession().setAttribute("userId", user.getId());
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
		request.getSession().setAttribute("userMsg",user);
	}
	public void setSortSession(){
		listSort = DBConn.querySortById((Integer.parseInt(request.getSession().getAttribute("userId").toString())));
		request.getSession().setAttribute("listSort", listSort);
	}
	
	public void setAlbumSession(){
		listAlbum = DBConn.queryAlbum("SELECT * FROM AICE_ALBUM WHERE USERID=" + Integer.parseInt(request.getSession().getAttribute("userId").toString()));
		request.getSession().setAttribute("listAlbum", listAlbum);
	}
	
	public void setPhotoSession(int albumId){
		String sql = "";
		if(albumId == 0)
			listPhoto = DBConn.queryPhoto("SELECT * FROM AICE_PHOTO WHERE USERID=" + Integer.parseInt(request.getSession().getAttribute("userId").toString()));
		else{
			sql = "SELECT * FROM AICE_PHOTO WHERE USERID=" + Integer.parseInt(request.getSession().getAttribute("userId").toString()) + " AND ALBUMID=" + albumId;
			listPhoto = DBConn.queryPhoto(sql);
		}
		setAlbumSession();
		request.getSession().setAttribute("listPhoto", listPhoto);
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
