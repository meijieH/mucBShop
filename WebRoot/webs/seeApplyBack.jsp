<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@taglib uri="http://displaytag.sf.net"  prefix="display"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>退款申请</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="中央民族大学,信息工程学院，urtp小组">
	<meta http-equiv="description" content="查看来自其他用户的退款申请">
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>/css/index.css">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
	
  </head>
  
  <body>
   <div class="container">
   	  <%--搜索栏 --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	  <%--菜单栏 --%>
  	 <%@include file="common/menubar.jsp"%>
  	  	 
  	  <!-- 账号管理面板 -->
     <%@include file="common/leftpanel.jsp"%>
     
     <!--我的书籍显示区-->
     <div class="showPersonInfo" >
     	<div class="displayTable">
     		<display:table name="orders" id="row" pagesize="10" requestURI="webs/Order_seeApplyBack.action" >
	     		<display:column title="序号" sortable="true" headerClass="sortable" style="text-align:center;">
	     			${row_rowNum}
	     		</display:column>
	     		<display:column property="id" title="订单编号" style="text-align:center;"/>
	     		<display:column title="书籍信息" style="text-align:center;">
	     			<div>书籍名称；${row.book.name}</div>
	     		    <div>书籍状态；${row.book.state}</div>
	     		    <div>出售价格：${row.book.price}</div>
	     		</display:column>
	     		<display:column title="买家信息" style="text-align:center;">
	     			<div>买家昵称：${row.studentByBuyerId.username }</div>
	     		    <div>手机号；${row.studentByBuyerId.phonenumber }</div>
	     		    <div>电子邮箱：${row.studentByBuyerId.email }</div>
	     		</display:column>
	     		<display:column  title="退款申请"  style="text-align:center;">
	     			<s:url action="Order_seeApplyBack.action" id="applyBackOK">
	     				<s:param name="apbackid" value="%{#attr.row.id}"/>
	     			</s:url>
	     			<a href="${applyBackOK }">批准</a>
	     		</display:column>     				
	     	</display:table>
     	</div>
     </div>
   </div>
   <div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
  </body>
</html>
