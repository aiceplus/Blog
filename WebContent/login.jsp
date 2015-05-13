<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<style>
body{
	margin:0px;
}
</style>
</head>
<body style="text-align:center">
<div style="text-align:center;">
	<div style="margin:auto; width:80%; text-align:left">
		<label style="font-size:40px">Blog</label>
		<label style="color:#cc66cc">&nbsp;enjoy your life!</label>
	</div>
	<div style="margin:auto; width:80%; height:100%">
		<div style="margin:auto; width:100%; background-color:#6666ff; height:100%">
			<label style="font-size:24px">Welcome to login in Blog</label>
		</div>
		
		<div style="width:80%; margin-top:10%" >
			<form action="loginAction" method="post">
				<br />
				username:<br />
				<input id="username" type="text" name="name" style="background-color:#ffffcc; height:30px; width:200px" /><br />
				password:<br />
				<input type="password" name="psw" style="background-color:#ffffcc; height:30px; width:200px" /><br />
				<div style="width:200px;margin:auto;text-align:right">
					<a href="addUser.jsp">regist</a>
				</div>
				<br />
				<input type="submit" value="Login in" style="border:none; background-color:#6666ff; height:30px; width:200px" />
			</form>
		</div>
	</div>
	<div id="foot" style="text-align: center; margin-top:200px">
		<div style="magin: auto">
			<label>aice版权所有&copy;2015</label>
		</div>
	</div>
</div>
</body>
<script>
	document.getElementById("username").focus();
</script>
</html>