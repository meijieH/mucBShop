 <%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
 <%@ page import="com.ORM.Student" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://displaytag.sf.net"  prefix="display"%>

<!DOCTYPE HTML>
<html>
<head>
 <base href="<%=basePath%>">
 <meta http-equiv="Content-Type" content="text/html; charset=gbk" />

<title>��̨����-У԰�����齻��</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/css/admin.css" />
<link rel="shortcut icon" href="<%=basePath%>images/title.png">
<script>
	function show(n){
		document.getElementById(n).style.display="block";//��ʾ��򿪵Ĵ���
		document.getElementById("b"+n).className = "active";//���ǰ���ڶ�Ӧ��������ʽ
		for(var i=1;i<5;i++){
			if(i!=n){
				document.getElementById(i).style.display="none";//���ز���򿪵Ĵ���
				document.getElementById("b"+i).className = "";//��ȥ���ش��ڶ�Ӧ��������ʽ
			}
		}
	}
</script>
</head>

<body>
    <ul class="nav nav-pills nav-stacked admin_main_nav">
		  <li role="presentation" class="active" id="b1"><a onclick="show(1)" >�����鼮</a></li>
		  <li role="presentation" id="b2"><a  onclick="show(2)" >���ߴ���</a></li>
		  <li role="presentation" id="b3"><a onclick="show(3)" >�����鼮</a></li>
		 <!--  <li role="presentation" id="b4"><a onclick="show(4)" >���ж���</a></li> -->
	</ul>
    
    <div id="operation" >
         <iframe id="1" src="<%=basePath%>/admin/browseUncheckedBooks.jsp"
           allowtransparency="yes" height="750px;">
         </iframe>
         <iframe id="2" src="<%=basePath%>/admin/browseAppeals.jsp"
          allowtransparency="yes" style="display:none;" height="750px;">
         </iframe>          
         <iframe id="3" src="<%=basePath%>/admin/browseAllRegBooks.jsp"
          allowtransparency="yes" style="display:none;" height="750px;">
         </iframe>
         <iframe id="4" src="<%=basePath%>/admin/browseAllOrders.jsp"
          allowtransparency="yes" style="display:none;" height="750px;">
         </iframe>
    </div>
    
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/bootstrap.min.js"></script>
</body>

</html>
