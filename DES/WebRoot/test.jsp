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

<title>test-跳蚤市场</title>
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
	function setCursor() {
		$("tr").css({
			"cursor" : "pointer"
		});
	}
	function jump(link) {
		window.location.href = "detail/" + link;
	}

	function asd(type) {
		//var type = "手机";
		$
				.ajax({

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
							$
									.each(
											jsonStr,
											function(n, value) {
												ruleListTemp += ("<tr onclick=\"jump("
														+ value.id
														+ ")\"onmouseover=\"setCursor()\"><td>" + value.title);
												ruleListTemp += ("</td><td>" + value.type);
												ruleListTemp += ("</td><td>" + value.price);
												ruleListTemp += ("</td><td>" + value.publishTime
														.toString());
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
	}
</script>



</head>

<body style="background-color:#eee">
<jsp:include page="WEB-INF/jsp/header.jsp"></jsp:include>



	<div class="col-md-2"></div>
	<div class="col-md-8" style="height:100%">
	<div id="elec" onclick='asd("all")'
			style="cursor:pointer; padding: 5px 10px 0px; float: left; margin-left: 2px; margin-right:2px">
			<label>全部</label>
		</div>
		<div id="elec" onclick='asd("手机")'
			style="cursor:pointer; padding: 5px 10px 0px; float: left; margin-left: 2px; margin-right:2px">
			<label>手机</label>
		</div>
		<div onclick='asd("书籍")'
			style="cursor:pointer; padding: 5px 10px 0px; float: left; margin-left: 2px; margin-right:2px">
			<label>书籍</label>
		</div>
		<div onclick='asd("生活用品")'
			style="cursor:pointer; padding: 5px 10px 0px; float: left; margin-left: 2px; margin-right:2px">
			<label>生活用品</label>
		</div>
		<div  onclick='asd("交通工具")'
			style="cursor:pointer; padding: 5px 10px 0px; float: left; margin-left: 2px; margin-right:2px">
			<label>交通工具</label>
		</div>
		<div onclick='asd("房屋")'
			style="cursor:pointer; padding: 5px 10px 0px; float: left; margin-left: 2px; margin-right:2px">
			<label>房屋</label>
		</div>
		<div style="padding:50px 20px 20px"><!-- SHOW -->
			<div id="ruleList"></div>
		</div><!-- SHOW -->
		
<!-- 上传文件 -->
<%-- 		<form action="${pageContext.request.contextPath }/servlet/UploadServlet1" method="post"  
                enctype="multipart/form-data">  
			<span style="white-space:pre"></span>选择文件：  
            <input type="file" name="upload"/>  
            <input type="submit" value="上传"/>  
        </form> 
        <form enctype="multipart/form-data">
                <div class="form-group">
                    <input id="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="2">
                </div>
        </form> --%>
        
	</div>

	<div class="col-md-2"></div>
</body>
</html>
