<!--
	***************
	@auto aice
	***************
	copyright 2015
-->
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link rel="icon" href="res/image/logo.ico" type="image/x-icon" />
<link rel="shortcut icon" href="res/image/logo.ico" type="image/x-icon" />
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.aice.model.Album"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<title>Album</title>
<style>
body {
	margin: 0px;
	background-color: #ffcc66;
}

ul {
	list-style: none;
	text-indent: inline;
}

li {
	display: inline;
}

a {
	text-decoration: none;
}

.nav {
	text-decoration: none;
	padding-right: 80px;
}
</style>
</head>
<body style="text-align:center" onload="checkUser();">
	<%
		String name = (String) session.getAttribute("userName");
		String niname = (String) session.getAttribute("userNiname");
		int id = 0;
		if (name != null) {
			id = (Integer) session.getAttribute("userId");
		}
		Album album;
		ArrayList<Album> listAlbum = new ArrayList<Album>();
		Iterator<Album> iteratorAlbum = listAlbum.iterator();
		Iterator<Album> iterator = listAlbum.iterator();
		
		if(session.getAttribute("userId") != null && session.getAttribute("listAlbum") != null){
			listAlbum = (ArrayList<Album>)session.getAttribute("listAlbum");
			iteratorAlbum = listAlbum.iterator();
			iterator = listAlbum.iterator();
		}
		
	%>
	<div
		style="text-align: right; text-vlign: center; background-color: #ffffcc; height: 40px">
		<div
			style="margin: auto; margin-left: 0px; width: 10%; font-size: 30px; float: left">
			<a href="#">aiceBlog</a>
		</div>
		<div
			style="margin: auto; margin-right: 0px; width: 30%; font-size: 20px;">
			<a href="addBlog.jsp">写日志</a> <a href="index.jsp">首页</a> <a href="#">消息(0)</a><img
				id="headImg" name="headImg" src=""
				style="display: none; width: 32px; height: 32px;" /> <a href="#"
				id="userStatus">登陆</a> <a href="exit.jsp">退出</a>
		</div>
	</div>

	<div style="text-align: center; margin-bottom: -20px">
		<div
			style="magin: auto; background-image: url('res/image/img002.jpg'); background-repeat: no-repeat; height: 200px">
		</div>
	</div>

	<div style="text-align: center; height: 100%;">
		<div
			style="magin: auto; background-image: url('res/image/img003.jpg'); background-repeat: repeat; height: 3000px">
			<div style="magin: auto">
				<ul>
					<li><a href="index.jsp" class="nav">首页</a></li>
					<li><a href="index.jsp" class="nav">日志</a></li>
					<li><a href="album.jsp" class="nav">相册</a></li>
					<li><a href="profile.jsp" class="nav">关于我</a></li>
				</ul>
			</div>
			<div
				style="margin: auto; border: 2px solid #ccffff; width: 80%; height: 90%;">
				<div
					style="text-align: left; float: left; background-color: #ccffcc; height: 100%; width: 15%">
					<label style="font-size: 20px; font-weight: bold; color: #ff0000">相册</label>
					<a href="addAlbum.jsp" style="color: black">管理</a> <a href="addPhoto.jsp">add Photo</a> <br />
					<div id="sort" style="width: 100%">
						<%
							while(iteratorAlbum.hasNext()){
								album = (Album)iteratorAlbum.next();
								out.println("<a href='" + basePath + "album/albumPhoto?albumId=" + album.getId() + "'>" + album.getName() + "(" + album.getCount() + ")" + " </a> <br />");
							}
 						%> 
					</div>
				</div>
				<div style="text-align: left;">
					<label style="font-size: 20px; font-weight: bold; color: #ff0000">照片</label>
					<br />
					<div id="album" style="text-align:center">
						<table style="border:1px; width:80%">
						<%
							int index = 0;
							while(iterator.hasNext()){
								album = (Album)iterator.next();
								if(index % 4 == 0){
									out.println("<tr><td style='width:25%'>");
									out.println("<a href='" + basePath + "album/albumPhoto?albumId=" + album.getId() + "'><img src='#' style='width:64px; height:64px' /></a> <br/>");
									out.println("<a href='" + basePath + "album/albumPhoto?albumId=" + album.getId() + "'>" + album.getName() + "(" + album.getCount() + ")" + " </a> <br />");
									out.println("</td>");
								}else{
									out.println("<td style='width:25%'>");
									out.println("<a href='" + basePath + "album/albumPhoto?albumId=" + album.getId() + "'><img src='#' style='width:64px; height:64px' /></a> <br/>");
									out.println("<a href='" + basePath + "album/albumPhoto?albumId=" + album.getId() + "'>" + album.getName() + "(" + album.getCount() + ")" + " </a> <br />");
									out.println("</td>");
								}
								index ++;
								if(index % 4 == 0){
									out.println("</tr>");
								}
							}
						%> 
						</table>
					</div>
				</div>
			</div>
			<s:debug></s:debug>
		</div>
	</div>
	<div id="foot" style="text-align: center">
		<div style="magin: auto">
			<label>aice版权所有&copy;2015</label>
		</div>
	</div>
</body>
<script type="text/javascript">
	function checkUser(){
		var name = '<%=name%>';
		var login = "登陆";
		
		if (name == "null") {
			document.getElementById("userStatus").innerText = login;
			document.getElementById("userStatus").href = "login.jsp";
		} else {
			document.getElementById("userStatus").innerText = name;
			document.getElementById("userStatus").href = "profile.jsp";
			document.getElementById("headImg").src = "<%=session.getAttribute("headImgUrl")%>";
			document.getElementById("headImg").style.display = "inline";
		}
	}
</script>
</html>