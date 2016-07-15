<%@ page language="java" import="java.util.*,com.des.entity.*"
	pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//session.setAttribute("usern", null);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录-跳蚤市场</title>
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

<body>
<div style="background-color:#eee">
<jsp:include page="header.jsp"></jsp:include>
<ol class="breadcrumb" style="background-color:#eee">
		<li><a href="/DES/index.jsp">樟树林论坛</a></li>
		<li><a href="/DES/index.jsp">跳蚤市场</a></li>
		<li class="active">登录</li>
	</ol>
</div>
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div style="padding: 100px 50px 10px">
		<div style="color:red"><h4>${message}</h4></div>
			<form class="bs-example bs-example-form" method="POST" action="login">
				<div class="row">
					<div class="input-group  input-group-lg">
						<input id="username" onblur="checkBlur('用户名','username','disp1')" type="text" class="form-control" name="userName" placeholder="请输入用户名">
						<span id="disp1" class="input-group-addon" style="font-size:14px"></span> 
					</div>
					<br>
					<div class="input-group  input-group-lg">
						<input id="password" onblur="checkBlur('密码','password','disp2')" type="password" class="form-control" name="password" placeholder="请输入密码">
						<span id="disp2" class="input-group-addon" style="font-size:14px"></span> 
					</div>
					<br> <input id="login" class="btn btn-primary btn-lg btn-block"
						type="submit" value="登录" />
				</div>
			</form>
		</div>
	</div>
	<div class="col-md-4"></div>
</body>
</html>
