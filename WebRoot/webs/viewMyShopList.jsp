<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="e" uri="/eBook" %>
<%@page import="com.ORM.*"%>
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
	function sub_shoplist(){
		var checks=document.getElementsByName("check");
		var str="";
		
		for(var i=0;i<checks.length;i++)
		{
			if(checks.item(i).checked==true)
				str=str+checks.item(i).value+"-";
		}
	
		if(str=="")
		{
			alert("请选择需要结算的书籍");
			return;
		}
		
		str=str.substr(0,str.length-1);
		window.location.href="webs/Student_payFromShoplist.action?ids="+str;
		
	}
	</script>
  </head>
  
 <body class="editbody">
  	<div class="container">
  	
  	<%--搜索栏 --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	  <%--菜单栏 --%>
  	 <%@include file="common/menubar.jsp"%>
  	  	 
    <!-- 账号管理面板 -->
    <%@include file="common/leftpanel.jsp"%>
    <!-- 订单显示区 -->
    <div class="showPersonInfo">
    
		    <table class="table">
			    <tr><td>选择&nbsp;&nbsp;&nbsp;&nbsp;</td>
			    <td>书名&nbsp;&nbsp;&nbsp;&nbsp;</td>
			    <td>书价&nbsp;&nbsp;&nbsp;&nbsp;</td>
			    <td>出版社&nbsp;&nbsp;&nbsp;&nbsp;</td>
			    <td>卖家姓名&nbsp;&nbsp;&nbsp;&nbsp;</td>
			    <td>添加时间&nbsp;&nbsp;&nbsp;&nbsp;</td>
			    <td>编辑&nbsp;&nbsp;&nbsp;&nbsp;</td>
			    </tr>
				<%
					List<Shoplist> list=(List)request.getAttribute("shoplist");
					Iterator it=list.iterator();
					while(it.hasNext()){
					Shoplist item=(Shoplist)it.next();
				 %>
				<tr>
					<td><input type="checkbox" name="check" value="<%=item.getId() %>"></td>
					<td><%=item.getBook().getName() %></td>
					<td><%=item.getBook().getPrice() %></td>
					<td><%=item.getBook().getPress()%></td>
					<td><%=item.getBook().getStudent().getRealname() %></td>
					<td><%=item.getPreshoptime()%></td>
					<td><a href="<%=basePath%>/webs/Student_delShopListItem.action?id=<%=item.getId() %>">删除</a></td>
				</tr>
				<%
					} 
				%>
				</table>
				<br>
				<br>
				<input style="border-radius:4px;border:2px solid RGB(202,242,244); background-color:#02ba85;font-size:18px;color:white;padding:5px 20px;margin-left:400px;"" type="button" value="去结算" onclick="sub_shoplist()">
			
			<table>
			<%
				    List<Shoplist> invalid_list=(List)request.getAttribute("invalid_shoplist");
					Iterator invalid_it=invalid_list.iterator();
					while(invalid_it.hasNext()){
					Shoplist item=(Shoplist)invalid_it.next();
			 %>
			 <tr>
				<td></td>
				<td><%=item.getBook().getName() %></td>
				<td><%=item.getBook().getPrice() %></td>
				<td><%=item.getBook().getPress()%></td>
				<td><%=item.getStudent().getRealname() %></td>
				<td><%=item.getPreshoptime()%></td>
				<td><a href="<%=basePath%>/webs/Student_delShopListItem.action?id=<%=item.getId() %>">删除</a></td>
			</tr>
			<%
				} 
			%>
			</table>
    </div>
    </div>
     <s:if test="hasActionMessages()">
		   	<e:msgdialog basepath="<%=basePath%>">
		   		<s:actionmessage/>
		   	</e:msgdialog> 	
	   </s:if>
	<div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script> 
 </body>
</html>
