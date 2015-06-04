package com.aice.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.aice.db.DBConn;
import com.aice.model.Photo;
import com.aice.service.UpdateSession;
import com.opensymphony.xwork2.ActionSupport;

public class PhotoAction extends ActionSupport implements ServletRequestAware{
	private Photo photo;
	private HttpServletRequest request;
	private ArrayList<Photo> listPhoto;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String queryAll(){
		setSession(0);
		return SUCCESS;
	}
	
	public String albumPhoto(){
		int albumId = Integer.parseInt(request.getParameter("albumId"));
		setSession(albumId);
		return SUCCESS;
	}
	
	private String url = "";
	private String photoName = "";
	public String addPhoto(){
		int albumId = Integer.parseInt(request.getParameter("albumId"));
		int userId = (Integer) request.getSession().getAttribute("userId");
		String createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String updateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		savePhoto(userId, albumId);
		int result = 0;
		result = DBConn.addPhoto(albumId, userId, url, photoName, createTime, updateTime);
		if(result != 0){
			DBConn.updateAlbumCount(albumId, albumId);
			setSession(0);
			return SUCCESS;
		}
		else 
			return "no";
	}
	
	public void savePhoto(int userId, int albumId){
		String savePath = "D:\\Java\\Java Project\\blog4j\\Blog\\WebContent\\res\\upload\\"+ userId + "\\";
		File f = new File(savePath);
		f.mkdir();
		MultiPartRequestWrapper wrapper = (MultiPartRequestWrapper) request;
		File file = wrapper.getFiles("imgFile")[0];
		String fileName = wrapper.getFileNames("imgFile")[0];
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
		
		url = request.getParameter("basePath") + "res/upload/"+ userId + "/" + newFileName;
		photoName = newFileName;
		
		try {
			InputStream in = new FileInputStream(file);
			File uploadFile = new File(savePath, newFileName);
			OutputStream out = new FileOutputStream(uploadFile);
			byte[] buffer = new byte[1024 * 1024];
			int length;
			while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}
			in.close();
			out.close();
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
	public void setSession(int albumId){
		UpdateSession us = new UpdateSession();
		us.setServletRequest(request);
		us.setPhotoSession(albumId);
	}
	
	
}
