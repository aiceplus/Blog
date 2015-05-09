package com.aice.action;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.aice.db.DBConn;
import com.aice.model.Sort;
import com.aice.service.UpdateSession;
import com.opensymphony.xwork2.ActionSupport;

public class SortAction extends ActionSupport implements ServletRequestAware{
	private Sort sort = new Sort();
	private int userId;
	private HttpServletRequest request;
	

	public Sort getSort() {
		return sort;
	}
	public void setSort(Sort sort) {
		this.sort = sort;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String addSort(){
		userId = (Integer) request.getSession().getAttribute("userId");
		System.out.println(userId);
		int result = 0;
		sort.setUserid(userId);
		sort.setSortName(request.getParameter("sortName"));
		sort.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		sort.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		sort.setCount(0);
		String sql = "INSERT INTO AICE_SORT(USERID,SORTNAME,CREATETIME,UPDATETIME,COUNT) VALUES(?,?,?,?,?)";
		DBConn.sort = this.sort;
		result = DBConn.addSort(sql);
		if(result == 0)
			return "no";
		else{
			UpdateSession us = new UpdateSession();
			us.setServletRequest(request);
			us.setSortSession();
			return SUCCESS;
		}
	}
	
}
