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
<script charset="utf-8" src="Scripts/jquery/jquery-2.1.1.js" ></script>
<title>user center</title>
</head>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<button onclick="showDialog();">show dialog</button>

<body>
	
</body>
<script type="text/javascript">
	function showDialog(){
		var d = dialog({
			content:'a dialog is show'
		});
		alert();
		d.show();
		setTimeout(function(){
			d.close().remove();
		}, 2000);
	}
</script>

</html>