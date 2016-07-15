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
    
    <title>上传图片</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="jQuery-plus/css/default.css">
    <link href="jQuery-plus/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />	

  </head>
  
  <body>
  <div style="background-color:#eee">
  <jsp:include page="WEB-INF/jsp/header.jsp"></jsp:include>
  <ol class="breadcrumb" style="background-color:#eee">
		<li><a href="/DES/index.jsp">樟树林论坛</a></li>
		<li><a href="/DES/index.jsp">跳蚤市场</a></li>
		<li class="active">上传图片</li>
	</ol>
</div>	

  	<div class="htmleaf-container">

		<div class="container kv-main">
            <form enctype="multipart/form-data">
                <div class="form-group">
                    <input id="file-1" type="file" name = "file" multiple class="file" data-overwrite-initial="false" data-min-file-count="2">
                </div>
                <hr>
            </form>
        </div>
		
	</div>
	
	<script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js"></script>
    <script src="jQuery-plus/js/fileinput.js" type="text/javascript"></script>
    <script src="jQuery-plus/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <script>
	    $("#file-1").fileinput({
	        uploadUrl: 'upload', // you must set a valid URL here else you will get an error
	        allowedFileExtensions : ['jpg', 'png','gif'],
	        overwriteInitial: false,
	        maxFileSize: 1000,
	        maxFilesNum: 10,
	        //allowedFileTypes: ['image', 'video', 'flash'],
	        slugCallback: function(filename) {
	            return filename.replace('(', '_').replace(']', '_');
	        }
		});
	     $(document).ready(function() {
	        $("#test-upload").fileinput({
	            'showPreview' : false,
	            'allowedFileExtensions' : ['jpg', 'png','gif'],
	            'elErrorContainer': '#errorBlock'
	        });
	    }); 
		</script>
  </body>
</html>
