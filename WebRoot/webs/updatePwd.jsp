<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="e" uri="/eBook" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:text name="title_editstudent"/></title>
    
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
	function check()
	{
		var newPwd=document.getElementsByName("newPwd")[0];
		var newPwdCheck=document.getElementsByName("newPwdCheck")[0];
		if(newPwd.value!=newPwdCheck.value)
		{
			alert("两次新密码输入不正确");
			return false;
		}
		return true;
	}
	</script>
  </head>
  
  <body>
  	<div class="container">
    <%--搜索栏 --%>
  	 <%@include file="common/searcolumn.jsp"%><!--下面这些set是什么  -->
     <s:set name="label1" value="%{getText('label_rownum')}"/>
     <s:set name="label2" value="%{getText('book_label_name')}"/>
     <s:set name="label3" value="%{getText('book_label_price')}"/>
     <s:set name="label4" value="%{getText('book_label_type')}"/>
     <s:set name="label5" value="%{getText('book_label_pic')}"/>
     
  	 <%--菜单栏 --%>
  	 <%@include file="common/menubar.jsp"%>	
  	 
    <%@include file="common/leftpanel.jsp"%>
    <!-- 显示面板 -->
    <div class="showPersonInfo">
    	<div class="editpersonhead">修改密码</div>
    	<form action="webs/updatePwd.action"  method="POST" onsubmit="return check();">
    		<table>
    			<tr><td>原密码：</td><td><input type="password" name="oldPwd"/></td></tr>
    			<tr><td>新密码：</td><td><input type="password" name="newPwd"/></td></tr>
    			<tr><td>确认密码：</td><td><input type="password" name="newPwdCheck"/></td></tr>
    		</table>
    		<div class="updatepassword"><input type="submit" value="保存密码" style=""margin-top:20px;border-radius:4px;border:2px solid RGB(202,242,244);background-color:#02ba85;color:white;font-size:22px;width:120px;height:42px;""/></div>
    	</form>
    </div>
    <s:if test="hasFieldErrors()">
    <e:msgdialog basepath="<%=basePath%>">
    	<s:fielderror/>
    </e:msgdialog>	
    </s:if>
    <s:if test="hasActionMessages()">
    	<e:msgdialog basepath="<%=basePath%>">
    	<s:actionmessage/>
    </e:msgdialog>	
    </s:if>
    
    </div>
    <div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
  </body>
</html>
