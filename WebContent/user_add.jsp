<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>new user</title>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

</head>
<body style="text-align:center">
	<form action="userAction" method="post">
		name:<input type="text" name="name" /> <br />
		niname:<input type="text" name="niname" /> <br />
		age:<input type="text" name="age" /> <br />
		sex:<input type="text" name="sex" /> <br />
		birthday:<input type="text" name="birthday" /> <br />
		address:<input type="text" name="address" /> <br />
		contact<input type="text" name="contact" /> <br />
		password:<input type="password" name="password" /> <br />
		<input type="submit" value="regist" />
	</form>
</body>
</html>