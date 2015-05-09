package com.aice.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.aice.db.DBConn;
import com.aice.service.UpdateSession;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateSortAction extends ActionSupport implements ServletRequestAware{
	HttpServletRequest request;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}
	
	public String deleteSort(){
		int id = Integer.parseInt(request.getParameter("sortId"));
		String sql = "DELETE FROM AICE_SORT WHERE ID='" + id + "'";
		int result = DBConn.deleteOrUpdateSortById(sql);
		if(result != 0){
			setMession();
			return SUCCESS;
		}
		else 
			return "no";
	}
	
	public void setMession(){
		UpdateSession us = new UpdateSession();
		us.setServletRequest(request);
		us.setSortSession();
	}
	
	public String updateSort(){
		int id = Integer.parseInt(request.getParameter("sortId"));
		int result = 0;
		String sql = "UPDATE AICE_SORT SET SORTNAME='" + request.getParameter("sortName") + "' WHERE ID='" + id + "'";
		result = DBConn.deleteOrUpdateSortById(sql);
		if(result != 0){
			setMession();
			return SUCCESS;
		}
		else 
			return "no";
	}
}
