<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Cart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	  <h2>购物车</h2><hr>
     <table border=1 width=500>
      	<tr align="center" gbcolor="#dddddd">
      		<td>流水号</td>
      		<td>商品名称</td>
      		<td>价格</td>
      		<td>数量</td>
      		<td>金额</td>
      	</tr>
      	<c:forEach items="${carts }" var="cart" varStatus="s">
      	<tr align="center">
      		<td><c:out value="${cart.id }"/></td>
      		<td><c:out value="${cart.shopname }"/></td>
      		<td><c:out value="${cart.price }"/></td>
      		<td><c:out value="${cart.num }"/></td>
      		<td><c:out value="${cart.count }"/></td>
      	</tr>
      	</c:forEach>
      </table>
  </body>
</html>
