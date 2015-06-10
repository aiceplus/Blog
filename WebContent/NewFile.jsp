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
<%@taglib uri="/struts-tags" prefix="s"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="res/image/logo.ico" type="image/x-icon" />
<link rel="shortcut icon" href="res/image/logo.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/style.css" />
<script src="Scripts/jquery/jquery-2.1.1.min.js"></script>
<script src="Scripts/layer/layer.js"></script>
<title>user center</title>
</head>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!-- <button onclick="showDialog();">show dialog</button> -->

<body class="loginBody">
	<label id="top"></label>
	<input type="button" value="regist" onclick="regist();" />
	<input type="button" value="login" onclick="login();" />
	<table>
		<tr>
			<td class="leftTb">username:</td>
			<td class="centerTb"><input type="text" class="txtIn" /></td>
			<td class="rightTb"><label style="color: red">*</label></td>
		</tr>
		<tr>
			<td class="leftTb">password:</td>
			<td class="centerTb"><input type="text" class="txtIn" /></td>
			<td class="rightTb"><label style="color: red">*</label></td>
		</tr>
		<tr>
			<td class="leftTb">passwordConfirm:</td>
			<td class="centerTb"><input type="text" class="txtIn" /></td>
			<td class="rightTb"><label style="color: red">*</label></td>
		</tr>
		<tr>
			<td class="leftTb"><img alt="loading" src="" /></td>
			<td class="centerTb"><input type="text" class="txtIn" /></td>
			<td class="rightTb"><label style="color: red">*</label></td>
		</tr>
		<tr>
			<td class="leftTb"></td>
			<td class="centerTb"><input type="button" value="regist" class="bt" /></td>
			<td class="rightTb"><a href="#" onclick="login();">return to login in</a></td>
		</tr>
	</table>
	<label id="label"></label>
</body>
<script type="text/javascript">
	layer.tips('只想提示地精准些', '#label');
	function regist(){
		var registIndex = layer.open({
			title:'regist',
			scrollbar: false,
			type:2,
			content:'NewFile.jsp',
			area: ['500px', '400px'],
		});
	}
	function login(){
		window.location.href = "login.jsp";
	}
</script>

</html>