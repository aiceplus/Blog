<!--
	***************
	@auto aice
	***************
	copyright 2015
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.aice.model.Blog"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String title, content, createTime, updateTime;
	int sortId,id;
	ArrayList<Blog> listBlog = new ArrayList<Blog>();
	listBlog = (ArrayList)request.getAttribute("showBlog");
	Iterator<Blog> iterator = listBlog.iterator();
	Blog blog = new Blog();
	while(iterator.hasNext()){
		blog = iterator.next();
	}
	id = blog.getId();
	title = blog.getTitle();
	content = blog.getContent();
	sortId = blog.getSortId();
	createTime = blog.getCreateTime();
	updateTime = blog.getUpdateTime();
%>
<body style="text-align:center">
	<h1>update blog</h1>
	<div style="text-align:center">
		<div style="margin:auto;width:60%">
		<form action="blog/updateBlogAction" method="post">
			<input type="hidden" name="blogId" value="<%=id %>" />
			<div style="text-align:left; height:200px" >
				title:&nbsp;<input type="text" name="title" value="<%= title%>" readonly="readonly" style="border: none"/>
				<br />
				<br />
				content:<textarea name="content" readonly="readonly" style="border: none; width:80%;height:80%"> <%=content %></textarea>
				<br />
				<br />
			</div>
		</form>
		</div>
	</div>
</body>
</html>