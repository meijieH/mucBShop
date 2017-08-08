<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.ORM.Student" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net"  prefix="display"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:text name="index_title"></s:text></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
  	  	 
   
    <%--书籍展示区 --%>
     <div class="displayTable">
     	<display:table name="list" id="row" pagesize="10" requestURI="webs/Appeal_getAppeals.action" >
     		<display:column title="序号" sortable="true" headerClass="sortable" style="text-align:center;">
     			${row_rowNum}
     		</display:column>
     		<display:column  title="申诉人"  style="text-align:center;">
     			申诉人昵称：${row.studentByComplainantId.username}<br>
     			申诉人真实姓名：${row.studentByComplainantId.realname}<br>
     		</display:column>
     		<display:column  title="申诉内容"  style="text-align:center;">
     			被申诉人真实姓名：${row.studentByRespondentId.realname}<br>
     			被申诉人昵称：${row.studentByRespondentId.username}<br>
     			被申诉人联系方式：${row.studentByRespondentId.phonenumber}<br>
     			申诉理由：${row.reason} 
     		</display:column>
     		<display:column  title="关联订单"  style="text-align:center;">
     			订单编号：${row.order.id }<br>
     			书籍：${row.order.book.name }<br>
     			书价：${row.order.book.price }
     		</display:column>
     		<display:column  title="管理员答复"  style="text-align:center;" property="reply"/>
     	</display:table>
     </div>
    </div> 
    <div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
  </body>
</html>
