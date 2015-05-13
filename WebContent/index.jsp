<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.aice.model.Sort"%>
<%@page import="com.aice.model.Blog"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
			<a href="addBlog.jsp">д��־</a> <a href="#">��ҳ</a> <a href="#">��Ϣ(0)</a><img
				id="headImg" name="headImg" src=""
				style="display: none; width: 32px; height: 32px;" /> <a href="#"
				id="userStatus">��½</a> <a href="exit.jsp">�˳�</a>
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
					<li><a href="#" class="nav">��ҳ</a></li>
					<li><a href="#" class="nav">��־</a></li>
					<li><a href="#" class="nav">���</a></li>
					<li><a href="#" class="nav">������</a></li>
				</ul>
			</div>
			<div
				style="margin: auto; border: 2px solid #ccffff; width: 80%; height: 90%;">
				<div
					style="text-align: left; float: left; background-color: #ccffcc; height: 100%; width: 15%">
					<label style="font-size: 20px; font-weight: bold; color: #ff0000">����</label>
					<a href="addSort.jsp" style="color: black">����</a> <br />
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
					<label style="font-size: 20px; font-weight: bold; color: #ff0000">��־</label>
					<br />
					<div id="blog">
						<%
							while(iteratorBlog.hasNext()){
																blog = (Blog)iteratorBlog.next();
																out.println("<label style='color:#ff9900; font-size:25px'> <a href='"+ basePath + "blog/showDetailBlogAction?blogId=" + blog.getId() + "'>" + blog.getTitle() + "</a> </label> <br />");	
																out.println("<label style='color:#999999'; font-size:10px;>" + blog.getUpdateTime() + "</label> <br /><br /><br />");
																out.println("<label>" + blog.getContent() + "</label> <br /> <br />");
																out.println("<label style='font-size:10px'><a href='#'>�Ķ�(0)</a>" + " | " + "<a href='#'>����(0)</a>" + " | " + "<a id='updateBlog' href='" + basePath + "blog/showBlogAction?blogId=" + blog.getId() + "'>�༭</a>" + " | " + "<a href='"  + basePath + "blog/deleteBlogAction?blogId=" + blog.getId() + "'>ɾ��</a>" + " | " + "<a href='"+ basePath + "blog/showDetailBlogAction?blogId=" + blog.getId() + "'>�Ķ�ȫ��</a></label>");
																out.println("<hr /> <br />");
															}
						%>
					</div>
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
			<label>aice��Ȩ����&copy;2015</label>
		</div>
	</div>
</body>
<script type="text/javascript">
	function checkUser(){
		var name = '<%=name%>';
		var login = "��½";
		
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