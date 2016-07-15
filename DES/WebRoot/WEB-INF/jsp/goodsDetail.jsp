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



<title>商品详情-跳蚤市场</title>
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
		<li class="active">商品详情</li>
	</ol>
	<div class="col-md-2"></div>
	<div class="col-md-9">
		<div style="border:3px solid #f7f7f7"><!-- 边框 -->
			<div style="margin:10px">
				<h2>
					<c:out value="${goodsInfo.title }"></c:out>
					-
					<c:out value="${goodsInfo.price }"></c:out>
					元
				</h2>
				<br>
				<c:out value="${goodsInfo.publishTime }" />
				发布&emsp; 浏览次数：
				<c:out value="${goodsInfo.readTimes }" />				
				&emsp;&emsp; 
				<a href = "/DES/touchUser/${goodsInfo.user.id}">发布人：
				<c:out value="${goodsInfo.user.userName }"></c:out>
				</a>
				<hr style="height:1px;border:none;border-top:2px solid #555555;" />
				<h4>
					类&emsp;型：
					<c:out value="${goodsInfo.type}"></c:out>
				</h4>
				<h4>
					价&emsp;格：
					<c:out value="${goodsInfo.price}"></c:out>
				</h4>
				<h4>
					联系人：
					<c:out value="${goodsInfo.linkName }"></c:out>
				</h4>
				<h4>
					电&emsp;话：
					<c:out value="${goodsInfo.phone }"></c:out>
				</h4>
				<div
					style="height:30px;background-color:#f7f7f7;border:1px solid #ddd;font-size:14px;font-weight:bold;margin:0 0px 30px;">
					<div style="padding:4px 20px 10px">详情描述</div>
				</div>
				<div style="font-size:15px;margin:5px 10px 10px 10px;">
					<c:out value="${goodsInfo.detail }"></c:out>
				</div>
				<div
					style="height:30px;background-color:#f7f7f7;border:1px solid #ddd;font-size:14px;font-weight:bold;margin:0 0px 30px;">
					<div style="padding:4px 20px 10px">物品照片</div>
				</div>
				<div style="font-size:15px;margin:5px 10px 10px 10px;">
					<%-- <c:out value="${goodsInfo.photo }"></c:out> --%>
					<c:choose>
					<c:when test="${!empty photos }">
						<c:forEach var = "photo" items="${photos }">
							<img src="${photo}" width="100%">
						</c:forEach>
						<%-- <img src="${photos[0]}" width="100%"> --%>
					</c:when>
					<c:otherwise>
						没有图片
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- <hr style="height:1px;border:none;border-top:2px solid #555555;" /> -->
			<div style="margin:40px 0px 0px 0px">
			
			<table class="table" style="table-layout:fixed">
			<!-- <thead>
			<tr>
			<th>类型</th>
			<th>价格</th>
			<th width="13%">发布时间</th>
			</tr>
			</thead> -->
			<tbody>
			
			
				<!-- <tr>
					<td width=25%>1楼：</td>
					<td>宇宙是一座黑暗森林，每个文明都是带枪的猎人，像幽灵般潜行于林间，轻轻拨开挡路的树枝，竭力不让脚步发出一点儿声音，
				连呼吸都小心翼翼，他必须小心，因为林中到处都有与他一样潜行的猎人。如果他发现了别的生命，不管是不是猎人，
				不管是天使还是魔鬼，不管是娇嫩的婴儿还是步履蹒跚的老人，也不管是天仙般的少女还是天神般的男神，
				能做的只有一件事：开枪消灭之，在这片森林中，他人就是地狱，就是永恒的威胁，
				任何暴露自己存在的生命都将很快被消灭。这就是宇宙文明的图景，这就是对费米悖论的解释，</td>
				</tr>
				<tr>
					<td width=25%>2楼：</td>
					<td>宇宙是一座黑暗森林，每个文明都是带枪的猎人，像幽灵般潜行于林间，轻轻拨开挡路的树枝，竭力不让脚步发出一点儿声音，
				连呼吸都小心翼翼，他必须小心，因为林中到处都有与他一样潜行的猎人。如果他发现了别的生命，不管是不是猎人，
				不管是天使还是魔鬼，不管是娇嫩的婴儿还是步履蹒跚的老人，也不管是天仙般的少女还是天神般的男神，
				能做的只有一件事：开枪消灭之，在这片森林中，他人就是地狱，就是永恒的威胁，
				任何暴露自己存在的生命都将很快被消灭。这就是宇宙文明的图景，这就是对费米悖论的解释，</td>
				</tr> -->
				<c:set var = "count" value = "0"/>
				<c:forEach var = "comments" items="${goodsInfo.comment }" >
					<tr>
						<c:set var="count" value="${count+1 }"/>
						<td width=25% height="200px">
							<div>
								${count}楼							
							</div>
							<div style="margin:5px 20px 5px">
								<a href = "/DES/touchUser/${comments.sender.id}">${comments.sender.userName }</a>
							</div>
						</td>
						<td>${comments.comment}</td>
					</tr>					
				</c:forEach>
				</tbody>
			</table>
			</div>
			
			
			
			
		</div><!-- 边框 -->
		
		
		<form action="addComment/${goodsInfo.id}" method="POST" ><!-- 评论区 -->
		<div style="margin:10px 20% 10px 0px;padding:5px">
		<h4>评论：</h4>
		<!-- <input type="textarea" style="height:100px;width:100%"/> -->
		<textarea name = "comment" class="form-control" rows="5" style="width:100%"></textarea>
		<input id="comment" type="submit" class="btn btn-primary btn-lg" style="margin:5px 0px 0px;float:right" value="发表"/>
		</div>
		</form><!-- 评论区 -->
		<br><br><br><br><br><br><br><br><br>


	</div>
	<div class="col-md-1"></div>
</body>
</html>
