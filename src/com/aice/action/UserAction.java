package com.aice.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.aice.db.DBConn;
import com.aice.model.Sort;
import com.aice.model.User;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements ServletRequestAware{

	private int id;
	private String name;
	private String niname;
	private int age;
	private int sex;
	private String headImgUrl;
	private String birthday;
	private String address;
	private String contact;
	private String psw;
	private int grade;
	private int score;
	private String createTime;
	private String updateTime;
	private User user = new User();
	private HttpServletRequest request;
	private List<Sort> sortList;
//	public UserAction(){
//		System.out.println("construct");
//	}

	public String addUser(){
		initUserMsg();
		user.setName(name);
		user.setAge(age);
		user.setNiname(niname);
		user.setPsw(psw);
		user.setAge(age);
		user.setSex(sex);
		user.setHeadImgUrl(headImgUrl);
		user.setBirthday(birthday);
		user.setAddress(address);
		user.setContact(contact);
		user.setGrade(grade);
		user.setScore(score);
		user.setCreateTime(createTime);
		user.setUpdateTime(updateTime);
		DBConn.user = this.user;
		String sql = "INSERT INTO AICE_USER(name,niname,psw,age,sex,headImgUrl,birthday,address,contact,grade,score,createTime,updateTime) VALUE(?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		int temp = DBConn.insertUser(sql);
		id = DBConn.queryId("SELECT ID FROM AICE_USER WHERE name='" + user.getName() + "' AND niname='" + user.getNiname() + "'");
		request.getSession().setAttribute("userId", id);
		request.getSession().setAttribute("userName", user.getName());
		request.getSession().setAttribute("userNiname", user.getNiname());
		return "accept";
	}
	public String updateUser(){
		initUserMsg();
		return "update";
	}
	public void initUserMsg(){
		
		this.name = (String) request.getParameter("name");
		this.niname = (String) request.getParameter("niname");
		this.psw = (String)request.getParameter("password");
		this.age = Integer.parseInt((String)request.getParameter("age"));
		this.sex = Integer.parseInt((String)request.getParameter("sex"));
		this.headImgUrl = "temp";
		this.birthday = (String) request.getParameter("birthday");
		this.address = (String) request.getParameter("address");
		this.contact = (String) request.getParameter("contact");
		this.grade = 0;
		this.score = 0;
		this.createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		this.updateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
