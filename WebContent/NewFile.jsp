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
<link rel="stylesheet" href="css/style.css" />
<script src="Scripts/jquery/jquery-2.1.1.min.js"></script>
<script src="Scripts/layer/layer.js"></script>
<title>user center</title>
</head>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<body class="loginBody">
	<div class="box">
		<div id="div_photo" class="layer-photos-demo">
			<img style="width:100px; height:100px" src="res/upload/4/20150515141902_729.jpg" layer-src="res/upload/4/20150515141902_729.jpg" />
			<img style="width:100px; height:100px" src="res/upload/4/20150515141902_729.jpg" layer-src="res/upload/4/20150515141902_729.jpg" />
			<img style="width:100px; height:100px" src="res/upload/4/20150515141902_729.jpg" layer-src="res/upload/4/20150515141902_729.jpg" />
			<img style="width:100px; height:100px" src="res/upload/4/20150515141902_729.jpg" layer-src="res/upload/4/20150515141902_729.jpg" />
			<img style="width:100px; height:100px" src="res/upload/4/20150515141902_729.jpg" layer-src="res/upload/4/20150515141902_729.jpg" />
			<img style="width:100px; height:100px" src="res/upload/4/20150515141902_729.jpg" layer-src="res/upload/4/20150515141902_729.jpg" />
			<img style="width:100px; height:100px" src="res/upload/4/20150515141902_729.jpg" layer-src="res/upload/4/20150515141902_729.jpg" />
			<img layer-src="http://static.oschina.net/uploads/space/2014/0516/012728_nAh8_1168184.jpg" layer-pid="" src="http://static.oschina.net/uploads/space/2014/0516/012728_nAh8_1168184.jpg" alt="layer宣传图">		
		</div>
	</div>
</body>
<script type="text/javascript">
;!function(){
	layer.config({
	    extend: 'extend/layer.ext.js'
	});
	layer.ready(function(){ //为了layer.ext.js加载完毕再执行
	    layer.photos({
	        photos: '#div_photo'
	    });
	});
}();
</script>
</html>