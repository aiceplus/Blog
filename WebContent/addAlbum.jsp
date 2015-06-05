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
<style>
a {
	text-decoration: none;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="res/image/logo.ico" type="image/x-icon" />
<link rel="shortcut icon" href="res/image/logo.ico" type="image/x-icon" />
<title>addAlbum</title>
</head>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
	Album album;
	ArrayList listAlbum = (ArrayList) session.getAttribute("listAlbum");
	Iterator iterator = listAlbum.iterator();
%>
<body style="text-align: center">
	<h1>Album Add</h1>
	<form action="album/addAlbumAction" method="post">
		albumName:<input type="text" name="albumName" /> <br /> <input
			type="submit" value="add" />
	</form>
	<div style="border: 1px solid #ccffcc; text-align: left;">
		<form action="" method="post">
			<%
				while (iterator.hasNext()) {
					album = (Album) iterator.next();
					
					out.println("<input type='text' style='border:none' value='" + album.getName() + "' readonly='readonly' id='"+ "update" + album.getId() + "' />" + "(" + "<a href='#'>" + album.getCount() + "</a>" + ")");

					out.println("<a href='#' onclick='updateAlbum(" + album.getId() + ");' id='save" + album.getId() + "'>" + "update" + "</a>");

					out.println("<a href='" + basePath + "album/deleteAlbumAction?albumId=" + album.getId() + "'>" + "delete" + "</a> <br /> <br /> <hr />");
				}
			%>
		</form>
	</div>
</body>
<script type="text/javascript">
	function updateAlbum(albumId){
		var up = document.getElementById("update" + albumId);
		var sa = document.getElementById("save" + albumId);
		var albumName = up.value;
		up.readOnly = false;
		up.focus();
		up.style.border = "thin dotted #FF0000";
		if(sa.text == "save"){
			sa.href="<%=basePath%>" + "updateAlbumAction?albumId=" + albumId + "&albumName=" + albumName;
		}
		sa.innerText = "save";
	}
</script>
</html>