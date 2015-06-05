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
<link rel="icon" href="res/image/logo.ico" type="image/x-icon" />
<link rel="shortcut icon" href="res/image/logo.ico" type="image/x-icon" />
	<link rel="stylesheet" href="Scripts/editor/themes/default/default.css" />
	<script charset="utf-8" src="Scripts/editor/kindeditor-min.js"></script>
	<script charset="utf-8" src="Scripts/editor/zh_CN.js"></script>

<title>publish blog</title>

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
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	if(session.getAttribute("userId") == null){
		session.setAttribute("userId", 0);
	}
	ArrayList<Sort> listSort = new ArrayList<Sort>();
	Iterator<Sort> iteratorSort = listSort.iterator();
	listSort = (ArrayList<Sort>)session.getAttribute("listSort");
	iteratorSort = listSort.iterator();
%>
<body onload="checkUser();">
	<%
		String name = (String) session.getAttribute("userName");
		String niname = (String) session.getAttribute("userNiname");
		int id = 0;
		if (name != null) {
			id = (Integer) session.getAttribute("userId");
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
			<a href="addBlog.jsp">写日志</a> <a href="#">首页</a> <a href="#">消息(0)</a><img
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
			<div style="margin: auto; border: 2px solid #ccffff; width: 80%; height: 90%;">
				<label style="color:#996666; font-size:20px;float:left"><strong>写日志</strong></label><br /><br />
				<form action="blog/addBlogAction" method="post" name="publicForm">
				<div style="text-align: left; height: 500px;">
					title:<br /><input type="text" name="title" style="margin-left:10%" /> <br /> <br />
					content:<br />
					<div style="text-align:center; height:100%;">
						<textarea id="editor_id" name="content" style="width:100%; height:500px;"></textarea>
					</div>
					<br /> <br /> 
					sort: <select name="sortId" id="sortSelect">
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

	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			allowFileManager : true
		});
	});

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
<!-- <body style="text-align: center"> -->
<!-- 	<h1>publish blog</h1> -->
<!-- 	<div style="text-align: center"> -->
<!-- 		<div style="margin: auto; width: 60%"> -->
<!-- 			<form action="blog/addBlogAction" method="post"> -->
<!-- 				<div style="text-align: left; height: 200px"> -->
<!-- 					title:&nbsp;<input type="text" name="title" /> <br /> <br /> -->
<!-- 					content: -->
<!-- 					<textarea name="content" style="width: 80%; height: 80%"></textarea> -->
<!-- 					<br /> <br />  -->
<%-- 					sort: <select name="sortId" id="sortSelect"> --%>
<%-- 					<% --%>
<!-- // 						while(iteratorSort.hasNext()){ -->
<!-- // 							Sort sort = iteratorSort.next(); -->
<!-- // 							out.println("<option value='"+ sort.getId() + "'>" + sort.getSortName() + "</option>"); -->
<!-- // 						} -->
<%-- 					%> --%>
<%-- 					</select>  --%>
<!-- 					<br /> <br /> <br />  -->
<!-- 					<input type="submit" value="publish" /> -->
<!-- 				</div> -->
<!-- 			</form> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </body> -->
</html>