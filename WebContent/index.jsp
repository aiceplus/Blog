<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>
<%@page import="com.aice.model.Sort" %>
<title>Blog</title>
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
		int id = 0;
		if (name != null) {
			id = (Integer) session.getAttribute("userId");
		}
		Sort sort;
		ArrayList listSort = new ArrayList();
		Iterator iterator = listSort.iterator();
		if(session.getAttribute("userId") != null){
			listSort = (ArrayList)session.getAttribute("listSort");
			iterator = listSort.iterator();
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
			<a href="#">写日志</a> <a href="#">首页</a> <a href="#">消息(0)</a><img id="headImg" name="headImg" src="" style="display: none; width:32px; height:32px;"/> <a
				href="#" id="userStatus">登陆</a> <a href="exit.jsp">退出</a>
		</div>
	</div>

	<div style="text-align: center; margin-bottom: -20px">
		<div
			style="magin: auto; background-image: url('res/image/img002.jpg'); background-repeat: no-repeat; height: 200px">
		</div>
	</div>

	<div style="text-align: center; height: 100%;">
		<div
			style="magin: auto; background-image: url('res/image/img003.jpg'); background-repeat: repeat; height: 2000px">
			<div style="magin: auto">
				<ul>
					<li><a href="#" class="nav">首页</a></li>
					<li><a href="#" class="nav">日志</a></li>
					<li><a href="#" class="nav">相册</a></li>
					<li><a href="#" class="nav">关于我</a></li>
				</ul>
			</div>
			<div
				style="margin: auto; border: 2px solid #ccffff; width: 80%; height: 80%;">
				<div style="text-align: left; float: left; background-color: #ccffcc; ">
					<label style="font-size: 20px; font-weight: bold;">分类</label> <a href="addSort.jsp" style="color:black">管理</a> <br />
					<div id="sort">
						<%
						while(iterator.hasNext()){ 
							sort = 	(Sort)iterator.next();
							out.println("<a href='#'>" + sort.getSortName() + "(" + sort.getCount() + ")" + " </a> <br />");
						}
						%>
					</div>
				</div>
				<div style="text-align: left; background-color: red;">
					<label style="font-size: 20px; font-weight: bold;">日志</label> <br />
				</div>
			</div>
			Welcome
			<%=name%>
			(niname is:
			<%=niname%>,id is:
			<%=id%>) visited!
			<s:debug></s:debug>
		</div>
	</div>
	<div name="foot" style="text-align: center">
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
			document.getElementById("userStatus").href = "userProfile.jsp";
			document.getElementById("headImg").src = "<%=session.getAttribute("headImgUrl")%>";
			document.getElementById("headImg").style.display = "inline";
		}
	}
</script>
</html>