<!--
	***************
	@auto aice
	***************
	copyright 2015
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.aice.model.Sort"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="res/image/logo.ico" type="image/x-icon" />
<link rel="shortcut icon" href="res/image/logo.ico" type="image/x-icon" />
<style>
a {
	text-decoration: none;
}
</style>
<title>addSort</title>
</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	Sort sort;
	ArrayList listSort = (ArrayList) session.getAttribute("listSort");
	Iterator iterator = listSort.iterator();
%>
<body style="text-align: center">
	<h1>Sort Add</h1>
	<form action="addSortAction" method="post">
		sortName:<input type="text" name="sortName" /> <br /> <input
			type="submit" value="add" />
	</form>
	<div style="border: 1px solid #ccffcc; text-align: left;">
		<form action="" method="post">
			<%
				while (iterator.hasNext()) {
					sort = (Sort) iterator.next();
					
					out.println("<input type='text' style='border:none' value='" + sort.getSortName() + "' readonly='readonly' id='"+ "update" + sort.getId() + "' />" + "(" + "<a href='#fsf'>" + sort.getCount() + "</a>" + ")");

					out.println("<a href='#' onclick='updateSort(" + sort.getId() + ");' id='save" + sort.getId() + "'>" + "update" + "</a>");

					out.println("<a href='" + basePath + "deleteSortAction?sortId=" + sort.getId() + "'>" + "delete" + "</a> <br /> <br /> <hr />");
				}
			%>
		</form>
	</div>
</body>
<script type="text/javascript">
	function updateSort(sortId){
		var up = document.getElementById("update" + sortId);
		var sa = document.getElementById("save" + sortId);
		var sortName = up.value;
		up.readOnly = false;
		up.focus();
		up.style.border = "thin dotted #FF0000";
		if(sa.text == "save"){
			sa.href="<%=basePath%>" + "updateSortAction?sortId=" + sortId + "&sortName=" + sortName;
		}
		sa.innerText = "save";
	}
</script>
</html>