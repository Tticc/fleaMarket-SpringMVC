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

<title>我发布的商品-跳蚤市场</title>
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
		<li class="active">我的商品</li>
	</ol>


	<div class="col-md-2"></div>
	<div class="col-md-8" style="height:100%">
	
	<%-- <a class="list-group-item active">
	  	 已发布商品列表
		</a>
		<c:forEach var = "goods" items = "${user.goodsInfo}">
			<a href = "detail/${goods.id }" class = "list-group-item">
			${goods.title }
			</a>
		</c:forEach> --%>
    <table class = "table  table-hover" style="table-layout:fixed">
	<thead><tr><th width="55%"></th><th>类型</th><th>价格</th><th width="13%">发布时间</th><th>删除</th></tr></thead>
		<tbody>
			<c:forEach var="goods" items= "${user.goodsInfo}" >
				<tr >
					<%-- <td onclick="jump(${goods.id})" style="cursor:pointer">${goods.title}</td> --%>
					<td><a href="detail/${goods.id}">${goods.title}</a></td>
					<td>${goods.type}</td>
					<td>${goods.price}</td>
					<td>${goods.publishTime}</td>
					<td><a href="deleteGood/${goods.id}">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
        
	</div>
	<div class="col-md-2"></div>
</body>
</html>
