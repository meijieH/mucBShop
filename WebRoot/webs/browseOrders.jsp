<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://displaytag.sf.net"  prefix="display"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:text name="title_browsermyorders"/></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>/css/index.css">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">

	<script type="text/javascript">
	function recvOK(id){
		if(confirm("ȷ���ջ���")==false){
			return;
		}else{
			window.location.href="webs/Order_recvOK.action?id="+id;
		}
	}
	</script>
  </head>
  
 <body class="editbody">
  	<div class="container">	
  	 
  	 <%--������ --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	 <%--�˵��� --%>
  	 <%@include file="common/menubar.jsp"%>
  	 
    <!-- �˺Ź������ -->
    <%@include file="common/leftpanel.jsp"%>
    <!-- ������ʾ�� -->
    <div class="showPersonInfo">
	     <s:set name="label1" value="%{getText('label_rownum')}"/>
	     <s:set name="label2" value="%{getText('order_label_id')}"/>
	     <s:set name="label3" value="%{getText('order_label_generalinfo')}"/>
	     <s:set name="label4" value="%{getText('order_label_bookpic')}"/>
	     <s:set name="label5" value="%{getText('order_label_price')}"/>  
	     <s:set name="label6" value="%{getText('order_label_edit')}"/>
	     
	    <div class="displayTable">
     	<display:table name="myorders" id="row" pagesize="10" requestURI="webs/Student_browseOrders.action" >
     		<display:column title="${label1 }" sortable="true" headerClass="sortable" style="text-align:center;">
     			${row_rowNum}
     		</display:column>
     		<display:column property="id" title="${label2 }" style="text-align:center;"/>
     		<display:column title="${label3 }" style="text-align:center;">
     			<div>�鼮���ƣ�${row.book.name}</div>
     		    <div>������${row.count}��</div>
     		    <div>����״̬��${row.state}</div>
     		    <div>�ύ���ڣ�<s:date name="#attr.row.subDate" format="yyyy��MM��dd��" /></div>
     		    <div>�����ǳƣ�${row.studentBySalerId.username}</div>
     		    <div>������ʵ������${row.studentBySalerId.realname}</div>
     		    <div>������ϵ�绰��${row.studentBySalerId.phonenumber}</div>
     		</display:column>
     		<display:column  title="${label4}" style="text-align: center;">
     			<img src="<%=basePath%>/bookPics/${row.book.pic}" height="80" width="80">
     		</display:column>
     		<display:column property="book.price" title="${label5}" sortable="true" headerClass="sortable"  style="text-align:center;"/>		
     		<display:column  title="${label6}"  style="text-align:center;">
     			
     			
     			<s:url action="Order_payOrder" id="payOrder">
     				<s:param name="id" value="%{#attr.row.id}"/>
     			</s:url>
     			<s:url action="Order_delOrder" id="delOrder">
     				<s:param name="oid" value="%{#attr.row.id}"/>
     			</s:url>
     			<s:set name="tempstate" value="%{#attr.row.state}" scope="page"/>
     			<%
     				if(pageContext.getAttribute("tempstate").equals("������"))
     				{
     			%>
     					<a href="${payOrder }">֧��</a>&nbsp;<a  href="${delOrder}">����֧��</a>
     			<% 
     				}else if(pageContext.getAttribute("tempstate").equals("��֧��")){
     			%>
     					<a href="webs/Order_applyCredit.action?id=${attr.row.id}">�����˿�</a>
     					<a onclick="recvOK(${attr.row.id})" style="color: red;text-decoration: underline;">ȷ���ջ�</a>
     			<% }else if(pageContext.getAttribute("tempstate").equals("���"))
     				{
     					out.println("<a href='${delOrder}'>ɾ��</a>");
     				}
     			 %>
     			
     		</display:column>     				
     	</display:table>
    </div>
    </div>
    <div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
 </body>
</html>
