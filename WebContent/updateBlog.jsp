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
<%@page import="com.aice.model.Sort"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateBlog</title>
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
	
	ArrayList<Sort> listSort = new ArrayList<Sort>();
	Iterator<Sort> iteratorSort = listSort.iterator();
	listSort = (ArrayList<Sort>)session.getAttribute("listSort");
	iteratorSort = listSort.iterator();
%>
<body style="text-align:center" onload="init();">
	<h1>update blog</h1>
	<div style="text-align:center">
		<div style="margin:auto;width:60%">
		<form action="blog/updateBlogAction" method="post">
			<input type="hidden" name="sortId" value="<%=sortId %>" />
			<input type="hidden" name="blogId" value="<%=id %>" />
			<div style="text-align:left; height:200px" >
				title:&nbsp;<input type="text" name="title" value="<%= title%>"/>
				<br />
				<br />
				content:<textarea name="content" style="width:80%;height:80%"> <%=content %></textarea>
				<br />
				<br />
				sort:
				<select id="sortId" name="updateSortId" >
					<%
						while(iteratorSort.hasNext()){
							Sort sort = iteratorSort.next();
							out.println("<option value='"+ sort.getId() + "'>" + sort.getSortName() + "</option>");
						}
					%>
				</select>
				<br />
				<br />
				<br />
				<input type="submit" value="update" />
			</div>
		</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	function init(){
		var sortId = '<%=sortId %>';
		var f = document.getElementById("sortId");
		f.value = sortId;
	}
</script>
</html>