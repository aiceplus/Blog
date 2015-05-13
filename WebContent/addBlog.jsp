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
<%@page import="com.aice.model.Sort"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
	
	ArrayList<Sort> listSort = new ArrayList<Sort>();
	Iterator<Sort> iteratorSort = listSort.iterator();
	listSort = (ArrayList<Sort>)session.getAttribute("listSort");
	iteratorSort = listSort.iterator();
%>
<body style="text-align: center">
	<h1>publish blog</h1>
	<div style="text-align: center">
		<div style="margin: auto; width: 60%">
			<form action="blog/addBlogAction" method="post">
				<div style="text-align: left; height: 200px">
					title:&nbsp;<input type="text" name="title" /> <br /> <br />
					content:
					<textarea name="content" style="width: 80%; height: 80%"></textarea>
					<br /> <br /> 
					sort: <select name="sortId" id="sortSelect">
<!-- 						<option value="1">auto</option> -->
<!-- 						<option value="2">note</option> -->
<!-- 						<option value="3">private</option> -->
					<%
						while(iteratorSort.hasNext()){
							Sort sort = iteratorSort.next();
							out.println("<option value='"+ sort.getId() + "'>" + sort.getSortName() + "</option>");
						}
					%>
					</select> 
					<br /> <br /> <br /> 
					<input type="submit" value="publish" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>