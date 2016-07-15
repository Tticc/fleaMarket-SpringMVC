<%@ page language="java" import="java.util.*,com.des.entity.*"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户-跳蚤市场</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link
	href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>




</head>

<body style="background-color:#eee">
<jsp:include page="header.jsp"></jsp:include>
<div style="height:13%"></div>
<ol class="breadcrumb" style="background-color:#eee">
		<li><a href="/DES/index.jsp">樟树林论坛</a></li>
		<li><a href="/DES/index.jsp">跳蚤市场</a></li>
		<li><a href="/DES/listMsg">消息列表</a></li>
		<li class="active">消息</li>
	</ol>


	<div class="col-md-2"></div>
	<div class="col-md-8" style="height:100%">
	<h3>消息详细</h3>
	<hr style="height:1px;border:none;border-top:2px solid #555555;" />
	<h4><a href = "/DES/touchUser/${msg.sender }">发送人：${userName}</a></h4>
	<h4>发送时间：${msg.sendtime }</h4>
	<h4>消息详情：<br></h4>
	<div style="border:3px solid #ccc;">
	<div style="margin:10px 40px 10px;height:300px">	
	<h4>${msg.message }</h4>	
	</div>
	</div>
	
        
	</div>

	<div class="col-md-2"></div>
</body>
</html>
