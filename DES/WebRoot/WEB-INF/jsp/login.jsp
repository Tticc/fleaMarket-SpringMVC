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

<!-- 登录界面css -->
<link rel="stylesheet" type="text/css" href="/DES/css/login.css" />
        
	
	
<!-- 导航栏 start -->

<script>
$(function () {

$(window).scroll(function () {
//导航
if ($(window).scrollTop() > 100) {
$('.header').removeClass('large').addClass('small');
//$('.header').attr('class','header small');
} else {
$('.header').removeClass('small').addClass('large');
}
});
});
</script>
<!-- 导航栏 end -->
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<section id="content">
		<form method="POST" action="login">
			<h1>登录</h1>
			<div>
				<input name="userName" type="text" placeholder="用户名" required="" id="username" />
			</div>
			<div>
				<input name="password" type="password" placeholder="密码" required="" id="password" />
			</div>
			<div>
				<input type="submit" value="登录" />
				<a href="#">忘记密码</a>
				<a href="#">注册</a>
			</div>
		</form><!-- form -->
		<div class="button">
			<br>
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
</body>
</html>
