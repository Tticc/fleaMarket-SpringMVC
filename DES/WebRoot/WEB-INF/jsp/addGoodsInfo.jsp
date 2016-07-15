<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发布商品-跳蚤市场</title>
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
		$("#add").mouseover(function(){
			$("#add").css({
				 "background-color": "#222",
                 "color":"#fff"
			});
		});
		$("#add").mouseout(function(){
			$("#add").css({
			"background-color": "white",
			"color":"black"
			});
		});
		var count = 2;
		$("#add").click(function(){
			if(++count<10){
				var html = '<input type="file" name="file"/> <br>';
				$("#uploadPhoto").append(html);
			}else{
				alert("最多只能上传9张图片！");
			}
		});
		$("#submit").click(function(){
			//alert("${sessionScope.usern}");
			if('${sessionScope.usern}'==""){
				alert("未登录");
				return false;
			}
			if(Trim($("#goodsName").val())==""||isNaN(Trim($("#price").val()))||Trim($("#title").val())==""){
				return false;
			}			
		});
	});
</script>
<script src="/DES/jQuery-plus/MyJS/myScript.js"></script>

</head>
  
  <body>
  <div style="background-color:#eee">
<jsp:include page="header.jsp"></jsp:include>
<div style="height:13%"></div>
<ol class="breadcrumb" style="background-color:#eee">
		<li><a href="/DES/index.jsp">樟树林论坛</a></li>
		<li><a href="/DES/index.jsp">跳蚤市场</a></li>
		<li class="active">出售商品</li>
	</ol>
</div>
  <div class="col-md-4"></div>
  <div class="col-md-5">
  <div style="padding:10px 30px 0px">
    <form method="POST" action="addGoods" enctype="multipart/form-data">
    <label>商品名</label><br>
    <input id="goodsName" onblur="checkBlur('商品名','goodsName','disp1')" type="text"  class="form-control" name="goodsName"/>
    <label id="disp1"></label><br>
    <label>商品类型</label><br>
    <select class="form-control" name="type">
         <option>手机</option>
         <option>书籍</option>
         <option>生活用品</option>
         <option>交通工具</option>
         <option>房屋</option>
      </select>
    <!-- <input type="text"  class="form-control" name="type"/><br> -->
    <label>商品价格</label><br>
    <input id="price" onblur="checkNum('price','disp2')" type="text"  class="form-control" name="price" value="0"/>
    <label id="disp2"></label><br>
    <label>联系人</label><br>
    <input type="text"  class="form-control" name="linkName"/><br>
    <label>联系电话</label><br>
    <input type="text"  class="form-control" name="phone"/><br>    
    <label>商品详情</label><br>
    <textarea class="form-control" rows="4" cols="" name="detail"></textarea><br>
    <!-- <input type="text" class="form-control" name="detail"/><br>  -->
    <label>标题</label><br>
    <input id="title" onblur="checkBlur('标题','title','disp3')" type="text"  class="form-control" name="title"/>
    <label id="disp3"></label><br>
    <br>
	<!-- <button id="upload">上传图片</button> -->
	<div id="uploadPhoto">
	<label>图片&nbsp;&nbsp;&nbsp;</label><label id="add" style="cursor:pointer;border-radius:5px">增加上传(最多9张)</label>
	<input type="file" name="file"/> <br>
  	<input type="file" name="file" /> <br>
  	</div>
    <input id="submit" type="submit" class = "btn btn-primary" value="发布"/>
    </form>
    <br>
    <br>
    <br>
    </div>
    
    </div>
    <div class="col-md-2"></div>
    
  </body>
</html>
