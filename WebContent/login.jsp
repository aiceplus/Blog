<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="/struts-tags" prefix="s"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" />
<script src="Scripts/jquery/jquery-2.1.1.min.js"></script>
<script src="Scripts/layer/layer.js"></script>
<link rel="icon" href="res/image/logo.ico" type="image/x-icon" />
<link rel="shortcut icon" href="res/image/logo.ico" type="image/x-icon" />
<title>login</title>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
a{
	text-decoration: none;
}
body{
	margin:0px;
}
.warnTip{
	color:red;
	font-size:12px;
}
</style>
</head>
<body style="text-align:center">
<div style="text-align:center;">
<!-- 	<div style="margin:auto; width:80%; text-align:left"> -->
<!-- 		<label style="font-size:40px">Blog</label> -->
<!-- 		<label style="color:#cc66cc">&nbsp;enjoy your life!</label> -->
<!-- 	</div> -->
	<div>
<!-- 		<div style="margin:auto; width:100%; background-color:#6666ff; height:100%"> -->
<!-- 			<label style="font-size:24px">Welcome to login in Blog</label> -->
<!-- 		</div> -->
		
		<div>
			<form action="loginAction" id="loginForm" method="post" onsubmit="return validate(this);">
				
				<table>
					<tr>
						<td class="leftTb">username:</td>
						<td class="centerTb"><input type="text" id="username" name="name" class="txtIn" /></td>
						<td class="rightTb"><label id="nametxt" class="warnTip" style="color: red">*</label></td>
					</tr>
					<tr>
						<td class="leftTb">password:</td>
						<td class="centerTb"><input type="password" class="txtIn" id="password" name="psw" /></td>
						<td class="rightTb"><label id="pswtxt" class="warnTip" style="color: red">*</label></td>
					</tr>
					<tr>
						<td class="leftTb"><img id="imgCode" name="imgCode" src="<%=basePath %>code/checkCode" alt="validateCode" /><img src="res/image/refrush.jpg" onclick="reloadCode();" style="width:32px; height:32px" /></td>
						<td class="centerTb"><input onblur="onlyCheckSubmitCode();" id="code" name="code" type="text" class="txtIn" /></td>
						<td class="rightTb"><label id="codetxt" class="warnTip" style="color: red">*</label></td>
					</tr>
					<tr>
						<td class="leftTb"></td>
						<td class="centerTb"><input type="button" onclick="checkSubmitCode();" value="Login in" class="bt" /></td>
						<td class="rightTb"><a onclick="regist();" href="#">regist</a></td>
					</tr>
				</table>
				
<!-- 				username: -->
<!-- 				<label id="nametxt" class="warnTip"></label><br /> -->
<!-- 				<input id="username" type="text" name="name" style="background-color:#ffffcc; height:30px; width:200px" /><br /> -->
				
<!-- 				password: -->
<!-- 				<label id="pswtxt" class="warnTip"></label><br /> -->
<!-- 				<input id="password" type="password" name="psw" style="background-color:#ffffcc; height:30px; width:200px" /><br /> -->
<!-- 				<br /> -->
<%-- 				Code:<img id="imgCode" name="imgCode" src="<%=basePath %>code/checkCode" alt="validateCode" />&nbsp;<a href="#" onclick="reloadCode();">refrush</a><br /> --%>
<!-- 				<label id="codetxt" class="warnTip"></label><br /> -->
<!-- 				<input id="code" type="text" name="code" style="background-color:#ffffcc; height:30px; width:200px" /><br /> -->
<!-- 				<div style="width:200px;margin:auto;text-align:right"> -->
<!-- 					<a href="addUser.jsp">regist</a> -->
<!-- 				</div> -->
<!-- 				<br /> -->
<!-- 				<input type="button" onclick="checkSubmitCode();" value="Login in" style="border:none; background-color:#6666ff; height:30px; width:200px" /> -->
			</form>
		</div>
	</div>
<!-- 	<div id="foot" style="text-align: center; margin-top:200px"> -->
<!-- 		<div style="magin: auto"> -->
<!-- 			<label>aice版权所有&copy;2015</label> -->
<!-- 		</div> -->
<!-- 	</div> -->
</div>
</body>
<script>
	document.getElementById("username").focus();
	
	function regist(){
		window.location.href = "addUser.jsp";
	}
	
	function keyevent(){ 
		if(event.keyCode == 13) 
			checkSubmitCode();
	} 
	document.onkeydown = keyevent; 
	function validate(f){
		if(f.name.value == ""){
			f.name.focus() ;
			document.getElementById("nametxt").innerText="no null";
			return false;
		}
		if(f.psw.value == ""){
			f.psw.focus() ;
			document.getElementById("pswtxt").innerText="no null";
			return false;
		}
		if(f.code.value == ""){
			f.code.focus() ;
			document.getElementById("code").innerText="no null";
			return false;
		}
		if(!(/^\w{2,8}$/.test(f.name.value))){
			f.name.focus() ;
			document.getElementById("nametxt").innerText = "用户名必须是2~8位！";
			return false ;
		}
		if(!(/^\w{4,15}$/.test(f.psw.value))){
			alert("密码必须是4~15位！") ;
			f.psw.focus() ;
			return false ;
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
	function onlyCheckSubmitCode(){
		var submitCode = document.getElementById("code").value;
		var urlCode = '<%=basePath%>' + "code/validateCode?code=" + submitCode;
		createXMLHttp();
		xmlHttp.open("POST",urlCode, true);
		xmlHttp.onreadystatechange = onlyCheckSubmitCodeCallback;
		xmlHttp.send(null);
		document.getElementById("codetxt").innerText = "validating...";
	}
	
	function onlyCheckSubmitCodeCallback(){
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
	
	function checkUser(){
		var name = document.getElementById("username").value;
		var psw = document.getElementById("password").value;
		var url = '<%=basePath%>' + "user/loginAction?name=" + name + "&psw=" + psw;
		createXMLHttp();
		xmlHttp.open("POST",url, true);
		xmlHttp.onreadystatechange = checkUseridCallback;
		xmlHttp.send(null);
		document.getElementById("pswtxt").innerText = "checking...";
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
					checkUser();
				}
			}
		}
	}
	function checkUseridCallback(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200){
				var text = xmlHttp.responseText;
				if(text == "false"){
					document.getElementById("pswtxt").innerText = "psw wrong";
				}
				else{
					document.getElementById("loginForm").submit();
				}
			}
		}
	}
	
	function reloadCode(){
		var time = new Date().getTime();
		document.getElementById("imgCode").src="<%=basePath %>code/checkCode?time=" + time;
	}
	
</script>
</html>