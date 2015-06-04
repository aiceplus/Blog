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
<%@page import="com.aice.model.Album"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
	margin:0px;
}
</style>
</head>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
	ArrayList<Album> listAlbum = new ArrayList<Album>();
	Iterator<Album> iteratorAlbum = listAlbum.iterator();
	listAlbum = (ArrayList<Album>)session.getAttribute("listAlbum");
	iteratorAlbum = listAlbum.iterator();
	
%>
<body style="text-align:center">
	<form action="photo/addPhoto" method="post" encType="multipart/form-data">
	<input type="hidden" value="<%=basePath %>" name="basePath" />
	<div style="text-align:center">
		<div style="margin:auto">
			select album:
			<select name="albumId">
			<%
						while(iteratorAlbum.hasNext()){
							Album album = iteratorAlbum.next();
							out.println("<option value='"+ album.getId() + "'>" + album.getName() + "</option>");
						}
					%>
			</select>
			<a href="#">create new album</a>
		</div>
		<div style="margin:auto">
			select photo:
			<input type="file" name="imgFile" />
		</div>
		
		<div style="margin:auto">
			<input type="submit" value="upload" />
		</div>
	</div>
	</form>
</body>
</html>