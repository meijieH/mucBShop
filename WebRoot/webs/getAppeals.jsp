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
  	 <%--������ --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	  <%--�˵��� --%>
  	 <%@include file="common/menubar.jsp"%>
  	  	 
   
    <%--�鼮չʾ�� --%>
     <div class="displayTable">
     	<display:table name="list" id="row" pagesize="10" requestURI="webs/Appeal_getAppeals.action" >
     		<display:column title="���" sortable="true" headerClass="sortable" style="text-align:center;">
     			${row_rowNum}
     		</display:column>
     		<display:column  title="������"  style="text-align:center;">
     			�������ǳƣ�${row.studentByComplainantId.username}<br>
     			��������ʵ������${row.studentByComplainantId.realname}<br>
     		</display:column>
     		<display:column  title="��������"  style="text-align:center;">
     			����������ʵ������${row.studentByRespondentId.realname}<br>
     			���������ǳƣ�${row.studentByRespondentId.username}<br>
     			����������ϵ��ʽ��${row.studentByRespondentId.phonenumber}<br>
     			�������ɣ�${row.reason} 
     		</display:column>
     		<display:column  title="��������"  style="text-align:center;">
     			������ţ�${row.order.id }<br>
     			�鼮��${row.order.book.name }<br>
     			��ۣ�${row.order.book.price }
     		</display:column>
     		<display:column  title="����Ա��"  style="text-align:center;" property="reply"/>
     	</display:table>
     </div>
    </div> 
    <div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
  </body>
</html>
