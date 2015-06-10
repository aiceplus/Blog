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
<link rel="icon" href="res/image/logo.ico" type="image/x-icon" />
<link rel="shortcut icon" href="res/image/logo.ico" type="image/x-icon" />
<script src="Scripts/jquery/jquery-2.1.1.min.js"></script>
<script src="Scripts/layer/layer.js"></script>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.aice.model.Sort"%>
<%@page import="com.aice.model.Blog"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	if(session.getAttribute("userId") == null){
		session.setAttribute("userId", 0);
	}
%>
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
		ArrayList<Sort> listSort = new ArrayList<Sort>();
		Iterator<Sort> iteratorSort = listSort.iterator();
		
		Blog blog;
		ArrayList<Blog> listBlog = new ArrayList<Blog>();
		Iterator<Blog> iteratorBlog = listBlog.iterator();
		
		if(session.getAttribute("userId") != null && session.getAttribute("listBlog") != null){
			listSort = (ArrayList<Sort>)session.getAttribute("listSort");
			iteratorSort = listSort.iterator();
			
			listBlog = (ArrayList<Blog>)session.getAttribute("listBlog");
			iteratorBlog = listBlog.iterator();
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
			<a href="addBlog.jsp" id="addBlog">写日志</a> <a href="#">首页</a> <a href="#" id="msgTib">消息(0)</a><img
				id="headImg" name="headImg" src=""
				style="display: none; width: 32px; height: 32px;" /> <a href="#"
				id="userStatus">登陆</a> <a href="exit.jsp" id="exit">退出</a>
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
					<li><a href="user/showProfile.action" class="nav">关于我</a></li>
				</ul>
			</div>
			<div
				style="margin: auto; border: 2px solid #ccffff; width: 80%; height: 90%;">
				<div
					style="text-align: left; float: left; background-color: #ccffcc; height: 100%; width: 15%">
					<label style="font-size: 20px; font-weight: bold; color: #ff0000">分类</label>
<!-- 					<a href="addSort.jsp" style="color: black">管理</a> <br /> -->
						<a href="#" onclick="addSort();" style="color: black">管理</a> <br />
					<div id="sort" style="width: 100%">
						<%
							while(iteratorSort.hasNext()){ 
								sort = 	(Sort)iteratorSort.next();
								out.println("<a href='" + basePath + "blog/sortBlogAction?sortId=" + sort.getId() + "'>" + sort.getSortName() + "(" + sort.getCount() + ")" + " </a> <br />");
							}
						%>
					</div>
				</div>
				<div style="text-align: left;">
					<label style="font-size: 20px; font-weight: bold; color: #ff0000">日志</label>
					<br />
					<div id="blog">
						<%
							while(iteratorBlog.hasNext()){
								blog = (Blog)iteratorBlog.next();
								out.println("<label style='color:#ff9900; font-size:25px'> <a href='"+ basePath + "blog/showDetailBlogAction?blogId=" + blog.getId() + "'>" + blog.getTitle() + "</a> </label> <br />");	
								out.println("<label style='color:#999999'; font-size:10px;>" + blog.getUpdateTime() + "</label> <br /><br /><br />");
								out.println("<label>" + blog.getContent() + "</label> <br /> <br />");
								out.println("<label style='font-size:10px'><a href='#'>阅读(0)</a>" + " | " + "<a href='#'>评论(0)</a>" + " | " + "<a id='updateBlog' href='" + basePath + "blog/showBlogAction?blogId=" + blog.getId() + "'>编辑</a>" + " | " + "<a href='"  + basePath + "blog/deleteBlogAction?blogId=" + blog.getId() + "'>删除</a>" + " | " + "<a href='"+ basePath + "blog/showDetailBlogAction?blogId=" + blog.getId() + "'>阅读全文</a></label>");
								out.println("<hr /> <br />");
							}
						%>
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
	if(<%=request.getParameter("needLogin")%> == "yes" && <%=name%> != "null"){
		layer.open({
					title:'login in',
					scrollbar: false,
					type:2,
					content:'login.jsp',
					area: ['500px', '300px'],
				});
	}
	function checkUser(){
		var name = '<%=name%>';
		var login = "登陆";
		
		if (name == "null") {
			document.getElementById("userStatus").innerText = login;
//  			document.getElementById("userStatus").href = "login.jsp";
 			document.getElementById("userStatus").href = "#";
			document.getElementById("userStatus").onclick = function(){
				layer.open({
					title:'Blog',
					scrollbar: false,
					type:2,
					content:'login.jsp',
					area: ['500px', '400px'],
				});
			};
			document.getElementById("addBlog").style.display="none";
			document.getElementById("msgTib").style.display="none";
			document.getElementById("exit").style.display="none";
		} else {
			document.getElementById("userStatus").innerText = name;
			document.getElementById("userStatus").href = "profile.jsp";
			document.getElementById("headImg").src = "<%=session.getAttribute("headImgUrl")%>";
			document.getElementById("headImg").style.display = "inline";
			document.getElementById("addBlog").style.display="inline";
			document.getElementById("msgTib").style.display="inline";
			document.getElementById("exit").style.display="inline";
		}
	}
	
	function addSort(){
		layer.open({
			type:2,
			content:'addSort.jsp',
			area: ['500px', '300px']
		});
	}
	
	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	if(index != undefined){
		parent.location.reload(); 
	}
	parent.layer.close(index); //再执行关闭
</script>
</html>