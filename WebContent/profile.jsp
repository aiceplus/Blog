<!--
	***************
	@auto aice
	***************
	copyright 2015
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page import="com.aice.model.User" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	User user = (User)session.getAttribute("userMsg");
%>
<title>about me</title>
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
<body onload="checkUser();">
	<%
		String name = (String) session.getAttribute("userName");
		String niname = (String) session.getAttribute("userNiname");
		String headImgUrl = (String)session.getAttribute("headImgUrl");
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
			<div
				style="margin: auto; border: 2px solid #ccffff; width: 80%; height: 90%;">
				<div
					style="text-align: left; float: left; background-color: #ccffcc; height: 100%; width: 15%">
					<label style="font-size: 15px; font-weight: bold; color: #ff0000"><%=name%>的个人资料</label>
					<div id="msg" style="width: 100%; text-align:center">
						<div style="margin:auto">
						<br />
						<form action="updateHeadImg" method="post" encType="multipart/form-data" id="imgForm" name="imgForm">
							<input type="hidden" name="basePath" value="<%=basePath %>" />
							<img src='<%=user.getHeadImgUrl()%>' style="width:128px; height:128px"/><br />
							<input type="file" name="imgFile" id="imgFile" style="display:none"/>
							<a href="#" onclick="uploadImg();" id="upload">上传头像</a> <br />
						</form>
							<label style="color:#996600; font-size:10px">注册时间：<br /><%=user.getCreateTime() %></label> <br />
							<label style="color:#996600; font-size:10px">最近更新：<br /><%=user.getUpdateTime() %></label> <br />
						</div>
					</div>
				</div>
				<div style="text-align: left;">
					<label style="font-size: 20px; font-weight: bold; color: #ff0000"><%=user.getName() %></label>
					<br />
					&nbsp;blogGrade:<label style="color:red"><%=user.getGrade() %></label>&nbsp; score: <label style="color:red"><%=user.getScore() %></label>
					<div id="msgDetail">
						<br />
						<label style="font-size:20px">profile</label>&nbsp;<label style="font-size:15px"><a href="userProfile.jsp">edit</a></label> <br /><br />
						<table style="width:50%">
							<tr>
								<td>niname:</td>
								<td><%=user.getNiname() %></td>
							</tr>
							<tr>
								<td>birthday:</td>
								<td><%=user.getBirthday() %></td>
							</tr>
							<tr>
								<td>sex:</td>
								<td><%=user.getSex() %></td>
							</tr>
							<tr>
								<td>age:</td>
								<td><%=user.getAge() %></td>
							</tr>
							<tr>
								<td>address:</td>
								<td><%=user.getAddress() %></td>
							</tr>
							<tr>
								<td>contact:</td>
								<td><%=user.getContact() %></td>
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
	
	function uploadImg(){
			document.getElementById("imgFile").style.display="inline";
			flag = true;
			document.getElementById("upload").innerText="save";
			document.getElementById("upload").onclick=saveImg;
	}
	function saveImg(){
		if(document.getElementById("imgFile").value!=""){
			document.getElementById("imgForm").submit();
		}
		else{
			alert("please select img to save your headImg");
			document.getElementById("imgFile").focus();
		}
	}
</script>
</html>