package com.aice.service;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

public class ImgCode extends ActionSupport implements ServletRequestAware, ServletResponseAware{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private StringBuffer sb;
	private ByteArrayInputStream inputStream;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String checkCode(){
		BufferedImage bi = new BufferedImage(100, 40, BufferedImage.TYPE_INT_BGR);
		Graphics g = bi.getGraphics();
		Color c = new Color(103, 101, 255);
		g.setColor(c);
		g.fillRect(0, 0, 100, 40);
		char[] ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
		Random r = new Random();
		int len = ch.length;
		int index;
		sb = new StringBuffer();
		for(int i = 0; i < 4; i ++){
			index = r.nextInt(len);
			g.setColor(new Color(r.nextInt(88), r.nextInt(188), r.nextInt(255)));
			g.setFont(new Font("terminal", 180, 40));
			g.drawString(ch[index] + "", (i*20) + 3, 40);
			sb.append(ch[index]);
		}
		request.getSession().setAttribute("code", sb.toString().toLowerCase());
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		ImageOutputStream imageOut = null;
		try {
			imageOut = ImageIO.createImageOutputStream(output);
			
			ImageIO.write(bi, "JPEG", imageOut);
			
			imageOut.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		ByteArrayInputStream input = new ByteArrayInputStream(output.toByteArray());
		this.setInputStream(input);
		return SUCCESS;
	}
	public String validateCode(){
		String sbCode = (String)request.getSession().getAttribute("code");
		String submitCode = (String)request.getParameter("code").toLowerCase();
		if(sbCode.equals(submitCode))
			return SUCCESS;
		else
			return "no";
	}
	
	public ByteArrayInputStream getInputStream(){
		return inputStream;
	}
	public void setInputStream(ByteArrayInputStream inputStream){
		this.inputStream = inputStream;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
}
