<%@ page language="java" import="java.util.*,com.des.entity.*"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- nav -->
	<nav class="navbar navbar-default" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="/DES/index.jsp">&nbsp;&nbsp;樟树林论坛&nbsp;&nbsp;</a>
	</div>
	<div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="/DES/index.jsp">&nbsp;跳蚤市场&nbsp;</a></li>
			<li><a href="/DES/index.jsp">&nbsp;学习&nbsp;</a></li>
			<li class="dropdown"><a href="/DES/index.jsp" class="dropdown-toggle"
				data-toggle="dropdown">&nbsp;娱乐&nbsp;<b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li class="divider"></li>
					<li><a href="/DES/index.jsp">影音</a></li>
					<li class="divider"></li>
					<li><a href="/DES/index.jsp">二次元</a></li>
					<li class="divider"></li>
					<li><a href="/DES/index.jsp">游戏厅</a></li>
					<li class="divider"></li>
				</ul></li>

		</ul>
		<ul class="nav navbar-nav pull-right">
			<c:if test="${empty sessionScope.usern}">
				<li><a href="login">登录</a></li>
			</c:if>
			<c:if test="${!empty sessionScope.usern}">
				<li class="dropdown"><a href="/DES/index.jsp" class="dropdown-toggle"
					data-toggle="dropdown">&nbsp;${sessionScope.usern}&nbsp;<b
						class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="sell">出售商品</a></li>
						<li class="divider"></li>
						<li><a href="listMyGoods">我发布的商品</a></li>
						<li class="divider"></li>
						<li><a href="listMsg">查看消息</a></li>
						<li class="divider"></li>
						<li><a href="/DES/index.jsp">修改密码</a></li>
						<li class="divider"></li>
						<li><a href="logout">退出登录</a></li>
					</ul></li>
			</c:if>
			<li><a></a></li>
			<li><a></a></li>
		</ul>
	</div>
	</nav>
	<!-- nav -->

	