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

  </head>
  
  <body>
  	<div class="container">
    
  	 <%--搜索栏 --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	 <%--菜单栏 --%>
  	 <%@include file="common/menubar.jsp"%>
  	 
    <%@include file="common/leftpanel.jsp"%>
    <!-- 显示面板 -->
    <div class="showPersonInfo">
    	<div class="editpersonhead">个人资料</div>
    	<s:form action="Student_editStudent" enctype="multipart/form-data" method="POST">
    		<table class="table" >
    		<tr>
	    		<td width="100px;"><s:text name="student_label_photo"/></td>
	    	    <td>
	    	    	<input name="headpic" type="text" value="${student.headpic}" style="display:none"/>
		    	    <img height="80"  width="80" alt="loading" src="<%=basePath%>images/${student.headpic}"/><br><br>
		    	    <s:file name="pic"/>
	    	    </td>	
    		</tr>
    		<tr>
			    <td width="100px"><s:text name="student_label_loginName"/></td>
			    <td><input name="username" type="text" value="${student.username}"/></td>
   			</tr>
   		    <tr>
		    	<td width="100px"><s:text name="student_label_stdnum"/></td>
		    	<td><input name="stdnum" value="${student.stdnum}"/></td>
    		</tr>
    		 <tr>
		    	<td width="100px"><s:text name="student_label_realname"/></td>
		    	<td><input name="realname" value="${student.realname}"/></td>
            </tr>
            <tr>
		    	<td width="100px"><s:text name="student_label_grade"/></td>
		    	<td><s:select  name="grade" list="{'大一','大二','大三','大四','研究生'}"/></td>	
    		</tr>
		    <tr>
		    	<td width="100px"><s:text name="student_label_major"/></td>
		    	<td><input  name="major" value="${student.major}"/></td>
		    </tr>
		    <tr>
		    	<td width="100px"><s:text name="student_label_phonenumber"/></td>
		    	<td><input  name="phonenumber" value="${student.phonenumber}"/></td>
		    </tr>
		    <tr>
		    	<td width="100px"><s:text name="student_label_email"/></td>
		    	<td><input  name="email" value="${student.email}" style="display:none"/>${student.email}</td>
		    </tr>
		    <tr>
		    	<td width="100px">账户余额：</td>
		    	<td><input  name="balance" value="${student.balance}" style="display:none"/>${student.balance}书币</td>
		    </tr>
		    <tr>
		    	<td width="100px">会员等级：</td>
		    	<td><input  name="level" value="${student.level}" style="display:none"/>${student.level}</td>
		    </tr>
		    <input  name="pwd" value="${student.pwd}" style="display:none"/>
		    <input  name="id" value="${student.id}" style="display:none"/>
    		</table>
    		<div class="editperson_submit"><s:submit key="editperson_submit" cssStyle="margin-top:20px;border-radius:4px;border:2px solid RGB(202,242,244);background-color:#02ba85;color:white;font-size:22px;width:120px;height:42px;"/></div>
    	</s:form>
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
