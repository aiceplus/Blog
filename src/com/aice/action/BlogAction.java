package com.aice.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.aice.db.DBConn;
import com.aice.model.Blog;
import com.aice.service.UpdateSession;
import com.opensymphony.xwork2.ActionSupport;

public class BlogAction extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request;
	private Blog blog = new Blog();

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	public String addBlog() {
		int id = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		String createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String updateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int sortId = Integer.parseInt(request.getParameter("sortId"));
		String sql = "INSERT INTO AICE_BLOG(USERID,TITLE,CONTENT,SORTID,CREATETIME,UPDATETIME) VALUES('" + id + "','" + title + "','" + content + "','" + sortId + "','" + createTime + "','"
				+ updateTime + "')";
		System.out.println("addBlog,userId" + id);
		System.out.println("sql:" + sql);
		int result = DBConn.addOrUpdateBlog(sql);
		if (result != 0) {
			DBConn.updateSortCount(sortId, 0);
			setSession();
			return SUCCESS;
		} else
			return "no";
	}
	public String queryBlog(){
		int blogId = Integer.parseInt(request.getParameter("blogId"));
		ArrayList<Blog> listBlog = new ArrayList<Blog>();
		listBlog = DBConn.queryBlogById(blogId, "ID");
		if(listBlog.size() != 0){
			request.setAttribute("showBlog", listBlog);
			return SUCCESS;
		}
		return "no";
	}
	public String queryBlogBySortId(){
		int sortId = Integer.parseInt(request.getParameter("sortId"));
		ArrayList<Blog> listBlog = new ArrayList<Blog>();
		listBlog = DBConn.queryBlogById(sortId, "SORTID");
		if(listBlog.size() != 0){
			request.getSession().setAttribute("listBlog", listBlog);
			return SUCCESS;
		}
		return "no";
	}
	public String updateBlog(){
		int id = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		int sortId = Integer.parseInt(request.getParameter("sortId"));
		int updateSortId = Integer.parseInt(request.getParameter("updateSortId"));
		int blogId = Integer.parseInt(request.getParameter("blogId"));
		String updateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String sql = "UPDATE AICE_BLOG SET TITLE='" + title + "',CONTENT='" + content + "',UPDATETIME='" + updateTime + "',SORTID=" + updateSortId + " WHERE ID=" + blogId;
		int result = DBConn.addOrUpdateBlog(sql);
		if (result != 0) {
			DBConn.updateSortCount(sortId, updateSortId);
			setSession();
			return SUCCESS;
		} else
			return "no";
	}
	public String deleteBlog(){
		int blogId = Integer.parseInt(request.getParameter("blogId"));
		String sql = "DELETE FROM AICE_BLOG WHERE ID=" + blogId;
		int result = DBConn.addOrUpdateBlog(sql);
		if (result != 0) {
			setSession();
			return SUCCESS;
		} else
			return "no";
	}
	public void showSort(){
		
	}
	public void setSession(){
		UpdateSession us = new UpdateSession();
		us.setServletRequest(request);
		us.setBlogSession();
	}
}
