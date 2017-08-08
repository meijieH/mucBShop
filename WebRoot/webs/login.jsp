<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="e" uri="/eBook" %>
<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>"/>     
    <title><s:text name="title_label_index"></s:text></title>   
    <link rel="stylesheet" href="<%=basePath%>/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/login.css">
    <link rel="shortcut icon" href="<%=basePath%>images/title.png">
</head>
    <body style="background-image: url(images/bg1.jpg);" >
    	<div id="login" style="margin-left:230px;">
    		<h3 style="color:#02ba85">&nbsp;&nbsp;&nbsp;Welcome to MUC eshop</h3>
    		<hr />
    		<form action="webs/Student_login.action" class="navbar-form  navbar-left" style="margin-top:40px;" role="form" onsubmit="return check()" method="post">
			   	    <div class="form-group form-login">
			   	    	&nbsp;&nbsp;
						   	    	<%-- <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;
						   		    <input class="user" type="text" placeholder="请输入用户名" /> --%>
			   		    <img src="images/user_icon.png" style="width:35px;height:35px;"/> 
            			<s:textfield  name="username" cssClass="login_box_input"/>
			   	    </div>
			   	    <br>
			   	    <br />
			   	    <br />
			   	    <div class="form-group form-login">
			   	    	&nbsp;&nbsp;
							   	    	<%-- <span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;
							   		    <input class="user" type="text" placeholder="请输入密码" /> --%>
			   		     <img src="./images/pwd_icon.png" style="width:40px;height:40px;"/> 
            		    <s:password name="pwd" cssClass="login_box_input"/>
			   	    </div>
			   	    <br>
			   	    <br />
			   	    <br />
			   	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        <input type="button"  onclick="window.open('<%=basePath%>webs/regStudent.jsp')"  class="btn login_button_reg" value="注册"/>
            	    <s:submit key="label_submit" cssClass="btn login_button_login"/>
			        <br />
			        <br />
			        <br>
			        <h4 style="color:#02ba85;font-size:24px;font-family:Arial,Microsoft YaHei,Simsun;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校园二手书交易平台</h4>
			        <br />
			   
			        <p style="text-align:right;">@MUC eshop团队</p>
			        </div>
	    	</form>
    	</div>
    	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
        <script src="js/jquery.min.js"></script>
    	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>