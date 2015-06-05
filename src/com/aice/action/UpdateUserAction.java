package com.aice.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.aice.db.DBConn;
import com.aice.model.User;
import com.aice.service.UpdateSession;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateUserAction extends ActionSupport implements ServletRequestAware {
	HttpServletRequest request;
	private User user;
	private String newFileName = "";

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String updateUser() {
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		
//		saveImg(userId);
//		String headImgUrl = request.getParameter("basePath") + "res/upload/" + userId + "/" + newFileName;
//		request.setAttribute("headImgUrl", headImgUrl);
		
		int id = (Integer) (request.getSession().getAttribute("userId"));

		UpdateSession us = new UpdateSession();
		us.setServletRequest(request);

		DBConn.user = us.setUser();
		this.user = DBConn.user;
		int result = DBConn.updateById(id);

		us.setUserSession(user);
		if (result == 0) {
			return "no";
		} else {
			return SUCCESS;
		}
	}
	public String saveHeadImg(){
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		saveImg(userId);
		String headImgUrl = request.getParameter("basePath") + "res/upload/" + userId + "/" + newFileName;
		int result = DBConn.saveHeadImg("UPDATE AICE_USER SET HEADIMGURL=? WHERE ID=" + userId, headImgUrl);
		request.setAttribute("headImgUrl", headImgUrl);
		request.getSession().setAttribute("headImgUrl", headImgUrl);
		if(result != 0)
			return SUCCESS;
		else
			return "no";
	}
	public void saveImg(int userId) {
		
		String savePath = "D:\\Java\\Java Project\\blog4j\\Blog\\WebContent\\res\\upload\\" + userId + "\\";
		System.out.println(savePath);
		File f = new File(savePath);
		f.mkdir();

		MultiPartRequestWrapper wrapper = (MultiPartRequestWrapper) request;
		File file = wrapper.getFiles("imgFile")[0];
		String fileName = wrapper.getFileNames("imgFile")[0];
		// 检查文件大小
		// if (file.length() > maxSize) {
		// String temStr = "上传文件大小超过限制。";
		// this.writeResponse(response, temStr);
		// return "no";
		// }
		// 检查扩展名
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		// if (!Arrays.<String> asList(extMap.get(dirName).split(",")).contains(
		// fileExt)) {
		// String temStr = "上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName)
		// + "格式。";
		// this.writeResponse(response, temStr);
		// return;
		// }

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "_" + request.getSession().getAttribute("userId") + "." + fileExt;

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
}
