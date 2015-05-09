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
<%@taglib uri="/struts-tags" prefix="s" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user center</title>
</head>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<body style="text-align:center">
	<img src="<%=session.getAttribute("headImgUrl") %>" style="width:64px; height:64px; display:inline" />
	<h1>欢迎！<%=session.getAttribute("userNiname") %></h1>
	<form action="updateUserAction" method="post" encType="multipart/form-data">
	<input type="hidden" name="basePath" value="<%=basePath %>" />
		name:<input type="text" name="name" value='<%=session.getAttribute("userName") %>' readonly="readonly" /> <br />
		niname:<input type="text" name="niname" value='<%=session.getAttribute("userNiname") %>' /> <br />
		headImgUrl:
		<input type="text" name="headImgUrl" value="<%=session.getAttribute("headImgUrl") %>" /> <br />
<%-- 		<img alt="headImg" src="<%= session.getAttribute("headImgUrl") %>" style="width:32px; height:32px" /> <br/> --%>
		select img to set headImg<input type="file" name="imgFile" /> <br/>
		age:<input type="text" name="age" value='<%=session.getAttribute("age") %>' /> <br />
		sex:<input type="text" name="sex" value='<%=session.getAttribute("sex") %>' /> <br />
		birthday:<input type="text" name="birthday" value='<%=session.getAttribute("birthday") %>' /> <br />
		address:<input type="text" name="address" value='<%=session.getAttribute("address") %>' /> <br />
		contact<input type="text" name="contact" value='<%=session.getAttribute("contact") %>' /> <br />
		password:<input type="text" name="password" value='<%=session.getAttribute("psw") %>' /> <br />
		grade:<input type="text" name="grade" value='<%=session.getAttribute("grade") %>' readonly="readonly" /> <br />
		score:<input type="text" name="score" value='<%=session.getAttribute("score") %>' readonly="readonly" /> <br />
		createTime:<input type="text" name="createTime" value='<%=session.getAttribute("createTime") %>' readonly="readonly" /> <br />
		updateTime:<input type="text" name="updateTime" value='<%=session.getAttribute("updateTime") %>' readonly="readonly"/> <br />
		id:<input type="text" name="userId" value='<%=session.getAttribute("userId") %>' readonly="readonly"/> <br />
		
		<input type="submit" value="update" />
		
	</form>
	<s:debug></s:debug>
</body>
</html>