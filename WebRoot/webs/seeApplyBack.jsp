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
    
    <title>�˿�����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="���������ѧ,��Ϣ����ѧԺ��urtpС��">
	<meta http-equiv="description" content="�鿴���������û����˿�����">
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
  	  	 
  	  <!-- �˺Ź������ -->
     <%@include file="common/leftpanel.jsp"%>
     
     <!--�ҵ��鼮��ʾ��-->
     <div class="showPersonInfo" >
     	<div class="displayTable">
     		<display:table name="orders" id="row" pagesize="10" requestURI="webs/Order_seeApplyBack.action" >
	     		<display:column title="���" sortable="true" headerClass="sortable" style="text-align:center;">
	     			${row_rowNum}
	     		</display:column>
	     		<display:column property="id" title="�������" style="text-align:center;"/>
	     		<display:column title="�鼮��Ϣ" style="text-align:center;">
	     			<div>�鼮���ƣ�${row.book.name}</div>
	     		    <div>�鼮״̬��${row.book.state}</div>
	     		    <div>���ۼ۸�${row.book.price}</div>
	     		</display:column>
	     		<display:column title="�����Ϣ" style="text-align:center;">
	     			<div>����ǳƣ�${row.studentByBuyerId.username }</div>
	     		    <div>�ֻ��ţ�${row.studentByBuyerId.phonenumber }</div>
	     		    <div>�������䣺${row.studentByBuyerId.email }</div>
	     		</display:column>
	     		<display:column  title="�˿�����"  style="text-align:center;">
	     			<s:url action="Order_seeApplyBack.action" id="applyBackOK">
	     				<s:param name="apbackid" value="%{#attr.row.id}"/>
	     			</s:url>
	     			<a href="${applyBackOK }">��׼</a>
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
