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
<%@page import="com.aice.model.Photo"%>
<%@page import="com.aice.model.Album"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<title>photo</title>
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
		ArrayList<String> photoUrl = (ArrayList<String>)session.getAttribute("photoUrl");
		int id = 0;
		if (name != null) {
			id = (Integer) session.getAttribute("userId");
		}
		Photo photo;
		Album album;
		ArrayList<Album> listAlbum = new ArrayList<Album>();
		Iterator<Album> iteratorAlbum = listAlbum.iterator();
		Iterator<Album> iterator = listAlbum.iterator();
		
		ArrayList<Photo> listPhoto = new ArrayList<Photo>();
		Iterator<Photo> iteratorPhoto = listPhoto.iterator();
		
		Iterator<String> iteratorPhotoUrl = photoUrl.iterator();
		String[] photoUrlStrs = new String[photoUrl.size()];
		
		if(session.getAttribute("userId") != null && session.getAttribute("listAlbum") != null){
			listAlbum = (ArrayList<Album>)session.getAttribute("listAlbum");
			listPhoto = (ArrayList<Photo>)session.getAttribute("listPhoto");
			
			iteratorAlbum = listAlbum.iterator();
			iteratorPhoto = listPhoto.iterator();
			
			iterator = listAlbum.iterator();
			
			iteratorPhotoUrl = photoUrl.iterator();
			int i = 0;
			while(iteratorPhotoUrl.hasNext()){
				photoUrlStrs[i] = iteratorPhotoUrl.next();
				i ++;
			}
		}
		int urls = photoUrlStrs.length;
		int currentIndex = Integer.parseInt(request.getParameter("currentIndex"));
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
					<a href="addAlbum.jsp" style="color: black">管理</a> <br />
					<div id="album" style="width: 100%">
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
					<div id="album">
						<table style="border:1px; width:80%; text-align:center">
						<tr>
							<td><a href="#" id="previous" onclick="photoTab('previous');">previous</a>|<a  onclick="photoTab('next');" href="#" id="next">next</a></td>
						</tr>
						<tr>
							<td><img id="imgView" alt="loading" style="max-height: 860px;max-width: 860px" /></td>
						</tr>
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
	var photoIndex = <%= currentIndex%>;
	var photoUrls = new Array();
	function checkUser(){
		<%for(int i = 0; i < photoUrlStrs.length; i ++){%>
			photoUrls[<%=i%>] = '<%= photoUrlStrs[i]%>';
		<%}%>
		
		photoTab("");
		document.getElementById("imgView").src = photoUrls[photoIndex];
		
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
	function photoTab(type){
		var size = '<%=listPhoto.size()%>';
		
		if(type == "next"){
			photoIndex ++;
			document.getElementById("imgView").src = photoUrls[photoIndex];
		}
		else if(type == "previous"){
			photoIndex --;
			document.getElementById("imgView").src = photoUrls[photoIndex];
		}
		else{
			
		}
		if(photoIndex == (size - 1)){
			document.getElementById("next").style.color="#ff6600";
			document.getElementById("next").onclick="";
		}else{
			document.getElementById("next").style.color="#6600cc";
			document.getElementById("next").setAttribute("onclick","photoTab('next')");
		}
		
		if(photoIndex == 0){
			document.getElementById("previous").style.color="#ff6600";
			document.getElementById("previous").onclick = "";
		}else{
			document.getElementById("previous").style.color="#6600cc";
			document.getElementById("previous").setAttribute("onclick","photoTab('previous')");
		}
	}
</script>
</html>