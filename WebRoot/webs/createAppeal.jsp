<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.ORM.Student"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="e" uri="/eBook" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>申诉</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>/css/index.css">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">

	<style>
	*{
	font-size:20px;
	}
	#container{background-color:#40A4D9;}
	#center{padding-left:200px;height:500px;width:900px;margin:0px auto;border: 10px double #FFF;line-height:50px;}

	#info{font-size:24px;font-family:"Courier New", Courier, monospace;color:#fff;}
	#srly{float:left;}
	#text{float:left;margin:0px 2px 0px 13px}
	.button{background-color:#02ba85;font-size:16px;font-family:"Microsoft YaHei UI", "微软雅黑";padding:6px 23px;color:white;margin:75px 80px 50px 550px;border-radius:3px;border:1px solid RGB(169,169,169);}
	</style>
  </head>
  
  <body>
    <div class="container">
  	 <%--搜索栏 --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	 <%--菜单栏 --%>
  	 <%@include file="common/menubar.jsp"%>
  	 
    <%@include file="common/leftpanel.jsp"%>
  	  	 
  	 
  	 <div id="center">
         <p style="font-size:28px;color:#02ba85;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我要投诉</p>
         <div id="info" >
             <form id="appinfo" method="post" style="font-size:18px;">
               <table>
               		<tr><td>投诉用户ID：</td><td><input type="text" name="studentByRespondentId.id" style="margin-top:10px;border-radius:2px;border:1px solid RGB(169,169,169)"/></td></tr>
               		<tr><td>投诉订单ID：</td><td><input type="text" name="order.id" style="margin-top:10px;border-radius:2px;border:1px solid RGB(169,169,169)" /></td></tr>
               		<tr><td colspan="2">投诉理由：</td></tr>
               		<tr><td colspan="2"><textarea name="reason" id="appreason" cols="70" rows="6"></textarea></td></tr>
               		<tr><td colspan="2"><input type="button" id="input" value="提交" class="button" onclick="subcheck()"></td></tr>
               </table>
               <%
               		Student std=(Student)session.getAttribute("student");
            		out.println("<input type='hidden' name='studentByComplainantId.id' value="+std.getId()+">");
                %>
             </form>
         </div>
  	 </div>
  	</div>
  	<script type="text/javascript">
  	function subcheck()
  	{
  		var respondent=document.getElementById("respone");
  		var order=document.getElementById("orderID");
  		var reason=document.getElementById("appreason");
  		var form1=document.getElementById("appinfo");
  		
  		if(respondent.value==''||order.value==''||reason.value=='')
  		{
  			alert("请填写完成信息！");
  			return;
  		}
  		
  		if(respondent.value.match(/^\d+$/)==null||order.value.match(/^\d+$/)==null)
  		{
  			alert("被申诉人的ID和订单的ID数据格式不正确");
  			return;
  		}
  		
  		form1.action="webs/Appeal_createAppeal.action";
  		form1.submit();
  	}
  	</script>
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
