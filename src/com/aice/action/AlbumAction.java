package com.aice.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.aice.db.DBConn;
import com.aice.model.Album;
import com.aice.service.UpdateSession;
import com.opensymphony.xwork2.ActionSupport;

public class AlbumAction extends ActionSupport implements ServletRequestAware {
	private int userId;
	private Album album = new Album();
	HttpServletRequest request;

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	public String addAlbum() {
		userId = (Integer) request.getSession().getAttribute("userId");
		System.out.println(userId);
		int result = 0;
		album.setUserId(userId);
		album.setName(request.getParameter("albumName"));
		album.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		album.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		album.setCount(0);
		DBConn.album = this.album;
		String sql = "INSERT INTO AICE_ALBUM(USERID,ALBUMNAME,COUNT,CREATETIME,UPDATETIME) VALUES(?,?,?,?,?)";
		result = DBConn.addAlbum(sql);
		if (result != 0){
			setMession();
			return SUCCESS;
		}
		else
			return "no";
	}

	public String queryAlbum() {
		// UpdateSession us = new UpdateSession();
		// us.setServletRequest(request);
		// us.setAlbumSession();
		return SUCCESS;
	}

	public String updateAlbum() {
		int id = Integer.parseInt(request.getParameter("albumId"));
		int result = 0;
		String sql = "UPDATE AICE_ALBUM SET ALBUMNAME='" + request.getParameter("albumName") + "' WHERE ID='" + id + "'";
		result = DBConn.deleteOrUpdateAlbumById(sql);
		if (result != 0) {
			setMession();
			return SUCCESS;
		} else
			return "no";
	}
	public String deleteAlbum(){
		int id = Integer.parseInt(request.getParameter("albumId"));
		int result = 0;
		String sql = "DELETE FROM AICE_ALBUM WHERE ID=" + id;
		result = DBConn.deleteOrUpdateAlbumById(sql);
		if (result != 0) {
			setMession();
			return SUCCESS;
		} else
			return "no";
	}
	public void setMession() {
		UpdateSession us = new UpdateSession();
		us.setServletRequest(request);
		us.setAlbumSession();
	}
}
