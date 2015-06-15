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
<title>regist</title>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
body{
	margin:0px;
}
.txtFrm{
	background-color:#ffffcc; 
	height:30px; 
	width:200px;
}
.tips{
	color:red;
	padding-left:20px;
}
.warnTip{
	color:red;
	font-size:12px;
}
</style>
</head>
<body style="text-align:center">
<div style="text-align:center;">
			<form action="userAction" method="post" onsubmit="return validate(this);">
				<table>
					<tr>
						<td class="leftTb">username:</td>
						<td class="centerTb"><input id="username" name="name" type="text" class="txtIn" onblur="checkUsername(this.value)" /></td>
						<td class="rightTb"><label id="nametxt" style="color: red">*</label></td>
					</tr>
					<tr>
						<td class="leftTb">password:</td>
						<td class="centerTb"><input id="password" name="password" type="password" class="txtIn"  /></td>
						<td class="rightTb"><label id="pswtxt" style="color: red">*</label></td>
					</tr>
					<tr>
						<td class="leftTb">passwordConfirm:</td>
						<td class="centerTb"><input id="pswconf" name="pswconf" type="password" onblur="checkConf();" class="txtIn" /></td>
						<td class="rightTb"><label id="conpswtxt" style="color: red">*</label></td>
					</tr>
					<tr>
						<td class="leftTb"><img id="imgCode" name="imgCode" src="<%=basePath %>code/checkCode" alt="validateCode" /><img src="res/image/refrush.jpg" onclick="reloadCode();" style="width:32px; height:32px" /></td>
						<td class="centerTb"><input onblur="checkSubmitCode();" id="code" name="code" type="text" class="txtIn" /></td>
						<td class="rightTb"><label id="codetxt" style="color: red">*</label></td>
					</tr>
					<tr>
						<td class="leftTb"></td>
						<td class="centerTb"><input type="submit" value="regist" class="bt" /></td>
						<td class="rightTb"><a href="#" onclick="login();">return to login in</a></td>
					</tr>
				</table>
<!-- 				<br /> -->
<!-- 				username:<br /> -->
<!-- 				<label id="nametxt" class="warnTip"></label><br /> -->
<!-- 				<input id="username" type="text" name="name" class="txtFrm" onblur="checkUsername(this.value)"/><label class="tips">*</label><br /> -->
<!-- 				age:<br /> -->
<!-- 				<label id="agetxt" class="warnTip"></label><br /> -->
<!-- 				<input type="text" name="age" class="txtFrm" /><label class="tips">*</label><br /> -->
<!-- 				sex:<br /> -->
<!-- 				<label id="sextxt" class="warnTip"></label><br /> -->
<!-- 				<input type="text" name="sex" class="txtFrm" /><label class="tips">*</label><br /> -->
<!-- 		 		birthday:<br /> -->
<!-- 		 		<label id="birtxt" class="warnTip"></label><br /> -->
<!-- 		 		<input type="text" name="birthday" class="txtFrm" /><label class="tips">*</label><br />  -->
<!-- 				address:<br /> -->
<!-- 				<label id="addrtxt" class="warnTip"></label><br /> -->
<!-- 				<input type="text" name="address" class="txtFrm" /><label class="tips">*</label><br /> -->
<!-- 				contact:<br /> -->
<!-- 				<label id="conttxt" class="warnTip"></label><br /> -->
<!-- 				<input type="text" name="contact" class="txtFrm" /><label class="tips">*</label><br /> -->
<!-- 				password:<br /> -->
<!-- 				<label id="pswtxt" class="warnTip"></label><br /> -->
<!-- 				<input type="password" name="psw" class="txtFrm" /><label class="tips">*</label><br /> -->
<!-- 				password confirm:<br /> -->
<!-- 				<label id="conpswtxt" class="warnTip"></label><br /> -->
<!-- 				<input type="password" name="pswconf" class="txtFrm" /><label class="tips">*</label><br /> -->
<%-- 				Code:<img id="imgCode" name="imgCode" src="<%=basePath %>code/checkCode" alt="validateCode" />&nbsp;<a href="#" onclick="reloadCode();">refrush</a><br /> --%>
<!-- 				<label id="codetxt" class="warnTip"></label><br /> -->
<!-- 				<input onblur="checkSubmitCode();" id="code" type="text" name="code" style="background-color:#ffffcc; height:30px; width:200px" /><label class="tips">*</label><br /> -->
<!-- 				<br /> -->
<!-- 				<input type="submit" value="Regist" style="border:none; background-color:#6666ff; height:30px; width:200px" /><label>&nbsp;&nbsp;</label> -->
			</form>
		</div>
</body>
<script>
	document.getElementById("username").focus();
	function validate(f){
		if(!(/^\w{2,8}$/.test(f.name.value))){
			f.name.focus() ;
			document.getElementById("nametxt").innerText = "用户名必须是2~8位！";
			return false ;
		}
		if(!(/^\w{6,15}$/.test(f.psw.value))){
			document.getElementById("pswtxt").innerText = "密码必须是6~15位！";
			f.psw.focus() ;
			return false ;
		}
		if(f.psw.value != (f.pswconf.value)){
			document.getElementById("conpswtxt").innerText = "密码不一致！";
			return false ;
		}
		if(document.getElementById("code").value == "" || document.getElementById("code").value == "code wrong"){
			document.getElementById("codetxt").innerText = "请输入验证码";
			return false;
		}
	}
	var xmlHttp;
	function createXMLHttp(){
		if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}else{
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	function checkUsername(usernameSub){
		var url = '<%=basePath%>' + "user/checkUser?usernameSub=";
		createXMLHttp();
		xmlHttp.open("POST",url + usernameSub, true);
		xmlHttp.onreadystatechange = checkUseridCallback;
		xmlHttp.send(null);
		document.getElementById("nametxt").innerText = "checking...";
	}
	
	function checkSubmitCode(){
		var submitCode = document.getElementById("code").value;
		var urlCode = '<%=basePath%>' + "code/validateCode?code=" + submitCode;
		createXMLHttp();
		xmlHttp.open("POST",urlCode, true);
		xmlHttp.onreadystatechange = checkSubmitCodeCallback;
		xmlHttp.send(null);
		document.getElementById("codetxt").innerText = "validating...";
	}
	
	function checkSubmitCodeCallback(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200){
				var text = xmlHttp.responseText;
				if(text == "false"){
					document.getElementById("codetxt").innerText = "code wrong";
					document.getElementById("codetxt").style.color="red";
				}
				else{
					document.getElementById("codetxt").innerText = "code right"
					document.getElementById("codetxt").style.color="green";
				}
			}
		}
	}
	
	function checkUseridCallback(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200){
				var text = xmlHttp.responseText;
				if(!(/^\w{2,8}$/.test(document.getElementById("username").value))){
					document.getElementById("nametxt").innerText = "用户名必须是2~8位！";
				}
				else{
						if(text == "false"){
						document.getElementById("nametxt").innerText = "exist user";
						document.getElementById("nametxt").style="red";
						}else{
							document.getElementById("nametxt").innerText = "can use this name";
							document.getElementById("nametxt").style.color = "green";
						}
				}
			}
		}
	}
	function reloadCode(){
		var time = new Date().getTime();
		document.getElementById("imgCode").src="<%=basePath %>code/checkCode?time=" + time;
	}
	
	function checkConf(){
		if(document.getElementById("password").value != document.getElementById("pswconf").value){
			document.getElementById("conpswtxt").innerText = "密码不一致！";
		}
	}
	
	function login(){
		window.location.href = "login.jsp";
	}
</script>
</html>