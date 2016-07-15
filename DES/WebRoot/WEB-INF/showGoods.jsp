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
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <jsp:include page="jsp/header.jsp"></jsp:include>
    <label>商品名</label><br>
    <input type="text" name="goodsName" value="${goodsInfo.goodsName}"/><br>
    <label>商品类型</label><br>
    <input type="text" name="type" value="${goodsInfo.type}"/><br>
    <label>商品价格</label><br>
    <input type="text" name="price" value="${goodsInfo.price}" /><br>
    <label>联系人</label><br>
    <input type="text" name="linkName" value="${goodsInfo.linkName}" /><br>
    <label>联系电话</label><br>
    <input type="text" name="phone" value="${goodsInfo.phone}" /><br>    
    <label>商品详情</label><br>
    <input type="text" name="detail" value="${goodsInfo.detail}" /><br> 
    <label>图片</label><br>
    <input type="text" name="photo" value="${goodsInfo.photo}" /><br>
    <label>标题</label><br>
    <input type="text" name="title" value="${goodsInfo.title}" /><br>

  </body>
</html>
