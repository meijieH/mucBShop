<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.fdiv{padding: 1px 1px 1px 1px;border-style:groove;border-color: gray;background-color: white;width: 230px;height: 180px;}
		.fdiv tr td{padding: 1px 2px 1px 2px;font-size:12px;}
	</style>
  </head>
  
  <body>
    <table class="fdiv">
    	<tr><td rowspan="2"><img src="../upload/${std.headpic }" width="100px" height="80px"></td><td>用户名/昵称：</td></tr>
    	<tr><td>${buyer.username }</td></tr>
    	<tr><td>联系方式：</td><td>${buyer.phonenumber}</td></tr>
    	<tr><td>邮箱：</td><td>${buyer.email}</td></tr>
    </table>
  </body>
</html>
