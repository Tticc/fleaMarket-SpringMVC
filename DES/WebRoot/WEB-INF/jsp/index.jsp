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

<title>跳蚤市场</title>
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
	

<script>
$(document).ready(function(){
	$("div.tiny").css({
		"cursor":"pointer",
		"padding": "5px 10px 0px",
		"float": "left",
		"margin-left": "2px",
		"margin-right":"2px",
		"color":"#444",
		"border-radius":"5px"
	});
	$("div.title").css({
		"cursor":"pointer",
		"margin":"10px",
		"width":"23%",
		"height":"47%",
		"float":"left",
		"background-color":"#f7f7f7",
		"border":"1px solid #aaa",
		"border-radius":"5px",
		"overflow":"hidden"
	});
	 $("div.tiny").mouseover(function(){
	 	 $("div.tiny").css({
			"background-color":"#eee",
			"color":"#444"
		}); 
		 $(this).css({
			"background-color":"#111",
			"color":"#fff"
		});	 
		
	});/*
	 $("div.tiny").mouseout(function(){
		$(this).css({
			"background-color":"#eee",
			"color":"#444"
		});
	}); */
	$("div.tiny").click(function(){
		$("div.tiny").css({
			"background-color":"#eee",
			"color":"#444"
		});
		$(this).css({
			"background-color":"#111",
			"color":"#fff"
		});
	});
});
</script>
<script>
/* 	function getInfo(type) {
	//function getInfo() {
		//var type = "手机";
		$.ajax({
			type : "POST",
			url : "testAjax",
			//我们用text格式接收  
			//dataType: "text",   
			//json格式接收数据  
			dataType : "json",
			data : {"types":type},
			success : function(jsonStr) {
				$("#ruleList").html("");
				//实例2个字符串变量来拼接下拉列表  
				//alert(jsonStr);  
				//使用jquery解析json中的数据  
				if (jsonStr == null) {
					$("#ruleList").html("没有数据");
				} else {
					var ruleListTemp = "<table class = \"table  table-hover\" style=\"table-layout:fixed\">";
					ruleListTemp += "<thead><tr><th width=\"65%\"></th><th>类型</th><th>价格</th><th width=\"13%\">发布时间</th></tr></thead><tbody>";
					$.each(jsonStr,function(n, value) {
						ruleListTemp += ("<tr onclick=\"jump("
						+ value.id+ ")\"onmouseover=\"setCursor()\"><td>" + value.title);
						ruleListTemp += ("</td><td>" + value.type);
						ruleListTemp += ("</td><td>" + value.price);
						ruleListTemp += ("</td><td>" + value.publishTime.toString());
						ruleListTemp += ("</td></tr>");
					});
					ruleListTemp += ("</tbody></table>");
					$("#ruleList").html(ruleListTemp);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				$("#ruleList").html("没有数据");
				//alert('获取数据失败');
				//alert(xhr);
				//alert(ajaxOptions);
				//alert(thrownError);
			}
		});
	} */
	function setCursor() {
		$("tr").css({
			"cursor" : "pointer"
		});
	}
	function jump(link) {
		window.location.href = "detail/" + link;
	}
	function getInfo(type) {
	//function getInfo() {
		//var type = "手机";
		$.ajax({
			type : "POST",
			url : "testAjax",
			//我们用text格式接收  
			//dataType: "text",   
			//json格式接收数据  
			dataType : "json",
			data : {"types":type},
			success : function(jsonStr) {
				$("#ruleList").html("");
				//实例2个字符串变量来拼接下拉列表  
				//alert(jsonStr);  
				//使用jquery解析json中的数据  
				if (jsonStr == null) {
					$("#ruleList").html("没有数据");
				} else {
					var ruleListTemp = "";
					//ruleListTemp += "<thead><tr><th width=\"65%\"></th><th>类型</th><th>价格</th><th width=\"13%\">发布时间</th></tr></thead><tbody>";
					$.each(jsonStr,function(n, value) {
						ruleListTemp += "<div style=\"cursor:pointer;margin:10px;width:23%;height:47%;float:left;background-color:#fff;border:1px solid #aaa;border-radius:5px\" onclick=\"jump('"+value.id+"')\">";
						
						ruleListTemp += "<div style=\"border-bottom:1px solid #aaa;height:80%;background-color:#fff;overflow:hidden\">";
						ruleListTemp += "<div style=\"margin:2%;\">";
						ruleListTemp += "<img src=\""+value.photo+"\" width=\"100%\" height=\"100%\" />";
						ruleListTemp += "</div></div>";
			
						ruleListTemp += "<div style=\"color:#000;height:20%;padding:2% 4% 2%\">";
						ruleListTemp += "<div style=\"font-size:15\">"+value.title+"</div>";
						ruleListTemp += "人气："+ value.readTimes+"${good.readTimes}&emsp;&emsp;";
						ruleListTemp += "卖家："+ value.linkName;
						ruleListTemp += "</div></div>";
			
					});
					
					$("#ruleList").html(ruleListTemp);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				$("#ruleList").html("没有数据");
				//alert('获取数据失败');
				//alert(xhr);
				//alert(ajaxOptions);
				//alert(thrownError);
			}
		});
	} 

</script>

</head>

<!-- <body style="background-color:#eee" onload='getInfo("all")'> -->
<body style="background-color:#eee">
<jsp:include page="header.jsp"></jsp:include>
<div style="height:13%"></div>
	<ol class="breadcrumb" style="background-color:#eee">
		<li><a href="/DES/index.jsp">樟树林论坛</a></li>
		<li class="active">跳蚤市场</li>
	</ol>
	<%-- ${user.password} --%>
	<div class="col-md-1"></div>
	<div class="col-md-10" style="height:100%">
	<div >
		<div class="tiny" onclick='getInfo("all")' >
			<label >全部</label>
		</div>
		<div class="tiny" onclick='getInfo("手机")' >
			<label>手机</label>
		</div>
		<div class="tiny" onclick='getInfo("书籍")' >
			<label>书籍</label>
		</div>
		<div class="tiny" onclick='getInfo("生活用品")' >
			<label>生活用品</label>
		</div>
		<div class="tiny"  onclick='getInfo("交通工具")' >
			<label>交通工具</label>
		</div>
		<div class="tiny" onclick='getInfo("房屋")' >
			<label>房屋</label>
		</div>
		</div>
		<div style="margin-top:4%;height:5%;width:100%">
		</div>
		<div id="ruleList" style="width:100%;">
		
		
		<c:forEach var="good" items="${goodlist}">
		<div class="title" onclick="jump('${good.id}')">
		<div style="border-bottom:1px solid #aaa;height:80%;background-color:#fff;overflow:hidden">
			<div style="margin:2%;">
			<img src="${good.photo}" width="100%" height="100%" />
			</div>
		</div>
		<div style="color:#000;height:20%;padding:2% 4% 2%">
			<div style="font-size:15">${good.title}</div>
			人气：${good.readTimes}&emsp;&emsp;
			卖家：${good.linkName}
		</div>
		</div>
		</c:forEach>
		
		
		
		<!-- <div class="title"></div>
		<div class="title"></div>
		<div class="title"></div>
		<div class="title"></div>
		<div class="title"></div>
		<div class="title"></div>
		<div class="title"></div>
		<div class="title"></div>
		<div class="title"></div> -->
		</div>
		<%-- <div style="padding:50px 20px 20px;background-color:#aaa"><!-- SHOW -->
			<div id="ruleList">
			
			
			<table class = "table  table-hover" style="table-layout:fixed">
			<thead><tr><th width="65%"></th><th>类型</th><th>价格</th><th width="13%">发布时间</th></tr></thead>
			<tbody>
				<c:forEach var="goods" items= "${goodlist}" >
					<tr onclick="jump(${goods.id})"onmouseover="setCursor()">
					<td>${goods.title}</td>
					<td>${goods.type}</td>
					<td>${goods.price}</td>
					<td>${goods.publishTime}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table> 
			
			
			</div>
		</div><!-- SHOW --> --%>
		

	</div>

	<div class="col-md-1	">
	<%-- <img alt="" src="${fileUrl }" />  --%>
	
	</div>

</body>
</html>
