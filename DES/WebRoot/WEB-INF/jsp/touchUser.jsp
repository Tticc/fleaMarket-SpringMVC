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
<script src="/DES/jQuery-plus/MyJS/myScript.js"></script>



</head>

<body style="background-color:#eee">
<jsp:include page="header.jsp"></jsp:include>
<div style="height:13%"></div>
<ol class="breadcrumb" style="background-color:#eee">
		<li><a href="/DES/index.jsp">樟树林论坛</a></li>
		<li><a href="/DES/index.jsp">跳蚤市场</a></li>
		<li class="active">用户信息</li>
	</ol>


	<div class="col-md-2"></div>
	<div class="col-md-8" style="height:100%">
	
	
	
	<div style="text-align:center;">
	<%-- <c:if test="${! empty status }"> --%>
			<h4>${status}</h4>
	<%-- </c:if> --%>
	</div>
	<h3>用户：${user.userName }</h3>
	
	<form action = "sendMessage/${user.id}" method = POST>
		<h4>发送消息</h4>
		<textarea rows="4" name="message" class="form-control" ></textarea>
		<input id = "send" type = "submit" value= "发送" class="btn btn-primary btn-lg"  />
	</form>
        
        
        
	</div>
	<div class="col-md-2"></div>
</body>
</html>
