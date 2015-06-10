<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="shortcut icon" href="/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="application-name" content="reg.163.com"/>
<meta name="keywords" content=""/>
<meta name="description" content=""/>

<title>网易通行证</title>
</head>
<body style="text-align: center">
<h1>button button button</h1>
<a href="#" onclick="back();">go to login</a>
</body>
<script>
function back(){
	window.location.href = "NewFile.jsp";
}
function login(){
	var registIndex = layer.open({
		title:'regist',
		scrollbar: false,
		type:2,
		content:'NewFile.jsp',
		area: ['500px', '400px'],
	});
}
</script>
</html>
